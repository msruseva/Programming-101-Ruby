class NumberSet

  include Enumerable

  def initialize(number_set = [])
    @number_set = number_set
  end

  def each(&block)
    @number_set.each(&block)
  end

  def <<(number)
    @number_set << number unless @number_set.include? number
  end

  def size
    @number_set.size
  end

  def empty?
    @number_set.empty?
  end

  def [](filter)
    NumberSet.new @number_set.select { |number| filter.satisfy? number }
  end

end

module Filters

  def satisfy?(number)
    @filter.call number
  end

  def &(other)
    Filter.new { |number| satisfy?(number) && other.satisfy?(number) }
  end

  def |(other)
    Filter.new { |number| satisfy? (number) || other.satisfy?(number) }
  end

end

class Filter
  include Filters

  def initialize(&filter)
    @filter = filter
  end

end

class TypeFilter
  include Filters

  def initialize(type)
    case type
    when :intiger
      @filter = proc { |n| n.class == Integer }
    when :real
      @filter = proc { |n| n.class == Float or n.class == Rational }
    when :complex
      @filter = proc { |n| n.class == Complex }
    end
  end

end

class SignFilter
  include Filters

  def initialize(sign)
    case sign
    when :positive
      @filter = proc { |n| n > 0 }
    when :non_positive
      @filter = proc { |n| n <= 0 }
    when :negative
      @filter = proc { |n| n < 0 }
    when :non_negative
      @filter = proc { |n| n >= 0 }
    end
  end

end
