class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  include TheComments::User
  include TheComments::Commentable

  has_many :recipes
  has_many :posts
  #has_many :comments
  
  #before_save { self.email = email.downcase }
	validates :chefname, presence: true, length: {minimum: 3, maximum: 40}
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	#validates :email, presence: true, length: { maximum: 105 }, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }

	has_attached_file :user_image, styles: { thumb: "90x90#", medium: "270x270#" }, default_url: "avatar.jpg"
	validates_attachment_content_type :user_image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  # IT'S JUST AN EXAMPLE OF ANY ROLE SYSTEM 
  def admin?
    self == User.first
  end

  # YOU HAVE TO IMPLEMENT YOUR ROLE POLICY FOR COMMENTS HERE
  def comments_admin?
    admin?
  end

  def comments_moderator? comment
    id == comment.holder_id
  end
end
