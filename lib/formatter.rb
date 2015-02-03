class MyTotallyAmazingFormatter
  RSpec::Core::Formatters.register self, :example_failed, :example_passed,
    :start, :dump_summary

  def initialize output
    @output = output
    @passed = 0
    @failed = 0
    @total  = 0
  end

  def start notification
    @total = notification.count
  end

  def example_failed notification
    @failed += 1
    dump
  end

  def example_passed notification
    @passed += 1
    dump
  end

  def dump
    @output.write "\r#{percent @passed} passed, #{percent @failed} failed, out of #{@total}"
  end

  def dump_summary notification
    dump
    @output.write "\n"
  end

private

  def percent number
    ((number.to_f / @total) * 100).to_i.to_s + '%'
  end

end
