class Array
  def to_hash
    result = {}

    each { |item| result[item[0]] = item[1] }

    result
  end

  def index_by
    result = {}

    each { |n| result[yield(n)] = n }

    result
  end

  def group
    result = []

    each_cons(2) { |element| result << element }

    result
  end

  def subarray_count(subarray)
    counter = 0

    group.each do |element|
      counter += 1 if element == subarray
    end

    counter
  end

  def occurences_count
    result = Hash.new(0)

    each { |element| result[element] = count(element) }

    result
  end
end
