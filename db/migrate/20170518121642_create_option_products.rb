class CreateOptionProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :option_products do |t|
      t.string :thumb
      t.string :title
      t.decimal :price, precision: 5, scale: 2
      t.integer :weight
      t.integer :size
      t.belongs_to :product,index: true
      t.belongs_to :category,index: true
      t.timestamps
    end
  end
end
