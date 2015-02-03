require 'spec_helper'
require 'super_slow_file'

RSpec.configure do |config|
  config.include OurApp
end

RSpec.describe slow: true do
  before do
    do_setup
    do_more
  end

  it "relies on something outside the application" do
    expect("Something").to include "thing"
  end

  it "relies on something else outside the application" do
    expect("Something").to include "Some"
  end

  it "relies on the application being loaded" do
    expect(defined? OurApp).to be_truthy
  end
  it "relies on the application being prepared" do
    expect(be_prepared).to be true
  end

  it "relies on the application being setup" do
    expect(do_something_slow).to be true
  end
end
