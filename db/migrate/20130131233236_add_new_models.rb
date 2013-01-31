class AddNewModels < ActiveRecord::Migration

  def change
		
		remove_column :posts, :category_id
		drop_table :categories
		
		create_table :resources do |t|
			t.string :title
      t.text :body
			t.text :excerpt
			t.text :hero_image
			t.boolean :published, :null => false, :default => false
			t.string :slug
			t.references :user
			t.timestamps
		end
		
		create_table :events do |t|
			t.string :title
      t.text :body
			t.text :excerpt
			t.text :hero_image
			t.boolean :published, :null => false, :default => false
			t.string :slug
			t.references :user
			t.timestamps
		end
		
  end

end
