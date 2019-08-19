require_relative "./Calc.rb"

describe Calc do
  it "should add two number" do
    expect(Calc.add(5,5)).to eql 10
  end 

  it "should subtract two number" do
    expect(Calc.subtract(5,5)).to eql 0
  end 

  it "should multiply two number" do
    expect(Calc.multiply(5,5)).to eql 25
  end

  it "should divide two number" do
    expect(Calc.division(5,5)).to eql 1
  end

  it "should solve the expression" do
    expect(Calc.result).to be 100
  end

  it "should tested include" do
    expect(Calc.array).to include(3)
  end
end