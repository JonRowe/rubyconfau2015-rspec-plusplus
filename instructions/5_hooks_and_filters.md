# Hooks, tags and filters

Most of you (I hope) will be familiar with hooks and filters from using
`before :each` and `before :group` to setup your tests, some of you will
be familiar with tagging examples to run with `rspec-rails`, but the utility
of hooks and RSpec's metadata setup goes beyond this.

## `before` / `after` / `around`, `:example` / `:context`

These are examples of using hooks to perform setup and/or teardown for
your examples, they can have meta data applied to them that cause them
to only be executed when examples (or contexts) match that metadata.

*Note* the `:suite` hook doesn't currently support metadata filtering.

## Metadata

As I mentioned before `rspec-rails` uses metadata to tag examples so we can
run the appropriate code, this is an example of us using metadata to filter
hooks and module inclusion to the appropriate examples and groups.

There are several built in special case metadata too, such as `skip: "Reason"`
and `pending: "Reason"` (`pending` expects a failure). We also use some by
default (such as `focus`) but isn't given special meaning without configuration.

## Using this for setup

RSpec can use this metadata to configure / setup examples based on their metadata.
For example:

```Ruby
RSpec.configure do |config|
  config.include SomeModule, based_on: :metadata
  config.before :example, based_on: :metadata do
    # all the things
  end
end
```

We can access this metadata outside the example only (to avoid mutating running
examples) but we can access this in `:context` hooks and certain setup APIS
(like registering a custom ordering strategy).

## Challenge

* Improve the performance of our really slow spec file `slow_spec.rb`.
* Use hooks and filters appropriately.
* Don't edit the `super_slow_file`, or the contents of the specs.
* Change the ordering to run the faster specs first.
  (Hint: `RSpec.configure { |c| c.register_ordering(:name) { |items| } }`)
