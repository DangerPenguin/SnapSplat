class AddTaglineAndBlurbToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tagline, :string
    add_column :users, :blurb, :text
  end
end
