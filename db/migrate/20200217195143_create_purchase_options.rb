class CreatePurchaseOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :purchase_options do |t|
      t.decimal :price
      t.string :video_quality
      t.integer :purchase_optionable_id
      t.string :purchase_optionable_type

      t.timestamps
    end
  end
end
