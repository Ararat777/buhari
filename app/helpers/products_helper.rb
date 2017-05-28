module ProductsHelper
  def selected_param name
    if @filter_params
      @filter_params[name]
    else
      0
    end
  end
end
