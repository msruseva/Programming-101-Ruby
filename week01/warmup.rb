def fact(n)
  result = 1

  if n < 0
    nil
  end

  while n > 0 do
    result *= n
    n -= 1
  end

  result
end

def fact(n)
  if n <= 1
    1
  else
    n * fact(n - 1)
  end
end

def nth_lucas(n)
  if n == 0
    2
  elsif n == 1
    1
  else
    nth_lucas(n-1) + nth_lucas(n-2)
  end
end

def first_lucas(n)
  if n == 1
    [nth_lucas(0)]
  else
    first_lucas(n-1) + [nth_lucas(n)]
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
  counter = 0
  sum = 0

  while n > 0 do
    digit = n % 10
    n = n / 10
    counter += 1
    sum += digit
  end

  sum
end

def factorial_digits(n)
  counter = 0
  sum = 0

  while n > 0 do
    digit = n % 10
    n = n / 10
    digit = fact(digit)
    counter += 1
    sum += digit
  end

  sum
end

def fib(n)
  if n == 0
    0
  elsif n == 1
    1
  else
    fib(n-1) + fib(n-2)
  end
end

def fib_number(n)
  if n == 1 || n == 0
    1
  else
    (fib_number(n-1).to_s + fib(n).to_s).to_i
  end
end

def hack?(n)
  revurse_n = 0
  counter = 0
  n = n.to_s(2).to_i # turn integer into binary number
  old_n = n

  while n > 0 do
    digit = n % 10
    if digit == 1
      counter += 1
    end
    revurse_n = revurse_n * 10 + digit
    n = n / 10
  end
  if revurse_n == old_n and counter % 2 != 0
    true
  else
    false
  end
end

def next_hack(n)
  n += 1
  while hack?(n) == false do
    n += 1
  end
  n
end


def count_vowels(str)
  counter = 0
  vowels = 'aeiouy'
  str.downcase!

  str.each_char {|ch|
    if vowels.include? ch
      counter += 1
    end
  }
  counter
end

def count_consonants(str)
  counter = 0
  consonants = 'bcdfghjklmnpqrstvwxz'
  str.downcase!

  str.each_char { |ch|
    if consonants.include? ch
      counter += 1
    end
  }
  counter
end


def palindrome?(obj)
  obj = obj.to_s
  if obj.reverse == obj
    true
  else
    false
  end
end

def p_score(n)
  counter = 1

  if palindrome?(n) == true
    1
  else
    while palindrome?(n) == false do
      n = n + n.to_s.reverse.to_i
      counter += 1
    end
  end
  counter
end

def prime?(n)
  counter = 0
  temp = 1

  while temp <= n do
    if n % temp == 0
      counter += 1
      temp += 1
    else
      temp += 1
    end
  end

  if counter <= 2
    true
  else
    false
  end
end

def first_primes(n)
  temp = 2
  result = []

  while n > 0 do
    if prime?(temp) == true
      result << temp
      temp += 1
      n -= 1
    else
      temp += 1
    end
  end
  result
end

def sum_of_numbers_in_string(str)
  numbers = '0123456789'
  integers, index, sum = '', 0, 0

  while index < str.length
    if numbers.include? str[index]
      integers += str[index]
    else
      sum += integers.to_i
      integers = ''
    end
    index += 1
  end
  sum += integers.to_i

  sum
end

def anagrams?(a, b)
  if a.chars.sort == b.chars.sort
    true
  else
    false
  end
end

def sum_digits(n)
  digits = n.to_s.chars
  result, index = 0, 0

  while index < digits.length do
    result += digits[index].to_i
    index += 1
  end
  result
end

def balanced?(n)
  sum = 0
  n = n.to_s
  middle = n.size/2

  left_part = n.slice(0, middle)
  right_part = n.slice(middle + n.length % 2, n.length)

  sum_digits(left_part.to_i) == sum_digits(right_part.to_i)
end

def zero_insert(n)
  index, n = 0, n.to_s

  while index < n.length do
    a, b = n[index].to_i, n[index + 1].to_i
    if a == b or (a + b) % 10 == 0
      n.insert(index + 1, '0')
    end
    index += 1
  end
  n.to_i
end

p nth_lucas(2)
