class AddHack < ActiveRecord::Migration
  def change
    add_column :posts, :url, :string
    add_column :posts, :download, :text
  end
end
