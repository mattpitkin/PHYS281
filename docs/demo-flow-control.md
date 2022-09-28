# Flow control

<iframe width="560" height="315" src="https://www.youtube.com/embed/fdTCVX2CqPk" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

When Python runs a @(script) the code is executed from the top to the bottom. However, you might
want to only run certain parts of the code given specific conditions, or you might want to repeat
something multiple times. To do this you can use flow control:

 * [`if... elif... else` statements](#if-statements) (sometime called clauses)
 * [`for` loops](#for-and-while-loops)
 * [`while` loops](#while-loops)

## Indenting

In Python the way to specify that you are defining something "inside" a flow control statement, or
function, or class, is by using indenting. Most other languages use parentheses (i.e., brackets) of
some sort, but in Python indenting is essential.

Things that are together within the same statement or definition must be indented using
@(whitespace) (regular spaces or tabs) to the same level.

!!! tip
    Be consistent with your whitespace. It is highly recommended that you use spaces rather than
    tabs. Using four spaces for each level of indentation is considered standard and is recommended.

If you are nesting statements (i.e., flow control within a function definition, or loops within
loops), each statement definition must be further indented.

```python
if a == b:
    # first level of indentation (within if statement)
    for x in range(y):
        # second level of indenting (within for loop and if statement)
        if x > a:
            # third level of indenting (within if statement within for loop
            # within outer if statement)
            ...
```

**Correct examples**

```python
x = True
if x is True:
    # Indented with 4 spaces
    print("x is true!")

def my_function(a):
    # first level of indentation
    x = range(a)
    y = []
    for i in x:
        # second level of indentation
        y.append(i * 2 + 1)

    # back to first level of indenting (i.e., outside the for loop, but still in the function definition)
    return y

# back outside the function definition
b = my_function(10)
print(b)
```

**Incorrect examples**

```python
x = True
if x is True:
# we've forgotten any indentation!
print("x is True")
IndentationError: expected an indented block

if x is True:
  # different indenting levels
  print("x is True")
    print("...or is it!")
IndentationError: unexpected indent
```

If you are writing code in an IPython terminal session, or using _VS Code_ with the Python
extension, it can automatically indent for you. But, be careful!

## Conditional expressions

Before discussing [`if` statements](#if-statements) we need to describe conditional expressions.
These can be mathematical equalities and inequalities (useful for comparing numbers, but also usable
for other objects):

 * `x == y`: "the value of `x` is equal to the value of `y`"
 * `x != y`: "the value of `x` is not equal to the value of `y`"
 * `x > y`: "the value of `x` is greater than the value of `y`"
 * `x >= y`:  "the value of `x` is greater than, or equal to, the value of `y`"
 * `x < y`: "the value of `x` is less than the value of `y`"
 * `x <= y`:  "the value of `x` is less than, or equal to, the value of `y`"

These return a boolean value of `True` or `False`:

```python
x = 2
y = 3

x == y
False

x != y
True

x > y
False

x >= y
False

# save the output to a variable
expression = (x < y)
print(expression)
True
```

These expressions can be combined with the logical statements
[`and`](https://www.w3schools.com/python/ref_keyword_and.asp),
[`or`](https://www.w3schools.com/python/ref_keyword_or.asp),
[`not`](https://www.w3schools.com/python/ref_keyword_not.asp):

 * `x and y`: `True` if both `x` is `True` **and** `y` is `True`
 * `x or y`: `True` if either `x` is `True` **or** `y` is `True`
 * `not x`: `True` if `x` is **not** `True` (i.e., `x` is `False`)

where `x` and `y` can be variables, or other conditional expressions like above. These expressions
return boolean values:

```python
a = 1
b = 5
c = 1

(a == c) and (a < b)
True

(a != c) or (a < b)
True

not (a == c)
False
```

!!! note
    If you have an `int` or `float` variable that is set to zero it will evaluate as `False` in
    a logical expression while any non-zero value will evaluate as `True`. For array-like variables
    such as lists, dictionaries or tuples, or strings, an empty array will evaluate as `False` while
    an array containing any number of values will evaluate as `True`.

The `is` @(keyword) can be used to test if two variables have the same value and are also of the
same type:

```python
x = 2     # integer value
y = 2.0   # float value

# test that they have the same value
x == y
True

# test that the are the same
x is y
False
```

## `if` statements

You may want to execute a part of your code only if a certain condition is fulfilled. You can place
that code inside an `if` clause:

```python
x = 4

if x < 10:
    # indent the code within the if statement
    y = x * 2

# exit the if statement by removing the indent
print(y)
8
```

The condition being evaluated can be any combination of conditional expressions and logical
statements (it is neater to have them each within brackets):

```python
x = 5.5
y = "Hello"
z = 13

if ((x != 3.0) and (y[0] == "H")) or (x % 2):
    print("I'm in the if statement")
I'm in the if statement
```

### `else`

If statements allow you to execute code under a certain condition, but what if you also want to
execute some different code if the condition is not fulfilled? You can combine an `if` with an
`else`:

```python
x = 4

if x < 2:
    # indent inside the initial if statement
    print("My number is less than 2")
else:
    # indent again for the else statement
    print("My number is greater than or equal to 2")
"My number is greater than or equal to 2"
```

### `elif`

There may be multiple exclusive conditions that you want to test for. To do this you can use `elif`
(a shortening of "else if") statements after an initial `if` statement:

```python
x = 3

if x < 2:
    # indent inside the initial if statement
    print("My number is less than 2")
elif x < 4:
    # indent again for the elif statement
    print("My number is greater than or equal to 2, but less than 4")
else:
    # indent again
    print("My number is greater than or equal to 4")
My number is greater than or equal to 2, but less than 4
```

You can have as many `elif` statements as required.

!!! note
    You do not have to end with an `else` if you've covered all the condition that are required.

## `for` and `while` loops

You often need to get code to repeat a task multiple times. Rather than having to repeatedly write
the same piece of code over and over you can place it inside a
[`for`](https://www.w3schools.com/python/ref_keyword_for.asp) statement or
[`while`](https://www.w3schools.com/python/ref_keyword_while.asp) statement.

A `for` statement is used to increment though a sequence of values (i.e., those in a list or a
tuple) and run whatever is within the statement at each iteration. The code within the `for`
statement is often dependent on the current value in the sequence. Some basic examples are:

```python
values = [0, 1, 2, 3, 4]
squaredvalues = []  # empty list that we'll append to
for i in values:
    # code within the loop must be indented
    print(i)
    squaredvalues.append(i ** 2)

# unindent to exit the loop code
print(squaredvalues)
0
1
2
3
4
[0, 1, 4, 9, 16]
```

```python
sentence = ""
words = ["Coding", "in", "Python", "is", "fun!"]
for word in words:
    sentence += word + " "
print(sentence)
Coding in Python is fun!
```

The @(keywords) used here are `for` and `in`. The value after `in` is the sequence to be iterated
through; it can be any @(iterable), which in Python is any object that contains a set of values that
can be moved through. The value between `for` and `in` will contain the current value from the
sequence and can be used within the loop. It is a variable and can be named whatever you want it to
be.

### Useful `for` loop tips

#### `range`

The [`range`](https://docs.python.org/3/library/functions.html#func-range) @(built-in) function is
very useful in `for` loops to allow you to loop over a set of increasing or decreasing integer
numbers. `range` can take either one, two or three integer value arguments:

```python
# loop over the numbers 0 to 4 in steps to 1 (range goes from 0 to one less than the argument)
for i in range(5):
    print(i)
0
1
2
3
4

# loop over the numbers from 3 to 7 in steps of 1
for i in range(3, 8):
    print(i)
3
4
5
6
7

# loop over the numbers 2 to 10 in steps of 2
for i in range(2, 11, 2):
    print(i)
2
4
6
8
10

# loop backwards from 10 to 2 in steps of -2
for i in range(10, 1, -2):
    print(i)
10
8
6
4
2
```

!!! question
    Why do you give it an integer one bigger than the last value? Because Python indexing starts at 0
    and therefore this works:

    ```python
    x = [3, 1, 5, 7]
    # use the length of x as the argument to range
    for i in range(len(x)):
        print(x[i])
    3
    1
    5
    7
    ```

!!! note
    In Python 3 `range` does not return a list, so if you want to use it to create a list you
    must do, e.g., `x = list(range(10))`

#### `enumerate`

The [`enumerate`](https://docs.python.org/3/library/functions.html#enumerate) built-in function
allows you to loop over both the indices and values of a sequence that you give it. For each
iteration of a loop it returns a tuple pair containing the index and value (you can name these
whatever you want), e.g.:

```python
x = ["a", "b", "c"]
for i, xvalue in enumerate(x):
    # i contains the index, and x value contains the value
    print(i, xvalue)
0 a
1 b
2 c
```

#### `zip`

The [`zip`](https://docs.python.org/3/library/functions.html#zip) built-in function allows you to
"zip" together two or more equal length sequences. If used in a `for` loop it will return a tuple
with the group's items, e.g.:

```python
x = ["a", "b", "c"]
y = [12.4, 1.5, 6.7]
for xvalue, yvalue in zip(x, y):
    print(xvalue, yvalue)
a 12.4
b 1.5
c 6.7
```

#### `break` and `continue`

The [`break`](https://www.w3schools.com/python/ref_keyword_break.asp) and
[`continue`](https://www.w3schools.com/python/ref_keyword_continue.asp) @(keywords), combined with
`if...elif...else` conditional statements, are ways of using flow control within a loop. `break`
allows you to exit a loop if a certain condition is fulfilled, e.g.,

```python
for i in range(-5, 6):
    # exit the loop if the numbers become positive
    if i >= 0:
        # indent again in the if statement
        break
    print(i)
-5
-4
-3
-2
-1
```

`continue` returns to the start of the loop without implementing any of the code below it within the
loop, e.g.,:

```python
for i in range(-5, 6):
    if i < 0:
        # do not reach the print statement if i is negative
        continue
    print(i)
0
1
2
3
4
5
```

### `while` loops

A [`while`](https://www.w3schools.com/python/ref_keyword_while.asp) loop takes a conditional
expression and keeps looping over the code within it until that condition is satisfied:

```python
x = 4
while x < 10:
    # indent the code within the loop
    x += 2
print(x)
```

!!! note
    Even if the condition is fulfilled at the start of the loop the rest of the code below will still be run for that iteration:

    ```python
    x = 4
    while x > 0:
        x -= 1
        print(x)
    3
    2
    1
    0
    ```

You can have "infinite" while loops by setting the condition to `True`, however these must contain a
`break` statement otherwise they will never stop, e.g.,

```python
x = 0
while True:
    if x > 10:
        # have a break statement within the loop
        break
    x += 1
```

## List comprehension

You can use the `for` statement to create lists using a single line of code. This is called _list
comprehension_. For example, suppose we had a list of values and we wanted to create a new list with
the square of each of those values:

```python
values = [1, 2, 3, 4, 5]
x = [y ** 2 for y in values]
print(x)
[1, 4, 9, 16, 25]
```

For reference, in case you see it in other code, another way of doing this is to use the
[`map`](https://docs.python.org/3/library/functions.html#map) built-in function and a function (or a
[`lambda`](https://www.w3schools.com/python/python_lambda.asp) function):

```python
values = [1, 2, 3, 4, 5]
x = list(map(lambda x: x ** 2, values))
print(x)
```

!!! note
    For ease of readability, among other things, it is [highly
    recommended](https://www.geeksforgeeks.org/python-map-vs-list-comprehension/) to use list
    comprehension rather than `map`.

We can also use an `if` statement within list comprehension if we require a specific condition to be
met, e.g.:

```python
import math
values = [-3, -2, -1, 0, 1, 2, 3]
# get a list of square roots, but only for positive numbers
x = [math.sqrt(y) for y in values if y > 0]
print(x)
[1.0, 1.4142135623730951, 1.7320508075688772]
```

There is a very similar construct for dictionaries, called _dictionary comprehension_:

```python
values = [1, 2, 3]
keys = ["a", "b", "c"]
x = {keys[i]: values[i] for i in range(3)}
print(x)
{'a': 1, 'b': 2, 'c': 3}
```