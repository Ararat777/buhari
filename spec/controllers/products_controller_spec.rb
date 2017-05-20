require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe "GET index" do
    before(:all) do
      
      create(:category, title: 'pizza')
      create(:category, title: 'khachapuri')
      create(:product)
    end
    it "response success" do
      get :index, params: {:category => 'pizza'}
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    it "render right template" do
      get :index, params: {:category => 'pizza'}
      expect(response).to render_template('pizza.html.erb')
      
      get :index, params: {:category => 'khachapuri'}
      expect(response).to render_template('khachapuri.html.erb')
      
    end
    
    it "loads all the products into @products" do
      products = Product.where(:category_id => '1')
      get :index, params: {:category => 'pizza'}
      
      expect(assigns(:products)).to eq products
      
    end
  
  end

end
