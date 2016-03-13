require 'bigdecimal'
require 'bigdecimal/util'

module Promotions
  def self.for(hash)
    name, options = hash.first

    case name
      when :get_one_free then GetOneFree.new options
      when :package      then PackageDiscount.new *options.first
      when :threshold    then ThresholdDiscount.new *options.first
      else NoPromotion.new
    end
  end

  class GetOneFree
    def initialize(nth_item_free)
      @nth_item_free = nth_item_free
    end

    def discount(count, price)
      (count / @nth_item_free) * price
    end

    def name
      "buy #{@nth_item_free - 1}, get 1 free"
    end
  end

  class PackageDiscount
    def initialize(size, percent)
      @size    = size
      @percent = percent
    end

    def discount(count, price)
      multiplier       = @percent / '100'.to_d
      package_discount = price * multiplier * @size
      packages         = count / @size

      package_discount * packages
    end

    def name
      'get %d%% off for every %s' % [@percent, @size]
    end
  end

  class ThresholdDiscount
    def initialize(threshold, percent)
      @threshold = threshold
      @percent   = percent
    end

    def discount(count, price)
      multiplier            = @percent / '100'.to_d
      item_discount         = price * multiplier
      items_above_threshold = [count - @threshold, 0].max

      items_above_threshold * item_discount
    end

    def name
      suffix = {1 => 'st', 2 => 'nd', 3 => 'rd'}.fetch @threshold, 'th'
      '%2.f%% off of every after the %d%s' % [@percent, @threshold, suffix]
    end
  end

  class NoPromotion
    def discount(count, price)
      0
    end

    def name
      ''
    end
  end
end

module Coupon
  def self.build(name,type)
    case type.keys.first
      when :percent then PercentOff.new name, type[:percent]
      when :amount  then AmountOff.new  name, type[:amount]
      else raise "Unknown coupon: #{type.inspect}"
    end
  end

  class PercentOff
    attr_reader :name

    def initialize(name, percent)
      @name    = name
      @percent = percent
    end

    def discount(order_price)
      (@percent / '100'.to_d) * order_price
    end

    def description
      "%d%% off" % @percent
    end
  end

  class AmountOff
    attr_reader :name

    def initialize(name, amount)
      @name   = name
      @amount = amount
    end

    def discount(order_price)
      [order_price, @amount].min
    end

    def description
      "%-5.2f off" % @amount
    end
  end

  class NilCoupon
    attr_reader :name

    def discount(order_price)
      0
    end
  end
end
