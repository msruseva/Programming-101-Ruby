class ProductsController < ApplicationController

  def index
    render json: Product.all
  end

  def count
    render json: Product.count
  end

  def show
    render json: Product.find(params[:id])
  end

  def range
    render json: Product.where('id >= ?', params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render  json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def count_to_num
    render json: Product.where("id >= ?", params[:id]).limit(params[:count])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    if @product.destroyed?
      render json: {deleted_product_id: params[:id]}
    else
      render json: @product.errors
    end
  end

  def update
    @product = Product.find(params[:id])
    render :json @product.update(product_params)

    if @product.update?
      render json: @product
    else
      render json: @product.errors
    end
  end
  private

  def product_params
    params.require(:product).permit(:name)
  end
end
