class AddImageToEvent < ActiveRecord::Migration
  def change
    add_column :events, :image, :text
    
  end
end
