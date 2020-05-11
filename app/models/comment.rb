class Comment < ApplicationRecord
	belongs_to :customer
	belongs_to :photo
	validates :comment, presence: true
end
