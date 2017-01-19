# Luhn

Write a program that can take a number and determine whether or not it is valid per the Luhn formula.

The [Luhn algorithm](https://en.wikipedia.org/wiki/Luhn_algorithm) is
a simple checksum formula used to validate a variety of identification
numbers, such as credit card numbers and Canadian Social Insurance
Numbers.

The task is to write a function that checks if a given string is valid.

Validating a Number
------
Strings of length 1 or less are not valid. Spaces are allowed in the input,
but they should be stripped before checking. All other non-digit characters
are disallowed.

As an example of a valid string, here is a fictitious Canadian Social Insurance
Number.

```
046 454 286
```

The first step of the Luhn algorithm is to double every second digit,
starting from the right. We will be doubling

```
_4_ 4_4 _8_
```

If doubling the number results in a number greater than 9 then subtract 9
from the product. The results of our doubling:

```
086 858 276
```

Then sum all of the digits

```
0+8+6+8+5+8+2+7+6 = 50
```

If the sum is evenly divisible by 10, then the number is valid. This number is valid!

An example of an invalid Canadian SIN where we've changed the final digit

```
046 454 287
```

Double the second digits, starting from the right

```
086 858 277
```

Sum the digits

```
0+8+6+8+5+8+2+7+7 = 51
```

51 is not evenly divisible by 10, so this number is not valid.

----

An example of an invalid credit card account

```
8273 1232 7352 0569
```

Double the second digits, starting from the right

```
7253 2262 5312 0539
```

Sum the digits

```
7+2+5+3+2+2+5+2+5+3+1+2+0+5+3+9 = 57
```

57 is not evenly divisible by 10, so this number is not valid.

### Submitting Exercises

Note that, when trying to submit an exercise, make sure the solution is in the `exercism/python/<exerciseName>` directory.

For example, if you're submitting `bob.py` for the Bob exercise, the submit command would be something like `exercism submit <path_to_exercism_dir>/python/bob/bob.py`.


For more detailed information about running tests, code style and linting,
please see the [help page](http://exercism.io/languages/python).

## Source

The Luhn Algorithm on Wikipedia [http://en.wikipedia.org/wiki/Luhn_algorithm](http://en.wikipedia.org/wiki/Luhn_algorithm)

## Submitting Incomplete Problems
It's possible to submit an incomplete solution so you can see how others have completed the exercise.

