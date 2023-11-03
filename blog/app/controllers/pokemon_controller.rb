class PokemonController < ApplicationController
  def index
  end

  def category
    @current_team_name = TeamPokemon.first&.nombre || ''
    @pokemon_types = PokemonApi::PokemonClient.get_all_pokemon_types
    pokemonInTeam()
  end

  def choosePokemon
    type = params[:type]
    pokemons = PokemonApi::PokemonClient.get_pokemon_by_type(type)
    render json: pokemons
  end

  def abilities
    pokemon = params[:pokemon]
    abilities = PokemonApi::PokemonClient.get_pokemon_abilities(pokemon)
    render json: abilities
  end

  def items
    items = PokemonApi::PokemonClient.get_all_held_items
    render json: items
  end

  def item_effect
  item = params[:item]
  item_effect = PokemonApi::PokemonClient(item)
  render json: item_effect
  end


  def attacks
    pokemon = params[:pokemon]
    attacks = PokemonApi::PokemonClient.get_pokemon_attacks(pokemon)
    render json: attacks
  end

  def attack_type
    attack = params[:attack]
    attack_type = PokemonApi::PokemonClient.get_attack_type(attack)
    render json: attack_type
  end

  def natures
    natures = PokemonApi::PokemonClient.get_all_natures
    render json: natures
  end

  def buildTeam
    @selected_pokemon = params[:selectedPokemon]
  end

  def pokemonInTeam
    team = TeamPokemon.first
    if team
      @team_pokemons = team.pokemons.includes(:held_item).map do |pokemon|
        {
          name: pokemon.name,
          held_item: pokemon.held_item&.name
        }
      end
      p @team_pokemons
    else
      @team_pokemons = []
    end
  end

  def savePokemon
    team = TeamPokemon.first
    item = HeldItem.find_by(name: held_item)
    unless item.present? #igual
      item_description = PokemonApi::PokemonClient.get_item_effect(held_item)
      item = HeldItem.create(name: held_item, effect: item_description)
    end
    team.pokemons.create(
    nature: params[:pokemon][:nature],
    skill: params[:ability],
    held_item: item,
    atack: params[:attack],
    name: params[:name]
    )
  end

  def held_item
    params[:held_item]
  end

  def saveTeam
    pokemonInTeam()
    @current_team_name = TeamPokemon.first&.nombre || ''
  end

  def renameTeam
    team = TeamPokemon.first
    new_name = params[:name]
    team.update(nombre: new_name)
  end

  private

  def team_pokemon_params
    params.require(:team_pokemon).permit(:nombre, :categoria, :Autor)
  end

end