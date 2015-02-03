class StringCalculator

  # @return Fixnum
  def add string
    return 0 if string.empty?
    if string.start_with? '//'
      delimitor_string, string = string.split("\n", 2)
      bits = delimitor_string.scan(/\[([^\]]+)\]/) 
      if bits.empty?
        delimitor = delimitor_string[2]
      else
        delimitor = /#{bits}/
      end
    else
      delimitor = /[,\n]/
    end
    numbers = string.split(delimitor).map(&:to_i)
    negatives = numbers.select { |n| n < 0 }
    raise "Negative numbers not supported, used: #{negatives}" unless negatives.empty?
    numbers.select { |n| n <= 1000 }.inject(0, &:+)
  end

end

RSpec::Matchers.define :raise_error_matching do |expected|
  supports_block_expectations

  match do |actual|
    begin
      actual.call
      false
    rescue StandardError => error
      @result = error
      expect(error.message).to match expected
      true
    end
  end

  failure_message do |actual|
    if @result
      "expected #{@result} to have a string including #{expected}"
    else
      "expected an error with a message string including #{expected}"
    end
  end
end

RSpec.describe "StringCalculator" do

  let(:calc) { StringCalculator.new }

  it "returns 0 for an empty string" do
    expect(calc.add "").to eq 0
  end

  it "takes one number" do
    expect(calc.add "1").to eq 1
  end

  it "takes two numbers" do
    expect(calc.add "1,2").to eq 3
  end

  it "supports an unknown amount of numbers" do
    expect(calc.add "1,2,3,4,5").to eq 15
  end

  it "supports new lines between numbers" do
    expect(calc.add "1\n2,3").to eq 6
  end

  it "supports delimiters" do
    expect(calc.add "//;\n1;2").to eq 3
  end

  it "doesnt support negatives" do
    expect{ calc.add "1,-2" }.to raise_error
  end

  it "includes all negatives in expection" do
    expect{ calc.add "1,-2,-3" }.to raise_error_matching '-2, -3'
  end

  it "ignores numbers bigger than 1000" do
    expect(calc.add "1001,2").to eq 2
  end

  it "supports delimits chars bigger than 1" do
    expect(calc.add "//[***]\n1***2").to eq 3
  end

  it "supports multiple delimiter chars" do
    expect(calc.add "//[*][%]\n1*2%3").to eq 6
  end
end
