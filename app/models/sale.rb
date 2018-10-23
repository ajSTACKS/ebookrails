class Sale < ApplicationRecord
	belongs_to :book
	before_create :populate_uuid 
	# before it creates a sale it will generate an id to that sale 

	
	validates_numericality of :price
	greater_than: 49, message: "Price must be greater than 50"

	private

	def populate_uuid

		self.uuid = SecureRandom.uuid()
	end
end

