require 'rails_helper'

RSpec.describe OrderItemsController, type: :controller do
  
  
  describe "create" do
    before(:all) do
      @product = create(:product)
      @params = {:format => 'js',:order_item => {:quantity => 1, :product_id => @product.id}}
    end
    it "render right template and flash message" do
      
      post :create, params: @params
      
      expect(response).to render_template('create')
      expect(flash[:success]).to eq 'Item added'
    end
    
    it "render right template and flash message if params isn't valid" do
      @params[:order_item][:quantity] = '0'
      post :create, params: @params
      
      expect(response.body).to eq "alert(smth wrong)"
    end
    
    it "has right session order id" do
      
      post :create, params: @params
      
      puts assigns(@session)[:order_id]
      
    end
  end
  describe "update" do
    before(:all) do
      @order_item = create(:order_item)
      @order = @order_item.order
      @product = @order_item.product
      @params = {:format => 'js', :id => @order_item.id, :order_item => {:quantity => 2, :product_id => @product.id}}
    end
    it "has right quantity after update" do
      request.session[:order_id] = @order.id
      patch :update, params: @params

      expect(assigns(:order_item).quantity).to eq 2
    end
    it "response has http status ok" do
      request.session[:order_id] = @order.id
      patch :update, params: @params
      
      expect(response).to have_http_status(200)
    end
  end
  
  describe "destroy" do
    before(:all) do
      @order_item = create(:order_item)
      @order = @order_item.order
      @product = @order_item.product
    end
    
    it "destroy right order item" do
      request.session[:order_id] = @order.id
      
      delete :destroy, params: {:id => @order_item.id}
      
      expect(assigns(:order_item).id).to eq @order_item.id
    end
  end
  
 
end



