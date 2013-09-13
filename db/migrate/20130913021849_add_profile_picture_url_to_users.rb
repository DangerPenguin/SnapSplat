class AddProfilePictureUrlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile_picture_id, :string
  end
end
