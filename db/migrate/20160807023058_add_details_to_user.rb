class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :full_name, :string
    add_column :users, :description, :string
  end
end
