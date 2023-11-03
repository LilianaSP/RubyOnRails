class AddNameToHeldItem < ActiveRecord::Migration[7.1]
  def change
    add_column :held_items, :name, :string
  end
end
