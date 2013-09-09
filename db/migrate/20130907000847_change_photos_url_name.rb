class ChangePhotosUrlName < ActiveRecord::Migration
  def change
    add_column :photos, :url, :string, :null => false
    remove_column :photos, :filepicker_url
  end
end
