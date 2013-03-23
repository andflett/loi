class FeaturedStuff < ActiveRecord::Migration
  def up
		add_column :resources, :featured, :boolean, :default => false
		add_column :events, :featured, :boolean, :default => false
  end

  def down
		drop_column :resources, :featured
		drop_column :events, :featured
  end
end
