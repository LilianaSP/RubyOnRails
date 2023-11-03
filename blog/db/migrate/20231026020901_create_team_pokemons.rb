class CreateTeamPokemons < ActiveRecord::Migration[7.1]
  def change
    create_table :team_pokemons do |t|
      t.string :nombre
      t.string :categoria
      t.string :Autor
      t.timestamps
    end

    add_index :team_pokemons, :id, unique: true
  end
end
