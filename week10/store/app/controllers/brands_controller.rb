class BrandsController < ApplicationController

  def index
    render json: Brand.all
  end

  def count
    render json: Brand.count
  end

  def show
    render json: Brand.find(params[:id])
  end

  def range
    render json: Brand.where("id >= ?", params[:id])
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      render  json: @brand, status: :created
    else
      render json: @brand.errors, status: :unprocessable_entity
    end
  end

  def count_to_num
    render json: Brand.where("id >= ?", params[:id]).limit(params[:count])
  end

  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy

    if @brand.destroyed?
      render json: {deleted_brand_id: params[:id]}
    else
      render json: @brand.errors
    end
  end

  def update
    @brand = Brand.find(params[:id])
    render json: @brand.update(brand_params)

    if @brand.update?
      render json: @brand
    else
      render json: @brand.errors
    end
  end

  private

  def brand_params
    params.require(:brand).permit(:name, :description)
  end
end
