class AddDownloadToToolkit < ActiveRecord::Migration
  def change
    add_column :toolkits, :download, :string
  end
end
