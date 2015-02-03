RSpec.configure do |config|
  config.filter_run :focus
  config.filter_run_excluding :slow
  config.run_all_when_everything_filtered = true
end
