class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.string :title
      t.decimal :unit_price, precision: 5, scale: 2
      t.integer :quantity
      t.decimal :sub_total_price, precision: 5, scale: 2
      t.references :product,index: true
      t.belongs_to :order, index: true
      t.timestamps
    end
    
  end
end
