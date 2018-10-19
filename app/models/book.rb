class Book < ApplicationRecord
	belongs_to :user
	has_attached_file :image
	has_attached_file :resource 
	#each book will have two file attachments which is image and resource
end
