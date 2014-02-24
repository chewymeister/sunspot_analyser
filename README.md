sunspot_analyser
================

## Problem
To create an algorithm that processes data concerning the thermal activity of the sun.

Input:
1 5 5 3 1 2 0 4 1 1 3 2 2 3 2 4 3 0 2 3 3 2 1 0 2 4 3

Expected output:

(3,3 score:26)

The first digit represents how many results the algorithm should display, largest score first.
The second digit represents the delimiter which determines the outer limits of the area of the
sun that is to be analysed.

## Test Suite

Test data has been coded into RSpec tests.
To see the correct output, run:

  bundle exec rspec specs/sunspot_analyser_spec.rb

To run the whole test suite, run:

  bundle exec rspec specs/
