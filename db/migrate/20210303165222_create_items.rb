class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :item_name
      t.integer :unit_price_without_tax
      t.integer :sale_status, null: false, default: 0
      t.text :explanation
      t.string :image_id

      t.timestamps
    end
  end
end
