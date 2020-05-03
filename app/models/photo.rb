class Photo < ApplicationRecord
	belongs_to :customer
	attachment :image
	has_many :fovorites, dependent: :destroy
	def fovorited_by?(customer)
		favorites.where(customer_id: customer.id).exists?
	end
end
