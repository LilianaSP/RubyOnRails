class RenameTeamIdInPokemons < ActiveRecord::Migration[7.1]
  def change
    rename_column :pokemons, :team_id, :team_pokemon_id
  end
end
