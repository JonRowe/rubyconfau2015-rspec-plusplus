# String Calculator Kata

Try to do one step at a time and not read ahead, only test valid inputs and
work incrementally, but the goal of this is to quickly do some specs here.

We will create a simple `String` calculator with a method `#add` that takes
string but returns numbers. The calculator will behave according to the
following rules:

## Basic Rules

* It will return 0 for an empty string.
* It can take 0, 1, or 2 numbers, and will return their sum.
  e.g.(`"1,2"` will return `3`).
* It can take an unknown amount of numbers and sum them.
* It can handle new lines as a delimiter instead of commas.
  e.g (`"1\n2,3"` will return `6`)

## If you have time rules:

* It supports changing the delimiter by starting the string with:
  `"//#{delimiter}\n"`
* It raises an error when encountering negative numbers.
* It shows all the negative numbers encountered in the exception message
* It ignores numbers bigger than 1000
* It allows multiple delimiters when specified in this format:
  `"//[#{delimiter}][#{delimiter}]\n"`
