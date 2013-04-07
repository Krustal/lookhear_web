class Material < ActiveRecord::Base
  attr_accessible :file, :title, :file_type
  belongs_to :tour
  mount_uploader :file, MaterialUploader
end
