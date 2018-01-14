class Menu < ApplicationRecord
	validates :name, :price, :category, presence: true

	has_attached_file :picture, styles: { large: "1000x1000>", medium: "300x300>"}, :url =>':s3_domain_url', :path => '/:class/:attachment/:id_partition/:style/:filename'
	validates_attachment_content_type :picture, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	do_not_validate_attachment_file_type :picture
end
