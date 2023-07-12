class AddStatsToCharacter < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :physical, :string, default: "d6"
    add_column :characters, :mental, :string, default: "d6"
    add_column :characters, :social, :string, default: "d6"
    add_column :characters, :awareness, :string, default: "d6"
    add_column :characters, :prowess, :string, default: "d6"
    add_column :characters, :resilience, :string, default: "d6"
    add_column :characters, :stamina_limit, :integer, default: 20
  end
end
