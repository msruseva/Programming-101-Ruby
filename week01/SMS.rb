def group(n)
  index, result, equal, temp = 0, [], [], n[0]

  n.each_with_index do |value, index|
    next_value = n[index + 1]
    if value == next_value
      equal << temp
    else
      result << equal
      equal << temp
      equal = []
    end
    temp = next_value
  end

  result
end

#p group([2, 1, 2, 2, 1, 2, 2, 2])
def find(n)
  result = []
  n = group(n)

  n.each { |element| result << [element, element.length]}

  result
end

p find([2, 1, 2, 2, 1, 2, 2, 2])

def numbers_to_message(pressedSequence)
  keypad = {
    2 => 'abc',
    3 => 'def',
    4 => 'ghi',
    5 => 'jkl',
    6 => 'mno',
    7 => 'pqrs',
    8 => 'tuv',
    9 => 'wxyz',
    0 => ' ',
  }
  result = ''
  pressedSequence = find(pressedSequence)
  p pressedSequence

  pressedSequence.each_with_index do |item, index|

    keypad.each do |key, value|
    end

  end

  result
end

#p numbers_to_message([2, -1, 2, 2, -1, 2, 2, 2])
#p numbers_to_message([2, 2, 2, 2])
#p numbers_to_message([4, 4, 4, 8, 8, 8, 6, 6, 6, 0, 3, 3, 0, 7, 7, 7, 7, 7, 2, 6, 6, 3, 2])

def count_letters(str)
  index, result, equal_temp, temp = 0, [], [], str[0]
  str = str.downcase

  while index < str.length

    if temp == str[index + 1]
        equal_temp << temp
    else
      result << equal_temp
      equal_temp << temp
      equal_temp = []
    end

    temp = str[index + 1]
    index += 1
  end

  result
end

def array_to_string(n)
  result, index = '', 0

  while index < n.length
    result += n[index]
    index += 1
  end
  result
end
def times(how_many_times, n)
  index, time = 0, []

  while index != how_many_times
    time << n
    index += 1
  end

  time
end

#p times(3, 2)
def message_to_numbers(str)
  keypad = {
    'finger' => 1,
    'abc' => 2,
    'def' => 3,
    'ghi' => 4,
    'jkl' => 5,
    'mno' => 6,
    'pqrs' => 7 ,
    'tuv' => 8,
    'wxyz' => 9,
    ' ' => 0
  }
  index, index_i, result = 0, 0, []
  hash = Hash.new
  temp = group(str)

  while index < temp.length
    key = array_to_string(temp[index])
    value = key.length
    hash = Hash[key => value]
    #p hash
    index += 1
  end
  #result
end

#p message_to_numbers("a")
#p message_to_numbers("Ivo e panda")
#p message_to_numbers("abccc")
