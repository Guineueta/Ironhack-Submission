require 'rspec'
require './FizzBuzz'



describe "FizzBuzz" do
  describe '#fizzbuss_do' do
  it "return the same number fo number that are not multilple of 3 or 5" do
    result = FizzBuzz.new.fizzbuss_do(2)
    expect(result).to eq(2)
  end

  it "return  Fizz for multiples of 3" do
    result = FizzBuzz.new.fizzbuss_do(9)
    expect(result).to eq("Fizz")
  end

it "return the Buzz for multiples of 5" do
  result = FizzBuzz.new.fizzbuss_do(5)
  expect(result).to eq("Buzz")
end

it "return the FizzBuzz for multiples of 15" do
  result = FizzBuzz.new.fizzbuss_do(15)
  expect(result).to eq("FizzBuzz")
end
end
end
