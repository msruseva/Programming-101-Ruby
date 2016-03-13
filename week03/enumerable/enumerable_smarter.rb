# Implementation of our own Enumerable class
module MyEnumerable
  def map

    [].tap do |new_array|
      each do |element|
        new_array << (yield element)
      end
    end

  end

  def filter

    [].tap do |new_array|
      each do |element|
        if yield element
          new_array << element
        end
      end
    end

  end

  def negative_block(&block)
    Proc.new { |x| !block.call(x) }
  end

  def first
    element = nil

    each do |element|
      element
      break
    end

    element
  end

  def reduce(initial = nil)
    if initial.nil?
      initial = initial.first
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

  def size
    counter = 0
    each { |element| counter += 1 }
    counter
  end

  def size_smarter
    map { |element| 1 }.reduce(0) { |acc, x| acc + x }
  end

  def min
    min_element = self.first

    each do |element|
      if element < min_element
        min_element = element
      end
    end

    min_element
  end

  def min_by(&block)
    reduce(0) { |acc, x| x < acc }
  end

  def max
    max_element = self.first

    each do |element|
      if element > max_element
        max_element = element
      end
    end

    max_element
  end

end
