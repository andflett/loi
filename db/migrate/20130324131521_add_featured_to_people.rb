class AddFeaturedToPeople < ActiveRecord::Migration
  def change
    add_column :intrapreneurs, :featured, :boolean, :default => false
  end
end
