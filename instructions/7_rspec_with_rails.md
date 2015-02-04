# RSpec and Rails

Many people only know using RSpec with Rails using `rspec-rails`, but we all know
that Rails makes testing slow, for the last few years there has been a push within
our community to use more PORO objects, but when it comes to testing those quite
often we step into the same routine and mix our PORO specs with our `ActiveRecord`
specs and struggle with the Rails boot time when running all our specs.

Luckily this doesn't have to be the case. There are some things we can do to
make Rails a bit nicer when testing with RSpec.

1) Require things as necessary, as surprising amount of Rails functions
   quite happily in isolation, however its much harder to guess at things
   you might need than to simply tell Ruby (require them) when needed.

2) Run ActiveRecord in isolation; It's not hard to configure ActiveRecord
   using the Rails conventions with a snippet like this:

   ```Ruby
     require 'erb'
     require 'yaml'
     require 'active_record'
     config = YAML.load(ERB.new(IO.read('config/database.yml')).result)
     ActiveRecord::Base.establish_connection(config['test'])
   ```

   In this setup ActiveRecord models can now be tested as if they were isolated
   from Rails, and theres usually a dramatic decrease in load time.

   *Caveat* you will have to load (and in some case configure) extensions that
   mix into ActiveRecord yourself. This is often the cause of a large amount of
   frustration and conflating boot times (and an argument for using more PORO
   librariers over plugins).

3) Only run any full stack / integration tests

## Challenge

We're going to combine a few things from the last few sessions to take a look at
writing tests for Rails without using `rspec-rails`. We'll be writing tests for
that good old stand in "Rails Blog" project. Here are some things I want you to try:

* Load rails only before specs requiring all of rails.
  * (Hint: you will need to load the environment, and setup `Capybara.app`)
  * (For integration style tests you will need the Capybara::DSL)
  * Reset capybara after specs of this type.

* Split your specs according to the type of thing you are testing.
  * (Hint: Use metadata and custom ordering.)

* Load the database only when necessary:
  * Hint: parse the yaml config and establish a connection manually.

Bonus challenge!

* Create a formatter that will interupt your test suite if any of your isolated
  specs fail before reaching your integration specs!
