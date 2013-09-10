class Photo < ActiveRecord::Base
  attr_accessible :user_id, :caption, :url
  
  validates :user_id, :presence => true
  validates :url, :presence => true
  
  belongs_to(:user,
  :class_name => "User",
  :primary_key => :id,
  :foreign_key => :user_id)
end
