class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :zombie
  validates_presence_of :body, :zombie_id
end
