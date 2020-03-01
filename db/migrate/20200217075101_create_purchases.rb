class CreatePurchases < ActiveRecord::Migration[5.1]
  def change
    create_table :purchases do |t|
      t.integer :user_id
      t.integer :content_id
      t.string :content_type
      t.decimal :price
      t.string :video_quality
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
