RSpec.describe do
  value = rand
  (1...10000).each do
    example { expect(rand).to be > value }
  end
end
