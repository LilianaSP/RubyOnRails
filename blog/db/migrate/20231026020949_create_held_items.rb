class CreateHeldItems < ActiveRecord::Migration[7.1]
  def change
    create_table :held_items do |t|
      t.string :effect
      t.timestamps
    end

    add_index :held_items, :id, unique: true
  end
end
