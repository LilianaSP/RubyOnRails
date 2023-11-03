class CreatePokemons < ActiveRecord::Migration[7.1]
  def change
    create_table :pokemons do |t|
      t.string :skill #Ability
      t.string :nature #nature
      t.references :team, null: false, foreign_key: { to_table: :team_pokemons } #team
      t.references :held_item, null: true, foreign_key: { to_table: :held_items } #item
      t.timestamps
    end

    add_index :pokemons, :id, unique: true
  end
end
