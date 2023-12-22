class CreateObtainCatalouges < ActiveRecord::Migration[7.0]
  def change
    create_table :obtain_catalouges do |t|
      t.references :account, null: false, foreign_key: true
      t.references :catalogue, null: false, foreign_key: true

      t.timestamps
    end
  end
end
