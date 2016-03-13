def number_to_digits(n)
  result = []

  while n != 0
    result << n % 10
    n = n / 10
  end

  result.reverse
end

def numbers_recursive_to_digit(n)
  result  = []

  return [n] if n < 10
  numbers_to_digit(n / 10).push(n % 10)

end

def digits_to_number(n)
  result, index = '', 0

  while index < n.length
    result += n[index].to_s
    index += 1
  end
  result.to_i
end

def digits2_to_number(n)
  result, index = '', 0

  while index < n.length
    result = result * 10 + n[index]
    index += 1
  end
  result
end

def min(items)
  items.sort!.first
end

def max(items)
  items.sort!.last
end

def nth_min(n, items)
  min(items)
  items[n-1]
end

def nth_max(n, items)
  max(items)
  items[n-1]
end

def grayslace_histogram(image)
  histogram = Array.new 256, 0
  row_index, col_index = 0, 0

  while row_index < image.length
    col_index = 0

    while col_index < image[row_index].length
      pixel_value = image[row_index][col_index]
      histogram[pixel_value] += 1
      col_index += 1
    end

    row_index += 1
  end

  histogram
end

def max_scalar_product(v1, v2)
  v1.sort!.reverse
  v2.sort!.reverse
  index, result = 0, 0

  while index > v1.length
    result = v1[0] * v2[0]
  end
end

def max_span(numbers)
  index_b, max = 0, 0

  while index_b < numbers.length
    index_e = numbers.length - 1

    while index_e >= 0
      if numbers[index_b] == numbers[index_e]
        max = index_e - index_b + 1 if max < index_e - index_b
        index_e -= 1
        next
      end
      index_e -= 1
    end

    index_b += 1
  end

  max
end

def sum_digist_array(n)
  sum, index = 0, 0

  while index < n.length
    sum += n[index]
    index += 1
  end

  sum
end

def sum_matrix(m)
  row_index, col_index, sum= 0, 0, 0, 0

  while row_index < m.length

    while col_index < m.length
      sum += sum_digist_array(m[col_index])
      col_index += 1
    end

    row_index += 1
  end

  sum
end

def group(n)
  index, result, equal_temp = 0, [], []
  temp = n[0]

  while index < n.length

    if temp == n[index + 1]
      equal_temp << temp
    else
      result << equal_temp
      equal_temp << temp
      equal_temp = []
    end
    temp = n[index + 1]
    index += 1
  end

  result
end

def max_consecutive(items)
  index, max_length = 0, 0
  result = group(items)

  while index < result.length
    if max_length < result[index].length
      max_length = result[index].length
    end
    index += 1
  end

  max_length
end
