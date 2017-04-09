class AddTypeProfileToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :type_profile, :string
  end
end
