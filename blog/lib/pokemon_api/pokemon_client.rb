require 'poke-api-v2'

module PokemonApi
  class PokemonClient
    def self.get_pokemon_by_type(type) #regresa todos los pokemones de un tipo
      pokemon_types = PokeApi.get(type: type)
      pokemons = JSON.parse(pokemon_types.to_json).with_indifferent_access.slice(:pokemon)
      pokemons[:pokemon].map { |element| element[:pokemon][:name] }
    end

    def self.get_all_pokemon_types #regresa todos los tipos elementales de pokemones
      all_pokemon_types = PokeApi.get(type: '')
      parsed_response = JSON.parse(all_pokemon_types.to_json).with_indifferent_access
      types = parsed_response[:results].map { |element| element[:name] }
      types
    end

    def self.get_pokemon_abilities(pokemon) #regresa todas las abilidades de un pokemon
      current_pokemon = PokeApi.get(pokemon: pokemon)
      parsed_response = JSON.parse(current_pokemon.to_json).with_indifferent_access
      abilities = parsed_response[:abilities].map { |element| element[:ability][:name] }
      abilities
    end

    def self.get_all_held_items #regresa todos los items que le puedes dar
      all_items = PokeApi.get(item_category: '12')
      parsed_response = JSON.parse(all_items.to_json).with_indifferent_access
      items = parsed_response[:items].map { |element| element[:name] }
      items
    end

    def self.get_item_effect(item) #regresa el efecto de un item
      item = PokeApi.get(item: item)
      parsed_response = JSON.parse(item.to_json).with_indifferent_access
      item_effect = parsed_response[:effect_entries].map { |element| element[:effect] }
      item_effect
    end
    
    def self.get_pokemon_attacks(pokemon) #regresa los ataques que puede aprender un pokemon
      pokemon = PokeApi.get(pokemon: pokemon)
      parsed_response = JSON.parse(pokemon.to_json).with_indifferent_access
      pokemon_moves = parsed_response[:moves].map { |element| element[:move][:name]}
      pokemon_moves
    end

    def self.get_attack_type(attack) #regresa el tipo elemental de un ataque
      attack_data = PokeApi.get(move: attack)
      parsed_response = JSON.parse(attack_data.to_json).with_indifferent_access
      type_info = parsed_response[:type]
      attack_type = type_info[:name] if type_info.is_a?(Hash)
      attack_type
    end

    def self.get_all_natures #regresa todas las naturalezas
      all_natures = PokeApi.get(nature: '')
      parsed_response = JSON.parse(all_natures.to_json).with_indifferent_access
      natures = parsed_response[:results].map { |element| element[:name] }
      natures
    end
  end
end