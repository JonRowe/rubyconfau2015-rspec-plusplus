# String Calculator Executable

Now we're going to expand the calculator to take input from the command line.

## Basic Rules

* We're going to use a test double to test the interaction between our client
  and the calculator.
* Parse string from the command line, run calculation, print result on new line
* Modify the program to ask for repeated input.

## Hints

* Try the new RSpec 3 verifying double features with this kata:
  * `instance_double` takes a string representing the class used as the double name
  * `object_double` can be used with `STDOUT` to verify the method existance
* Load the original kata source and change the method name to be `#parse`
