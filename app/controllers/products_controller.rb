class ProductsController < ApplicationController
  def index
    @category = Category.find_by(:title => params[:category])
    @products = Product.where(:category => @category.id)
    
    render "#{@category.title}.html.erb"
  end
  def show
    @product = Product.find(params[:id])
  end
end
