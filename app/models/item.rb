class Item < ApplicationRecord

  # attr_accessible :title, :description, :tag_list
  has_many :taggings
  has_many :tags, through: :taggings

  def tag_list=(names)
    self.tags = names.split(",").map do |name|
        Tag.where(name: name.strip).first_or_create!
    end
  end

  def tag_list
    self.tags.map(&:name).join(", ")
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).items
  end
end
