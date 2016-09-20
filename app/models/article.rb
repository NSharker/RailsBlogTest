class Article < ApplicationRecord
	has_many :comments, dependent: :destroy
	validates :title, presence: true,
					  length: {minimum: 5}

	def self.search(search)
		if search
			self.where("name liike ?", "%#{search}%")
		else
			self.all
		end
	end
end
