class OrderItemsController < ApplicationController
  def create
    
    @order = current_order
    if @order_item = @order.order_items.find_by(:product_id => order_params[:product_id])
      @order_item.quantity += 1
      @order_item.save
      respond_to do |format|
        format.js{}
      end
    else
      @order_item = @order.order_items.new(order_params)
      if @order.save
        @order_items = @order.order_items
        session[:order_id] = @order.id
        respond_to do |format|
          format.js{}
        end
      else
        render :js => "alert(#{flash[:error]})"
      end
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
    if @order_item.quantity > 1
      @order_item.quantity -= 1
      @order_item.save
    else
      @order_item.destroy
    end
    respond_to do |format|
      format.js{}
    end
  end
  
  private
  
  def order_params
    params.require(:order_item).permit(:product_id, :quantity)
  end
end
