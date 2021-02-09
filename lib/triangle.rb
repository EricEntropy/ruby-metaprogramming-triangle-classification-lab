class Triangle
  attr_accessor :side1, :side2, :side3
  @@sides = []

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    @@sides = [side1, side2, side3]
  end 

  def negative_sides?
    return true if @@sides.min.negative?
  end 

  def triangle_inequality?
    check1 = side1 + side2 > side3
    check2 = side2 + side3 > side1
    check3 = side3 + side1 > side2
    #return true if its a good triangle
    return true if check1 && check2 && check3
  end

  def kind
    if @@sides.sum == 0 || negative_sides? || !triangle_inequality? 
      raise TriangleError
    elsif @@sides.uniq.length == 1
      return :equilateral
    elsif @@sides.uniq.length == 2
      return :isosceles
    elsif @@sides.uniq.length == 3
      return :scalene
    end 
  end 

  class TriangleError < StandardError
    def message
      "STOP"
    end
  end
end
