class Brain < ActiveRecord::Base
	belongs_to :zombie
	attr_accessor :zombie_name
end
