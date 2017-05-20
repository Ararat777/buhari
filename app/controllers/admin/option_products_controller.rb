class Admin::OptionProductsController < AdminController
  before_action :get_product,only: [:index,:new,:create]
  def index
    
    @option_products = @product.option_products
  end
  def new
    
    @option_product = @product.option_products.new
  end
  def create
    @option_product = @product.option_products.new(option_product_params)
    if @option_product.save
      flash[:notice] = 'Option product added'
      redirect_to admin_product_option_products_path(@product)
    else
      render :new
    end
  end
  
  private
  
  def get_product
    @product = Product.find(params[:product_id])
  end
  
  def option_product_params
    params.require(:option_product).permit(:title,:thumb,:price,:size,:weight,:category_id)
  end
end
