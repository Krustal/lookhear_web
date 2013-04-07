class Tour < ActiveRecord::Base
  belongs_to :user
  attr_accessible :title
  validates :user_id, :presence => true
  has_many :material
end
