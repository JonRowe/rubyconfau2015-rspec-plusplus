# Compound Matchers

Compound matchers allow us to combine multiple expectations in our specs,
rather than having to repeat specs to meet the 1 expectation per spec rule
or having a sprawl of expectations in our spec.

Consider creating an acceptance test for our awesome application that returns
a bunch of JSON encoded data for us to decipher, what happens when we want to
introspect more than one field at a time? Compound matchers to the rescue.

```Ruby
expect(my_json).to a_hash_including(
  'something' => array_including(hash_including(id: 1))
)
```

It's worth noting that because matchers return a reusable object, combining
matchers in this way can also be used to create reusable "simple" matchers.

```Ruby
def have_detail fragment
  a_hash_including(
    'something' => array_including(hash_including(fragment))
  )
end
```

In addition to allowing matchers to be nested inside each other, you can also
combine several together using `and` and `or`, e.g.

```Ruby
expect(my_json).to have_detail(id: 1).and have_detail(id: 2)
```

However you cannot negate matchers in this fashion (due to ambiguity as to
how that would apply given Rubys vs "our" language parsing and the issue of
negated descriptions), we do however provide an API to create a negated
version of a specific matcher. e.g.

```Ruby
RSpec::Matchers.define_negated_matcher :preserve, :change

expect { object.action }.to preserve { object.value }
```


## Challenge

* Check that my app returns an index listing all my models with their urls.
* Refactor this check into an easy to reuse statement.
* Check a model contains only the fields I care about.
* Check the inverse of some of your specs.
