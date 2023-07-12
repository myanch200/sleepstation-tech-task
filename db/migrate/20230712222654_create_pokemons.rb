class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string :name, null: false
      t.integer :base_experience, default: 0
      t.integer :height, default: 0
      t.boolean :is_default, default: false
      t.integer :order, default: 0
      t.integer :weight, default: 0

      t.timestamps
    end
  end
end
