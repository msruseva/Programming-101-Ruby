class CategoriesController < ApplicationController

  def index
    render json: Category.all
  end

  def count
    render json: Category.count
  end

  def show
    render json: Category.find(params[:id])
  end

  def range
    render json: Category.where('id >= ?', params[:id])
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      render  json: @category, status: :created
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def count_to_num
    render json: Category.where("id >= ?", params[:id]).limit(params[:count])
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    if @category.destroyed?
      render json: {deleted_category_id: params[:id]}
    else
      render json: @category.errors
    end
  end

  def update
    @category = Category.find(params[:id])
    render :json @category.update(category_params)

    if @category.update?
      render json: @category
    else
      render json: @category.errors
    end
  end
  private

  def category_params
    params.require(:category).permit(:name, :price, :quantity)
  end
end
