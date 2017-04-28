class AddItemIdToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :item_id, :integer
  end
end
