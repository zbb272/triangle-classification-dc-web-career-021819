require 'pry'
class Triangle
  attr_accessor :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1, @side2, @side3 = side1, side2, side3
  end

  def triangle_valid?
    if self.side1 > 0 && self.side2 > 0 && self.side3 > 0
      if (self.side1 + self.side2) > self.side3 && (self.side1 + self.side3) > self.side2 && (self.side2 + self.side3) > self.side1
        return true
      end
    end
    false
  end

  def kind
    if triangle_valid?
      if self.side1 == self.side2 && self.side2 == self.side3
        return :equilateral
      elsif self.side1 == self.side2 || self.side1 == self.side3 || self.side2 == self.side3
        return :isosceles
      else
        return :scalene
      end
    else
      raise TriangleError
    end
  end

  class TriangleError < StandardError
    def message
      "Invalid Triangle"
    end
  end
end
