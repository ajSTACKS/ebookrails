class Book < ApplicationRecord
	extend FriendlyId
  	friendly_id :name, use: :slugged
	

	belongs_to :user
	has_many :sale
	has_attached_file :image
	has_attached_file :resource 
	#each book will have two file attachments which is image and resource
	validates_attachment :image, presence: true,
	content_type: { content_type: ["image/jpeg", "image/gif", "image/png", "image/jpg"] },
	message: 'Only images allowed'


	validates_attachment  :resource,presence: true, 
	content_type: { content_type: "application/pdf" },
	message: 'only pdf allowed'


	validates_numericality_of :price,
	greater_than: 49, message: "Price must be greater than 50"
end
