class User < ActiveRecord::Base
  attr_accessible :username, :password, :tagline, :blurb, :profile_picture_id
  attr_reader :password
  
  validates :password_digest, :presence => { :message => "Password can't be blank" }
  validates :password, :length => { :minimum => 6, :allow_nil => true}
  validates :session_token, :presence => true
  validates :username, :presence => true
  
  paginates_per 10
  
  after_initialize :ensure_session_token
 
 #photos 
  has_many(:photos,
  :class_name => "Photo",
  :primary_key => :id,
  :foreign_key => :user_id)
  
  has_many(:feed_photos,
  :through => :following,
  :source => :photos)
  
  #users this one is following
  has_many(:following_join,
  :class_name => "Follow",
  :primary_key => :id,
  :foreign_key => :follower_id)
  
  has_many(:following,
  :through => :following_join,
  :source => :following)
  
  
  #users following this one
  has_many(:follower_join,
  :class_name => "Follow",
  :primary_key => :id,
  :foreign_key => :following_id)
  
  has_many(:followers,
  :through => :follower_join,
  :source => :follower)
  
  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    
    return nil if user.nil?
    
    user.is_password?(password) ? user : nil
  end
  
  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end
  
  def get_last_photo_url
    return self.photos.order('created_at DESC').first.url if self.photos.length > 0
    ""
  end
  
  def get_limited_feed_photos(feed_limit = 10)
    unsorted = self.feed_photos.order('created_at DESC').limit(feed_limit) + self.photos.order('created_at DESC').limit(feed_limit)
    unsorted.sort.reverse[0..10];
  end
  
  def get_sorted_photos()
    self.photos.order('created_at DESC')
  end
  
  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
  
  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
  end
  
  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end
