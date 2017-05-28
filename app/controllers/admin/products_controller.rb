class Admin::ProductsController < AdminController
  before_action :load_categories,only: [:new,:create,:edit,:update]
  before_action :get_product,only: [:show,:edit,:update,:destroy]
  def index
      if params[:filter]
        @filter_params = filter_products_params
        @products = Product.where(@filter_params)
      else
        @products = Product.all
      end
  end
  
  def new
    @product = Product.new
  end
  def create
    @category = Category.find(product_params[:category_id])
    @product = @category.products.new(product_params)
    if @product.save
      flash[:notice] = "Product added"
      redirect_to admin_products_path
    else
      flash[:error] = @product.errors.full_messages
      
      render :new
    end
  end
  
  def show
    
  end
  
  def edit
   
  end
  def update
    
    if @product.update(product_params)
      
      flash[:notice] = "Product changed"
      redirect_to admin_products_path
    else
      flash[:error] = @product.errors.full_messages
      render :edit
    end
  end
  
  def destroy
    @product.destroy
  end
  
  def new_thumb
    @product = Product.find(params[:product_id])
    respond_to do |format|
      format.js{}
    end
  end
  
  
  private
  
  def filter_products_params
    hh = {}
    params[:filter].each do |k,v|
      hh[k.to_sym] = v
    end
    hh
  end
  
  def load_categories
    @categories = Category.all
  end
  
  def get_product
    @product = Product.find(params[:id])
  end
  
  def product_params
    params.require(:product).permit(:title,:description,:price,:weight,:size,:category_id,:active,:thumb)
  end
  
  
end
