class AddPriority < ActiveRecord::Migration
  def up
    add_column :toolkits, :priority, :integer
  end

  def down
    drop_column :toolkits, :priority
  end
end
