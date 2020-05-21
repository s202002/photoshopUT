class Photo < ApplicationRecord
	belongs_to :customer
	attachment :image
	has_many :favorites, dependent: :destroy
	has_many :comments, dependent: :destroy
	validates :title, presence: true
	validates :place, presence: true
	validates :tag, presence: true
	default_scope -> { order(created_at: :desc) }
	def favorited_by?(customer)
		favorites.where(customer_id: customer.id).exists?
	end
end
