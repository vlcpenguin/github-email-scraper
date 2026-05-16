local copas = require("copas")
local http = require("copas.http")
local ltn12 = require("ltn12")
local semaphore = copas.semaphore.new(100)

local scraping = {}

local function Get(targetUrl)
  print("Getting: "..targetUrl)
	local response_body = {}
	result, status = http.request{
		method="GET",
		url=targetUrl,
		sink = ltn12.sink.table(response_body)
	}
  print("Done: "..targetUrl)
	local body = table.concat(response_body)
	return body, status
end

function ScrapePatchURLForEmail(targetUrl)
	local body = Get(targetUrl)
	if not body then return nil end

	local extractedEmail = body:match("From: .- <(.-)>")
	return extractedEmail
end

function ScrapeRepositoryForPatchURLs(targetUrl, username)
	local patchTable = {}
	local commitsURL = targetUrl.."commits?author="..username
	local patchBaseUrl = targetUrl.."commit/"
	local body, status = Get(commitsURL)
	if status ~= 200 then
		print("Request failed with status code: "..status)
		print(commitsURL)
	end
	if not body then return nil end


	local commitHashes = body:gmatch('"oid":"(.-)","url"')
	for commitHash in commitHashes do
		local patchUrl = patchBaseUrl..commitHash..".patch"
		table.insert(patchTable, patchUrl)
	end
	if #patchTable < 1 then return nil end
	return patchTable
end

function scraping.GetEmailsFromRepository(username, targetRepository)
	local repoEmails = {}
	local repoUrl = "https://github.com/"..username.."/"..targetRepository.."/"
	local patchUrls = ScrapeRepositoryForPatchURLs(repoUrl, username)
	if not patchUrls then
		print("[WARNING] No commits associated with account on repository: "..repoUrl)
		return nil
	end
	local remaining = #patchUrls

  print("Waiting for threads...")
	for _, patchUrl in ipairs(patchUrls) do
		copas.addthread(function()
			semaphore:take(1)
			local emailFromPatchFile = ScrapePatchURLForEmail(patchUrl)
			semaphore:give(1)
			if emailFromPatchFile then
				table.insert(repoEmails, emailFromPatchFile)
			end

			remaining = remaining - 1
		end)
	end
	while remaining > 0 do
		copas.sleep(0)
	end

	if #repoEmails < 1 then print("No repo emails retrieved: " .. repoUrl) return nil end
	return repoEmails
end

function scraping.GetReposFromUsername(username)
	local repos = {}
	local profileUrl = "https://github.com/"..username.."?tab=repositories"
	local body, status = Get(profileUrl)
	if status == 404 then
		print("Profile does not exist: "..username)
		return nil
	end
	if status ~= 200 then
		print("Request failed with status code: "..status)
		print(profileUrl)
		return nil
	end
	local escapedUsername =
	username:gsub("([%(%)%.%%%+%-%*%?%[%]%^%$])", "%%%1")
	local regex = '<a href="/' .. escapedUsername .. '/(.-)"'
	local matchedRepos = body:gmatch(regex)
	for repo in matchedRepos do
		table.insert(repos, repo)
	end

	if #repos < 1 then print("No repos retrieved: " .. profileUrl.. " (HINT: Have you checked the case of the username?)") return nil end
	return repos
end

function scraping.CrawlEmailsFromGithubProfile(username)
	local emails = {}
	local repos = scraping.GetReposFromUsername(username)
	if repos == nil then
		print("No repos found on profile: "..username)
		return nil
	end
  print("Waiting for threads...")
  local remaining = #repos
	for _, repo in ipairs(repos) do
    copas.addthread(function()
     semaphore:take(1)
      local email = scraping.GetEmailsFromRepository(username, repo)
      semaphore:give(1)
      if email == nil then
        print("[WARNING] Couldn't find emails on targets repo: "..repo)
      end


      table.insert(emails, email)
      remaining = remaining - 1

    end)
 	end
  while remaining > 0 do
    copas.sleep(0)
  end

	if #emails < 1 then print("Couldn't find any emails on target profile: "..username) return nil end
	return emails
end

return scraping
