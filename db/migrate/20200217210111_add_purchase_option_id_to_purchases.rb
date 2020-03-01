class AddPurchaseOptionIdToPurchases < ActiveRecord::Migration[5.1]
  def change
    add_column :purchases, :purchase_option_id, :integer
  end
end
