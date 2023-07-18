class AddLevelToCharacter < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :level, :integer, default: 1
    add_column :characters, :stamina_max, :integer, default: 20
    add_column :characters, :stamina_current, :integer, default: 20
  end
end
