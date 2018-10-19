class Book < ApplicationRecord
	belongs_to :user
	has_attached_file :image
	has_attached_file :resource 
	#each book will have two file attachments which is image and resource
	validates_attachment :image, presence: true,
	content_type: { content_type: ["image/jpeg", "image/gif", "image/png", "image/jpg"] },
	message: 'Only images allowed'


	validates_attachment  :resource,presence: true, 
	content_type: { content_type: "application/pdf" },
	message: 'only pdf allowed'
end
