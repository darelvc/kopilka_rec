class Post < ActiveRecord::Base
	belongs_to :chef

	has_attached_file :post_image, styles: { large: "780x585#", medium: "325x244#" }
	validates_attachment_content_type :post_image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
