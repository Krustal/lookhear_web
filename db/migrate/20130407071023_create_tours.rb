class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :title
      t.belongs_to :user

      t.timestamps
    end
    add_index :tours, :user_id
  end
end
