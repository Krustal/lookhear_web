class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :title
      t.string :file
      t.string :type
      t.belongs_to :tour

      t.timestamps
    end
  end
end
