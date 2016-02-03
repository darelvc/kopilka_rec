class Post < ActiveRecord::Base
	belongs_to :user

	has_attached_file :post_image, styles: { large: "780x585#", medium: "325x244#", small: "270x203#" }
	validates_attachment_content_type :post_image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
