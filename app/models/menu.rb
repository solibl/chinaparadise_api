class Menu < ApplicationRecord
	validates :name, :price, :category, presence: true
end
