def prepare_meal(number)
  temp, result = number, ''

  while temp % 5 == 0
    result << "eggs "
    temp /= 5
  end

  while temp % 3 == 0
    result << "spam "
    temp /= 3
  end

  if temp % 5 == 0 and temp != 5
    result << " and eggs"
  end
  result
end

def reduce_file_path(path)
  index, result = 0, ''

  while index < path.length

    if path[index] == "." and path[index + 1] == "."
      index -= 1
      while path[index] != '/'
        index -= 1
      end
      result << path[index]
    elsif path[index] == "." and path[index + 1] == "/"
      index += 1
    elsif path[index] == "/" and path[index + 1] == "/"
      slice(path[index + 1])
      result << path[index]
    else
      path.slice(-1)
    end

    index += 1
  end

  result
end

#p reduce_file_path("/")
#p reduce_file_path("/srv/../")
#reduce_file_path("/srv/www/htdocs/wtf/") == "/srv/www/htdocs/wtf"
#reduce_file_path("/srv/www/htdocs/wtf") == "/srv/www/htdocs/wtf"
#reduce_file_path("/srv/./././././") == "/srv"
#reduce_file_path("/etc//wtf/") == "/etc/wtf"
#reduce_file_path("/etc/../etc/../etc/../") == "/"
#reduce_file_path("//////////////") == "/"
#reduce_file_path("/../") == "/"

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

#p group("")
def is_an_bn(word)
  index, index_i = 0, 0
  word = group(word)

  if word.length > 2
    false
  elsif
    while index < word.length

      if word[0][0] == "a" and word[1][0] == "b" and word[0].length == word[1].length
        return true
      else
        return false
      end

      index +=1
    end
  else
    true
  end
end

def count_digits(n)
  counter = 0

  while n > 0 do
    digit = n % 10
    n = n / 10
    counter += 1
  end

  counter
end

def sum_digits(n)
  counter, sum = 0, 0

  while n > 0 do
    digit = n % 10
    n = n / 10
    counter += 1
    sum += digit
  end

  sum
end

def transformation(n)
  n = n.to_s
  index, result = 0, ''

  while index < n.length
    if index == 0 or index % 2 == 0
      result << n[index]
    else
      multiplier = n[index].to_i
      multiplier = (2 * multiplier).to_s
      result << multiplier
    end
    index += 1
  end

  result.to_i
end

def is_credit_card_valid(number)

  if count_digits(number) % 2 == 1
    new_number = transformation(number)
    sum = sum_digits(new_number)
    if sum % 10 == 0
      return true
    else
      false
    end
  else
    return false
  end

end

def is_prime?(n)
  counter = 0
  temp = 1

  while temp <= n do
    if n % temp == 0 and n != 1
      counter += 1
      temp += 1
    else
      temp += 1
    end
  end

  if counter <= 2 and counter != 0 then true
  else
    false
  end
end

def goldbach(n)
  index, result, num = 0, [], n

  while index <= n/2
    if n = num + index
      if is_prime?(num) and is_prime?(index)
        result << [num, index]
      end
      num -= 1
    end
    index += 1
  end

  result
end




def row_matrix(m, s)
  row_index, col_index, sum = 0, 0, 0

  while row_index < m.length

    while col_index < m[row_index].length
      sum += m[row_index][col_index]
      col_index += 1
    end

    return false if sum != s

    sum = 0
    col_index = 0
    row_index += 1
  end

  return true
end

def col_matrix(m, s)
  row_index, col_index, sum = 0, 0, 0

  while col_index < m[row_index].length

    while row_index < m.length
      sum += m[row_index][col_index]
      row_index += 1
    end

    return false if sum != s

    sum = 0
    row_index = 0
    col_index += 1
  end

  return true
end

def main_diagonal(m)
  index, sum = 0, 0

  while index < m.length
    sum += m[index][index]
    index += 1
  end

  sum
end

p main_diagonal([[1,2,3], [4,5,6], [7,8,9]])

def second_diagonal(m, s)
  index_i, sum = 0, 0
  index_j = m.length - 1

  while index_i < m.length
    sum += m[index_i][index_j]

    index_j -= 1
    index_i += 1
  end

  if sum != s
    return false
  else
    true
  end

end

def magic_square(matrix)
  sum = main_diagonal(matrix)

  return row_matrix(matrix, sum) and col_matrix(matrix, sum) and second_diagonal(matrix, sum)

end

#p magic_square([[16, 23, 17], [78, 32, 21], [17, 16, 15]])
p magic_square([[23, 28, 21], [22, 24, 26], [27, 20, 25]])