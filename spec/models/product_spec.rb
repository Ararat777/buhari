require 'rails_helper'

RSpec.describe Product, type: :model do
  
  before(:all) do
    @product = build(:product)
    
  end
  
  it "is valid with valid params" do
    expect(@product.valid?).to eq true
  end
  
  it "is not valid without title" do
    @product.title = nil
    expect(@product.valid?).to eq false
  end
  
  it "is not valid without price" do
    @product.price = nil
    expect(@product.valid?).to eq false
  end
  
  it "is not valid without category" do
    @product.category = nil
    expect(@product.valid?).to eq false
  end
  
  it "is not valid with non-integer price" do
    @product.price = '100f'
    expect(@product.valid?).to eq false
  end
  
end
