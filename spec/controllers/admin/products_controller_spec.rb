require 'rails_helper'

RSpec.describe Admin::ProductsController, type: :controller do
  describe 'index' do
    it "response status 200" do
      get :index
      expect(response.status).to eq 200
    end
    
    it "load collection of products" do
      create(:product)
      products = Product.all
      
      get :index
      expect(assigns(:products)).to eq products
    end
  end
end
