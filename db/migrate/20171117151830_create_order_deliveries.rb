class CreateOrderDeliveries < ActiveRecord::Migration[5.0]
  def change
    create_table :order_deliveries do |t|
      t.string :street
      t.string :number
      t.string :room
      t.string :name
      t.string :phone
      t.text   :comment
      t.belongs_to :order
      t.timestamps
    end
  end
end
