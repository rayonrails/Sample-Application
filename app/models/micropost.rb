class Micropost < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user
  
  validates :content, :presence => true, :length => {:maximum => 140}
  validates :user_id, :presence => true
  
  default_scope :order => 'microposts.created_at DESC'
  
  scope :from_users_followed_by, lambda {|user| followed_by(user)}
  
  def self.from_users_followed_by(user)
    followed_ids = user.following.map(&:id).join(", ")
    where("user_id IN (#{followed_ids}) or user_id = ?", user)
  end
  
  private
  
  #Return an sql condition for users followed by the give user
  #we include the user's own id as welll.
  
  def self.followed_by(user)
    followed_ids = user.following.map(&:id).join(", ")
    where("user_id IN (#{followed_ids}) or user_id = :user_id", {:user_id => user})
  end
end
