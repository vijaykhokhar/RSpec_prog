require_relative "./Calc.rb"

describe Calc do
  it "should add two number" do
    #expect(Calc.add).to eql 10
  end 

  it "should subtract two number" do
    expect(Calc.subtract).to eql 0
  end 

  it "should multiply two number" do
    expect(Calc.multiply).to eql 25
  end

  it "should divide two number" do
    expect(Calc.division).to eql 1
  end

  it "should add two parameter" do 
    expect(Calc.add(3, 5)).to be 8
  end
end