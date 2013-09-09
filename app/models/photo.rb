class Photo < ActiveRecord::Base
  attr_accessible :user_id, :caption, :url
end
