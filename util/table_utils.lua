local table_utils = {}

function table_utils.DeduplicateTable(t_table)
	local deduplicated = {}
	local found = {}
	for _, v in ipairs(t_table) do
		if not found[v] then
			table.insert(deduplicated, v)
			found[v] = true
		end
	end
	return deduplicated
end

function table_utils.calculateConfidence(emails)
	local counts = {}
	local confidence = {}
	local maxCount = 0

	for _,email in ipairs(emails) do
			-- Initialize count if not existing else add 1
			if not counts[email] then
				counts[email] = 1
			else
				counts[email] = counts[email] + 1
			end

			-- If email has appeared the most then set it to the max count
			if counts[email] > maxCount then maxCount = counts[email] end
	end

	for email, count in pairs(counts) do
		confidence[email] = (count / maxCount) * 100
	end

	return confidence
end

return table_utils
