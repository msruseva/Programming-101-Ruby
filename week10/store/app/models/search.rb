class Search < ActiveRecord::Base

  def self.filter(params)
    case params[:type]
    when 'products'
      Product.where('name Like ?', "%#{params[:slug]}%")
    when 'brands'
      Brand.where('name Like ?', "%#{params[:slug]}%")
    when 'categories'
      Category.where('name Like ?', "%#{params[:slug]}%")
    end
  end

  def self.filter_by(params)
    case params[:type]
    when 'products'
      Product.where("%#{params[:property]}%", "%#{params[:slug]}%", "%#{params[:property]}%")
    when 'brands'
      Brand.where("%#{params[:property]}%", "%#{params[:slug]}%", "%#{params[:property]}%")
    when 'categories'
      Category.where("%#{params[:property]}%", "%#{params[:slug]}%", "%#{params[:property]}%")
    end
  end
end
