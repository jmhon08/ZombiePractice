class Zombie < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_one :brain, dependent: :destroy
	has_many :assignments
	has_many :roles, through: :assignments
	has_many :articles
	has_many :comments
	validates_presence_of :email, :name

	def as_json(options = nil)
		super(options || { include: :brain, except: [:created_at, :updated_at, :id] })
 	end

 	def roles_list
 		list = self.roles.map do |r| 
 			r.title
 		end
 	end

 	def admin?
 		self.roles_list.include? "Admin"
 	end

 	def banned?
 		self.roles_list.include? "Banned"
 	end

 	def active_for_authentication?
 		super && !self.banned?
 	end

 	def inactive_message
	  !self.banned? ? super : :banned
	end
end
