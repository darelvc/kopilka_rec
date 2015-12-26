class Chef < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :recipes
  #before_save { self.email = email.downcase }
	validates :chefname, presence: true, length: {minimum: 3, maximum: 40}
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	#validates :email, presence: true, length: { maximum: 105 }, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }

	has_attached_file :chef_image, styles: { thumb: "90x90#", medium: "270x270#" }, default_url: "avatar.jpg"
	validates_attachment_content_type :chef_image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
