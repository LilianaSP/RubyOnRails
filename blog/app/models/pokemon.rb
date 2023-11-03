class Pokemon < ApplicationRecord
  belongs_to :team_pokemon
  belongs_to :held_item
  has_many :attacks
end
