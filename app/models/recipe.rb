class Recipe < ActiveRecord::Base
	include TheComments::Commentable

	belongs_to :user
	#has_many :comments
	has_many 	:ingredients
	has_many :recipe_categories
	has_many :categories, through: :recipe_categories
	validates :user_id, presence: true
	validates :title, presence: true, length: {minimum: 5, maximum: 100}
	#validates :summary, presence: true, length: {minimum: 10, maximum: 150}
	validates :description, presence: true, length: {minimum: 20, maximum: 3500}

	accepts_nested_attributes_for :ingredients, :reject_if => :all_blank, :allow_destroy => true
	# accepts_nested_attributes_for :ingredients,
	# 															reject_if: proc { |attributes| attributes['quantity'].blank? },
	# 															allow_destroy: true										

	has_attached_file :recipe_image, styles: { large: "570x427#", medium: "270x203#" }
	validates_attachment_content_type :recipe_image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	# Denormalization methods
  # Check the documentation for information on advanced usage
  def commentable_title
    "Undefined Post Title"
  end

  def commentable_url
    "#"
  end

  def commentable_state
    "published"
  end
end
