class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.integer :weight
      t.integer :size
      t.decimal :price, precision: 5, scale: 2
      t.belongs_to :category,index: true
      t.boolean :active
      t.string :status
      t.string :thumb
      

      t.timestamps
    end
  end
end
