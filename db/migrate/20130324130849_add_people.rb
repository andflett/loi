class AddPeople < ActiveRecord::Migration
  def change
      
    create_table :intrapreneurs do |t|
			t.string :name
			t.string :quote
			t.string :job_title
			t.string :link
      t.text :body
			t.text :hero_image
			t.string :slug
			t.references :user
			t.timestamps
		end
      
  end
end
