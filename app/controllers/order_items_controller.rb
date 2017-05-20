class OrderItemsController < ApplicationController
  def create
    
    @order = current_order
    @order_item = @order.order_items.new(order_params)
    
    if @order.save
      @order_items = @order.order_items
      session[:order_id] = @order.id
      @session = session.inspect
      flash[:success] = 'Item added'
    else
      flash[:error] = 'smth wrong'
      render :js => "alert(#{flash[:error]})"
    end
  end
  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update(order_params)
    @order_items = @order.order_items
  end
  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end
  
  private
  
  def order_params
    params.require(:order_item).permit(:product_id, :quantity)
  end
end
