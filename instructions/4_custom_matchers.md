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

What I'd like you to do is (if you haven't already) is implement these steps
from the string calculator kata:

* It raises an error when encountering negative numbers.
* It shows all the negative numbers encountered in the exception message

And then refactor your specs to use a custom matcher to tidy this up.
