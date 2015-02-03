# Load all the things, or pretend to anyway
sleep 3

module OurApp
  module_function

  def do_setup
    sleep 0.2
  end

  def do_more
    sleep 0.2
    @super_prepared = true
  end

  def do_something_slow
    sleep 1
    true
  end

  def be_prepared
    @super_prepared
  end
end
