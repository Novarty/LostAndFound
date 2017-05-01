class Tag < ApplicationRecord
	# attr_accessible :name
	has_many :taggings
	has_many :items, through: :taggings

	def self.tag_counts
  	self.select("name, count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id")
	end
end
