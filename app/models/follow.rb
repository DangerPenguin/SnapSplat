class Follow < ActiveRecord::Base
  attr_accessible :follower_id, :following_id
  
  validates :follower_id, :presence => true
  validates :following_id, :presence => true
  
  belongs_to( :follower,
  :class_name => "User",
  :primary_key => :id,
  :foreign_key => :follower_id)
  
  belongs_to( :following,
  :class_name => "User",
  :primary_key => :id,
  :foreign_key => :following_id)
end
