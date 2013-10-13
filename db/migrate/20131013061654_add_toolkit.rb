class AddToolkit < ActiveRecord::Migration
  def change
    create_table :toolkits do |t|
      t.string :title
      t.string :description
      t.string :subtitle
      t.string :slug
      t.string :hero_image
      t.timestamps
    end
  end
end
