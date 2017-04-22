class Tag < ApplicationRecord
	# attr_accessible :name
	has_many :taggings
	has_many :items, through: :taggings
end
