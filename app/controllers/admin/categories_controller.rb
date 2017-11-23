class Admin::CategoriesController < AdminController
  before_action :get_category, only: [:edit,:update,:destroy]
  
  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category added"
      redirect_to admin_categories_path
    else
      flash[:error] = @category.errors.full_messages
      render :new
    end  
  end
  
  def edit
  end
  
  def update
    if @category.update(category_params)
      flash[:notice] = "Category changed"
      redirect_to admin_categories_path
    else
      flash[:error] = @category.errors.full_messages
      render :edit
    end
  end
  
  def destroy
    @category.destroy
  end
  
  private
  def category_params
    params.require(:category).permit(:title,:seo_url,:meta_title,:meta_description,:meta_keywords)
  end
  
  def get_category
    @category = Category.find(params[:id])
  end
end
