Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  #get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root "pokemon#index"

  get "/pokemon", to: "pokemon#index"
  get "/category", to: "pokemon#category"
  get "/choosePokemon", to: "pokemon#choosePokemon"
  get "/buildTeam", to: "pokemon#buildTeam"
  get "/saveTeam", to: "pokemon#saveTeam"
  get '/index', to: "pokemon#index"
  get '/abilities', to: 'pokemon#abilities'
  get '/items', to: 'pokemon#items'
  get '/attacks', to: 'pokemon#attacks'
  get '/natures', to: 'pokemon#natures'
  get '/attack_type', to: 'pokemon#attack_type'
  get '/item_effect', to: 'pokemon#item_effect'
  post '/save_pokemon', to: 'pokemon#savePokemon'
  get '/pokemon_in_team', to: 'pokemon#pokemonInTeam'
  put '/rename_team', to: 'pokemon#renameTeam'
end
