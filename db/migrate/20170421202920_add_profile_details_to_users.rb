class AddProfileDetailsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :birthday, :date
    add_column :users, :photo, :string
    add_column :users, :telephone, :string
    add_column :users, :location, :string
  end
end
