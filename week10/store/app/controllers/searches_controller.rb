class SearchesController <ApplicationController

  def filter
    result = Search.filter(search_params)
    render json: result
  end

  def filter_by
    result = Search.filter_by(search_params)
    render json: result
  end

  private

  def search_params
    params.permit(:type, :slug, :property)
  end
end
