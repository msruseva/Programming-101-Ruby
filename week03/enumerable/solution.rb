# Implementation of our own Enumerable class
module MyEnumerable
  def map

    Array.new.tap do |new_array|
      each do |element|
        new_array << (yield element)
      end
    end

  end

  def filter

    Array.new.tap do |new_array|
      each do |element|
        if yield element
          new_array << element
        end
      end
    end

  end

  def reject_smarter(&block)
    filter(negative_block(&block))
  end

  def first
    each do |element|
      return element
    end
  end

  def reduce(initial = nil)
    if initial.nil?
      initial = first
      skip_first = true
    else
      skip_first = false
    end

    each do |element|
      if skip_first
        skip_first = false
        next
      end
      initial = yield initial, element
    end

    initial
  end

  def any?(block)
    filter(&block).size > 0
  end

  def all?
    filter(&block).size == size
  end

  def include?(element)
    each do |item|
      if item == element
        return true
      end
    end
  end

  def count
    if element.nil?
      return self.size
    end

    filter { |x| x == element }.size
  end

  def sizer
    map { |element| 1 }.reduce(0) { |acc, x| acc + x }
  end

  def min
    min_element = first

    each do |element|
      if element < min_element
        min_element = element
      end
    end

    min_element
  end

  def min_by(&block)
    min_element = first
    min_value = yield first

    each do |element|
      if (yield element) < min_value
        min_value = yield element
        min_element = element
      end
    end

    min_element
  end

  def max
    reduce(first) { |acc, x| acc < x ? x : acc }
  end

  def max_by(&block)

    reduce(first) do |acc, x|
      if (yield acc) < (yield x)
        acc = x
      else
        acc
      end
    end

  end

  def take(n)
    result = Array.new

    each do |element|
      break if result.size == n
      result << element
    end

    result
  end

  def take_while
    result = Array.new

    each do |element|
      break if !(yield element)
      result << element
    end

    result
  end

  def drop(n)
    temporary, result = Array.new, Array.new

    each do |element|
      if temporary.size != n
        temporary << element
      else
        result << element
      end
    end

    result
  end

  def drop_while(&block)
    flag, result = false, Array.new

    each do |element|
      if !flag && !(yield element)
        flag = true
      end
      result << element if flag
    end

    result
  end
end
