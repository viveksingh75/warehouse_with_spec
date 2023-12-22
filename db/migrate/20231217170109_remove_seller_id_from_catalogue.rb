class RemoveSellerIdFromCatalogue < ActiveRecord::Migration[7.0]
  def change
    remove_column :catalogues, :seller_id, :integer
  end
end
