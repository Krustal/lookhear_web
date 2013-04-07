class FixColumnTypeToFileType < ActiveRecord::Migration
  def up
    rename_column :materials, :type, :file_type
  end

  def down
    rename_column :materials, :file_type, :type
  end
end
