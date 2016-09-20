class Article < ApplicationRecord
	has_many :comments, dependent: :destroy
	validates :title, presence: true,
					  length: {minimum: 5}

	def self.search(search)
		if search
			self.where("title like ?", "%#{search}%")
			self.where("text like ?", "%#{search}%")
		else
			self.all
		end
	end
end
