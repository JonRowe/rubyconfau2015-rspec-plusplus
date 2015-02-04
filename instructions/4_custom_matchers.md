# Custom Matchers

We're going to use matchers to tidy up our specs from the first kata. The
basic DSL for creating a matcher is:

```Ruby
RSpec::Matchers.define :matcher_name do |expected|
  match do |actual|
    # ... logic
  end
end
```

Optionally you can expand this with additonal bits of the DSL:

```Ruby
RSpec::Matchers.define :matcher_name do |expected|
  supports_block_expectations # actual will be a block

  diffable # failed matchers will attempt to diff expected / actual

  description { "..." }
  failure_message { "..." }
  failure_message_when_negated { "..." }

  chain :another_thing, { "..." } # new, allows you to chain multiple matchs

end
```

What I'd like you to do is create a matcher to search the awesome app json
structure for id without specifying intermediary keys.

e.g. `expect(my_json).to have_id 1` would work for `get :show, id: 1` and
      `get :index`
