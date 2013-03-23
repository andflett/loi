class AddSlugs < ActiveRecord::Migration
  def change
	
		create_table "friendly_id_slugs" do |t|
	    t.string   "slug",                         :null => false
	    t.integer  "sluggable_id",                 :null => false
	    t.string   "sluggable_type", :limit => 40
	    t.datetime "created_at"
	  end

	  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
	  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
	  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"
	  
  end
end
