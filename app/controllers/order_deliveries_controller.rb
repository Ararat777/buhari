class OrderDeliveriesController < ApplicationController
  def new
  end
  def create
    @order = current_order
    @order.create_order_delivery(order_delivery_params)
  end
  
  private
  
  def order_delivery_params
    params.require(:order_delivery).permit(:name,:phone,:street,:nubmer,:room,:comment)
  end
end
