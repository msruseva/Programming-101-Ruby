class Vector2D
  def initialize(x, y)
    @x, @y = x, y
  end

  def x
    @x
  end

  def x=(value)
    @x = value
  end

  def y
    @y
  end

  def y=(value)
    @y = value
  end

  def length
    exponent_x = @x*@x
    exponent_y = @y*@y
    x_y = exponent_x + exponent_y
    Math.sqrt(x_y)
  end

  def normalize
    @x /= length
    @y /= length
  end

  def ==(other)
    @x == other.x
    @y == other.y
  end

  def +(other)
    Vector2D.new @x + other.x, @y + other.y
  end

  def -(other)
    Vector2D.new @x - other.x, @y - other.y
  end

  def *(scalar)
    Vector2D.new @x * other.x, @y * other.y
  end

  def /(scalar)
    Vector2D.new @x / other.x, @y / other.y
  end

  def dot(other)
    dot_product = @x*other.x + @y*other.y
  end

  def to_s
    "(#{@x}, #{@y})"
  end
end

class Vector
  def initialize(*components)
  	@components = components.flatten
  end

  def dimension
    dimension = @components.length
    p "#{dimension}D"
  end

  def length
    sum = 0
    @components.chars.each do |ch|
    	sum += x*2
    end

    length = sqrt(sum)
  end

  def normalize
    @components /= length
  end

  def [](index)
    @components[index]
  end

  def []=(index, value)
    @components[index] = value
  end

  def ==(other)
    if @components.length == other.length
    	index = 0
    	equal = true

    	while index < @components.length
    		if @components[index] == other[index]
    			index += 1
    		elsif 
    			equal = false
    		end
    	end

    	if equal == true
    		true
    	else
    		false
    	end
    end
  end

  def +(vector_of_same_dimension_or_scalar)
    
  end

  def -(vector_of_same_dimension_or_scalar)
   
  end

  def *(scalar)
    # Return a new Vector that represents the result
    # Your code goes here.
  end

  def /(scalar)
    # Return a new Vector that represents the result
    # Your code goes here.
  end

  def dot(vector_of_same_dimension_or_scalar)
    # Return the dot product of the two vectors
    # https://en.wikipedia.org/wiki/Dot_product#Algebraic_definition
  end

  def to_s
    # Your code goes here.
  end
end