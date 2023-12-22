class CreateCatalogues < ActiveRecord::Migration[7.0]
  def change
      create_table :catalogues do |t|
        t.references :seller, foreign_key: { to_table: :accounts }
        t.string :name
        t.timestamps
    end
  end
end
