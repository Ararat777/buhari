require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  
  before(:example) do
    @order_item = create(:order_item)
  end
  
  it "is valid with valid params" do
    expect(@order_item.valid?).to eq true
  end
  
  it "is not valid without quantity" do
    @order_item.quantity = nil
    expect(@order_item.valid?).to eq false
  end
  
  it "is not valid with non-integer quantity" do
    @order_item.quantity = '1f'
    expect(@order_item.valid?).to eq false
  end
  
  it "is not valid with quantity lower 1" do
    @order_item.quantity = '0'
    expect(@order_item.valid?).to eq false
  end
  
  it "is not valid without product" do
    @order_item.product = nil
    expect(@order_item.valid?).to eq false
  end
  
  it "is not valid without order" do
    @order_item.order = nil
    
    expect(@order_item.valid?).to eq false
  end
  
  it "has right unit_price" do
    expect(@order_item.unit_price).to eq @order_item.product.price
  end
  
  it "has right subtotal_price" do
    
    expect(@order_item.sub_total_price).to eq @order_item.product.price * @order_item.quantity
  end
  
  it "has right product" do
    product = create(:product)
    order_item = create(:order_item, product: product)
    
    expect(order_item.product).to eq product
  end
  
  it "has right order" do
    order = create(:order)
    order_item = create(:order_item, order: order)
    
    expect(order_item.order).to eq order
    
  end

  
end
