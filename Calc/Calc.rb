class Calc
  
  def self.add(a, b)
    a + b
  end

  def self.subtract(a, b)
    a - b
  end

  def self.multiply(a, b) 
    a * b
  end

  def self.division(a, b)
    a / b
  end

  def self.result
    multiply(2,add(25,25))
  end

  def self.array
    [1, 2, 3]
  end
end