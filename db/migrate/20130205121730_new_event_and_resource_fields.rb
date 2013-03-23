class NewEventAndResourceFields < ActiveRecord::Migration
  def up
		remove_column :events, :excerpt
		remove_column :events, :hero_image
		remove_column :events, :published
		remove_column :events, :slug
		add_column :events, :date, :datetime
		add_column :events, :url, :string
		
		remove_column :resources, :excerpt
		remove_column :resources, :hero_image
		remove_column :resources, :published
		remove_column :resources, :slug
		add_column :resources, :url, :string
		
  end

  def down
		add_column :events, :excerpt, :text
		add_column :events, :hero_image, :string
		add_column :events, :published, :boolean, :default => false
		add_column :events, :slug, :string
		remove_column :events, :date
		remove_column :events, :url
		
		
		add_column :resources, :excerpt, :text
		add_column :resources, :hero_image, :string
		add_column :resources, :published, :boolean, :default => false
		add_column :resources, :slug, :string
		remove_column :resources, :url
		
  end
end
