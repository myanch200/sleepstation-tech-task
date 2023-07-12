class CreatePokemonTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemon_types do |t|
      t.belongs_to :pokemon, null: false, foreign_key: true
      t.belongs_to :type, null: false, foreign_key: true

      t.timestamps

    end
    add_index :pokemon_types, %i[pokemon_id type_id], unique: true
  end
end
