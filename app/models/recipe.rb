class Recipe < ActiveRecord::Base
	belongs_to :chef
	has_many 	:ingredients
	has_many :recipe_categories
	has_many :categories, through: :recipe_categories
	validates :chef_id, presence: true
	validates :name, presence: true, length: {minimum: 5, maximum: 100}
	#validates :summary, presence: true, length: {minimum: 10, maximum: 150}
	validates :description, presence: true, length: {minimum: 20, maximum: 3500}

	accepts_nested_attributes_for :ingredients, :reject_if => :all_blank, :allow_destroy => true
	# accepts_nested_attributes_for :ingredients,
	# 															reject_if: proc { |attributes| attributes['quantity'].blank? },
	# 															allow_destroy: true										

	has_attached_file :recipe_image, styles: { large: "570x427#", medium: "270x203#" }
	validates_attachment_content_type :recipe_image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
