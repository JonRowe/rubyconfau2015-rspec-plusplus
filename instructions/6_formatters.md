# Formatters

Formatters form the core of RSpec's reporting, we use them to produce the output
you see on your terminal, for producing html reports and integrating with other
services. But what if you want to change that output, or integrate with another
tool?

Fortunately we allow you to provide custom implementations of formatters to
RSpec to tailor the output to your needs. The formatter protocol follows an
event subscription pattern, you tell RSpec what notifications you respond to
and we will then send you notifications when these things happen.

The basic structure of a formatter is:

```Ruby
class MyTotallyAmazingFormatter
  RSpec::Core::Formatters.register self, :example_failed, :example_passed

  def initialize output
    @output = output
  end

  def example_failed notification
    @output.puts "Bad times baz, we broke the build."
  end

  def example_passed notification
    @output.puts "Good news everyone!"
  end

end
```

## Challenge

Build a custom formatter that displays spec progress as a percentage passed/
failed as the suite progresses. Use `generate_specs` to create a test suite
to run for you, and display the progress as a bar e.g.:

`Passed ========|--------------- Failed`

Additionally if you have time, display number of specs remaining, and estimate
time to go based on progress so far.

Hint(s):

* Use `"\r"` to rewind console output on a line.
* Notifications available to you:
  :close, :deprecation, :deprecation_summary, :dump_summary, :dump_failures,
  :dump_pending, :dump_profile, :example_group_started, :example_group_finished,
  :example_started, :example_passed, :example_pending, :example_failed,
  :message, :seed, :start, :start_dump
