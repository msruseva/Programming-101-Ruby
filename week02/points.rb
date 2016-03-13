class InfinitePlane

  def initialize(x, y)
    @x, @y = x, y
  end

  def x
    @x
  end

  def y
    @y
  end

  def to_array
    "[#{@x}, #{@y}]"
  end

  def move_to_directions(str)
    go, back = 1, -1

    str.each_char do |c|
      if c == '>'
        @x += go
      elsif c == '<'
        @x += back
      elsif c == "^"
        @y += back
      elsif c == "v"
        @y += go
      else
        temp = go
        go = back
        back = temp
      end
    end
  end

end

plane = InfinitePlane.new 0, 0
plane.move_to_directions '>>><<<~>>>~^^^'
puts plane.to_array

