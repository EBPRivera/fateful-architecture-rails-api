class AddFateToCharacters < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :fate, :integer, default: 5
    add_column :characters, :connections, :jsonb, array: true, default: []
  end
end
