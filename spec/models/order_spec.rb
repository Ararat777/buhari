require 'rails_helper'

RSpec.describe Order, type: :model do
  before(:example) do
    @order = create(:order_item).order
  end
  
  it "is valid with valid params" do
    expect(@order.valid?).to eq true
  end
  
  it "has right order_status_id" do
    
    expect(@order.order_status_id).to eq 1
  end
  
  it "has right total_price" do
    expect(@order.total_price).to eq @order.order_items.collect{|item| item.unit_price * item.quantity}.sum
  end
end