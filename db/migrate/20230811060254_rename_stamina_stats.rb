class RenameStaminaStats < ActiveRecord::Migration[7.0]
  def change
    rename_column :characters, :stamina_limit, :limit
    rename_column :characters, :stamina_current, :stamina
    rename_column :characters, :stamina_max, :endurance
  end
end
