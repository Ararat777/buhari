class ProductsController < ApplicationController
  def index
    @category = Category.find_by(:seo_url => params[:category])
    @products = Product.where(:category => @category.id)
  end
  def show
    @product = Product.find(params[:id])
  end
end
