module ApplicationHelper

	def getFullTitle(title = "")
		if title.empty?
			"Pets Fur Lease"
		else
			title + " | " + "Pets Fur Lease"
		end
	end

end
