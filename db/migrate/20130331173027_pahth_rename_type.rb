class PahthRenameType < ActiveRecord::Migration
  def up
    rename_column :pahths, :type, :pahth_tipo
  end

  def down
    rename_column :pahths, :pahth_tipo, :type
  end
end
