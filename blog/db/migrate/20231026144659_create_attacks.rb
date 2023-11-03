class CreateAttacks < ActiveRecord::Migration[7.1]
  def change
    create_table :attacks do |t|
      t.string :tipoDeAtack
      t.references :pokemon, null: false, foreign_key: true

      t.timestamps
    end
  end
end
