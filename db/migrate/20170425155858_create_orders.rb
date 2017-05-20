class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.decimal :total_price, precision: 5, scale: 2
      t.belongs_to :order_status,index: true
      t.timestamps
    end
  end
end
