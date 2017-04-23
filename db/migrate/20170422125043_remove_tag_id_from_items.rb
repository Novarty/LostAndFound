class RemoveTagIdFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :tag_id, :integer
  end
end
