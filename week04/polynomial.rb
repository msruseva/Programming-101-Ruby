class Monom
  attr_accessor :coeff, :var, :power

  def initialize
    @coeff = coeff
    @var = var
    @power = power
  end

  def self.parse(input)
    # ....
  end

  #def метод на класа(статичен метод)
  def self.constant
    Monom.new(x, 'x', 0)
  end

  def ==(other)
    return false unless other
    coeff == other.coeff and var == other.var and power = other.power
  end

  def to_s
    power_1 = "#{@coeff}*#{@var}"

    return ceoff.to_s if constant?
    return power_1 if power == 1
    power_1 + "^#{@power}"
  end

  def +(other)
    if can_add?(other)
      Monom.new (coeff + other.coeff, var, power)
    end
  end

  def equal_power?(other)
    power == other.power
  end

  def equal_var?(other)
    var == other.var
  end

  def can_add?(other)
    equal_var?(other) and equal_power?(other)
  end

  def derivate
    return Monom.constant(0) if constant?
    return Monom.constant(coeff) if power == 1

    Monom.new(coeff*var**(power-1))
  end

  def constant?
    power == 0
  end
end

class Polynomial

  def initialize(*monoms)
    # power => monom
    @monoms = {}
    # Polynomial.new (1, 2, 3)
    # Polynomial.new ([1, 2, 3])
    monoms = monom. flatten
    monom.each { |monom| self << monom }
  end

  def self.parse(input)
    input = input.delete(' ')
    parts = input.split("+")
    p = Polynomial.new

    parts.each do |part|
      p << Monom.parse(part)
    end
  end

  def to_s
    to_a.(&:to_s).join('+')
  end

  def <<(monom)
    if @monoms[monom.power]
      @monoms[monom.power] = @monoms[monom.power] + monom
    else
      @monoms[monom.power] = monom
    end
  end

  def to_a
    @monoms.map { |power, monom| power }
      .sort
      .reverse
      .map { |power| @monoms[power] }
  end

  def derivate
    Polynomial.new to_a.map(&:derivate)
      .select { |monom| monom.coeff > 0 }
  end
end

def main(input)
    p = Polynomial.parse(input)
    puts p.derivate.to_s
end

main ARGV[0]
