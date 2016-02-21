class AddImageUrlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image_url, :string
    add_column :users, :string, :string
  end
end
