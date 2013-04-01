class AddFounderAdviserToPeople < ActiveRecord::Migration
  def change
    add_column :intrapreneurs, :founder, :boolean, :default => false
    add_column :intrapreneurs, :advisor, :boolean, :default => false
  end
end
