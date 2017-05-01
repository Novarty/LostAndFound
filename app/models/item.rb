class Item < ApplicationRecord
  belongs_to :user, optional: true
  has_many :question
  
  has_many :taggings, :dependent => :destroy
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
  
  def self.tag_counts
  Tag.select("tags.*, count(taggings.tag_id) as count").
    joins(:taggings).group("taggings.tag_id")
  end
  

end
