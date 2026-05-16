local copas = require("copas")
local t_utils = require("util/table_utils")
local scraping = require("util/scraping")

local username = arg[1]
io.stdout:flush()

local function Main()
	if username == nil then
		print("Usage: " .. arg[0] .. " <username>")
		return
	end
	print("Target: "..username)
	print("Scraping... (can take up to a couple minutes on big profiles due to shit multithreading)")
	local emails = scraping.CrawlEmailsFromGithubProfile(username)
	local collection = {}

	-- Collect All Emails From All Repositories
	if emails then
		for _, emailsInCurrentRepository in ipairs(emails) do
			for _, v in ipairs(emailsInCurrentRepository) do
				table.insert(collection, v)
			end
		end
	end

	-- Calculate Confidence score for all emails
	local confidenceArray = t_utils.calculateConfidence(collection)
	local sortedConfidence = {}

	-- Copy emails into sorted confidence for sorting
	for email, _ in pairs(confidenceArray) do
	    table.insert(sortedConfidence, email)
	end
	-- Remove duplicates, sort and print out the result
	table.sort(sortedConfidence, function(a, b)
	    return confidenceArray[a] > confidenceArray[b]
	end)

	local deduplicatedEmails = t_utils.DeduplicateTable(collection)
	for idx, email in ipairs(sortedConfidence) do
		print(email.." "..confidenceArray[email] .. "%".." confidence")
	end
end



copas.addthread(Main)
copas.loop()
