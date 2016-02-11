class Article < ActiveRecord::Base
	belongs_to :zombie
	has_many :comments, :dependent => :destroy

	def self.search(search)
	  where("name LIKE :search OR body LIKE :search", search: "%#{search}%") 
	end

end
