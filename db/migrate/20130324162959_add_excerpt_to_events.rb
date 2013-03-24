class AddExcerptToEvents < ActiveRecord::Migration
  def change
    add_column :events, :excerpt, :text
  end
end
