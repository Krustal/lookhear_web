class Material < ActiveRecord::Base
  attr_accessible :file, :title, :file_type
  belongs_to :tour
  mount_uploader :file, MaterialUploader

  before_save :update_material_attributes

  private

  def update_material_attributes
    if file.present? && file_changed?
      self.file_type = file.file.content_type
    end
  end
end
