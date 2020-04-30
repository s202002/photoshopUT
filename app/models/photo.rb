class Photo < ApplicationRecord
	belongs_to :customer
	attachment :image
end
