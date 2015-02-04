module CLI
  module_function
  def run input, calc
    STDOUT.outputs calc.parse input.read
  end
end
class Calculator
  def parse string
    0
  end
end

RSpec.describe do
  let(:input)  { object_double STDIN, read: "a_string" }
  let(:output) { object_double STDOUT, puts: nil }
  let(:calc)   { instance_double "Calculator", parse: 42 }

  it "takes input from STDIN and outputs the result to STDOUT" do
    expect(input).to receive(:read)
    expect(calc).to receive(:parse).with("a_string")
    expect(STDOUT).to receive(:outputs).with(42)
    CLI.run input, calc
  end
end
