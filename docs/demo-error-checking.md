---
title: Error checking and debugging
authors:
    - Matthew Pitkin
date: 2020-08-12
---

# Error checking and debugging

<iframe width="560" height="315" src="https://www.youtube.com/embed/biimYBveWJE" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

If there is a problem in some Python code being run it will often stop and print out an error
message to the screen. This is called "raising" an error, also known as an @(exception). The final
line of the error message will be the [type of
exception](https://docs.python.org/3/library/exceptions.html) that has been raised. Preceding this
will be a "@(traceback)" showing where the error occurred in the code, often with a line number, and
can be nested down through the chain of functions calling the buggy code. This chain of functions
may be ones that you have defined or functions within a @(built-in) or user installed module.

These errors are often not that informative for novices (or indeed experts), especially at first
glance. But looking at the exception type can give hints as to the cause of the problem.

## Common exceptions

A non-exhaustive list of errors and some reasons for them is given below.

### Syntax errors

If code contains invalid Python @(syntax) then a
[`SyntaxError`](https://docs.python.org/3/library/exceptions.html#SyntaxError) may be raised, often
when importing a module containing a bug. The cause of such an error is often:

 * forgetting to put a colon `:` on a line defining a function, class or flow control statement;
 * forgetting to close a set of open brackets (it can be tricky keeping track of open and closing
   bracket in some statements).

Many Python editors, including _VS Code_, will highlight the associated pair of opening and closing
brackets if you click on one of them. This can help finding missing brackets.

#### Forgotten colon

```python hl_lines="1"
--8<-- "docs/showsyntaxerror_colon.py"
```

```python hl_lines="7"
from showsyntaxerror_colon import myfunc
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/home/matthew/repositories/PHYS281/docs/showsyntaxerror_colon.py", line 1
    def myfunc()  # look, no colon!
                                  ^
SyntaxError: invalid syntax
```

#### Forgotten closing bracket

```python hl_lines="3 4"
--8<-- "docs/showsyntaxerror_bracket.py"
```

```python hl_lines="7"
from showsyntaxerror_bracket import myfunc
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/home/matthew/repositories/PHYS281/docs/showsyntaxerror_bracket.py", line 4
    return x
         ^
SyntaxError: invalid syntax
```

Often when exceptions are raised due to not closing brackets the error message will pick out the
line _after_ the one containing the invalid statement. Above it shows the error coming from the
`return` line rather than the `x` definition line.

### Import errors

Trying to import a module that is not installed or present in your path will result in an
[`ImportError`](https://docs.python.org/3/library/exceptions.html#ImportError) or a
[`ModuleNotFoundError`](https://docs.python.org/3/library/exceptions.html#ModuleNotFoundError):

```python hl_lines="4"
import blahblahblah
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
ModuleNotFoundError: No module named 'blahblahblah'
```

### Indentation errors

If a function, class or flow-control definition contains inconsistent indentation it will result in
an [`IndentationError`](https://docs.python.org/3/library/exceptions.html#IndentationError). 

```python hl_lines="2 3"
--8<-- "docs/indentationerror.py"
```

```python hl_lines="7"
from indentationerror import myfunc
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/home/matthew/repositories/PHYS281/docs/indentationerror.py", line 3
    y = 2  # indented with 5 spaces!
    ^
IndentationError: unexpected indent
```

### Index errors

For array-like objects, e.g., lists, trying to access an element that is outside its range will
raise an [`IndexError`](https://docs.python.org/3/library/exceptions.html#IndexError):

```python hl_lines="5"
x = [1, 2, 3]
print(x[5])  # try accessing 6th value, which does not exists
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
IndexError: list index out of range
```

### Key errors

For dictionary objects, trying to access a key that does not exists will raise a
[`KeyError`](https://docs.python.org/3/library/exceptions.html#KeyError):

```python hl_lines="5"
y = {"a": 1, "b": 2}
y["c"]  # try accessing "c" key that does not exists
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'c'
```

### Name errors

Trying to use a variable name before it has been defined will raise a
[`NameError`](https://docs.python.org/3/library/exceptions.html#NameError):

```python hl_lines="4"
print(z)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'z' is not defined
```

### Attribute errors

Trying to use an attribute of an object, when it is not defined by that object's class, will raise
an [`AttributeError`](https://docs.python.org/3/library/exceptions.html#AttributeError):

```python hl_lines="5"
x = 1
x.hello  # integers have no hello attribute!
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
AttributeError: 'int' object has no attribute 'hello'
```

### Type errors

Passing a variable to a class or function that is not of the required type, or trying to get
an index from a variable that is not array-like, or trying to use a variable as a function when
it's not a function, will often raise a
[`TypeError`](https://docs.python.org/3/library/exceptions.html#TypeError):

```python hl_lines="5"
import math
math.sqrt("a")  # the square root of a letter!!!
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: must be real number, not str
```

```python hl_lines="5"
x = 2
x[1]  # try and get an index position from an integer!
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: 'int' object is not subscriptable
```

```python hl_lines="5"
x = 3.4
x()  # try and call x as if it were a function/callable
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: 'float' object is not callable
```

### IO errors

Trying to open a file that does not exist will raise a
[`FileNotFoundError`](https://docs.python.org/3/library/exceptions.html#FileNotFoundError):

```{.py3 hl_lines="6"}
# try opening a non-existent file
with open("blah.txt", "r") as fp:
    fp.readlines()
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
FileNotFoundError: [Errno 2] No such file or directory: 'blah.txt'
```

## Adding exception handling to code

Sometimes you can anticipate that a user of your code might get something wrong, e.g., pass a
variable of the wrong type to a function. When writing the function you can add checks and raise
errors, e.g.:

```python
def i_only_like_ints(x):
    # check x is an integer
    if not isinstance(x, int):
        # raise a TypeError and give an informative message
        raise TypeError("I really do only like integers!")

    return "Thank you for the integer"

i_only_like_ints(2.3)  # give it a float
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "<stdin>", line 4, in i_only_like_ints
TypeError: I really do only like integers!
```

You can also "catch" exceptions raised by other functions and handle them how you want. For
example, you may not want your code to fail if a certain exception is raised, but instead do
something different:

```python
def i_am_ok_with_any_number(x):
    try:
        # try converting x to a complex number type
        complex(x)
    except ValueError:  # "catch" if this raises a ValueError
        # print a message but don't fail
        print("Please give me a number not a {}".format(type(x)))
        return
    
    return "Thank you for the number: {}".format(x)
```

## Debugging tips

Code will almost inevitably contain bugs at first. Debugging is the process of tracking down and
fixing any bugs. This often takes more time than writing the code in the first place!

To help with debugging it is useful to have well documented code so you can understand what each
section is supposed to do.

Here are a few general tips for debugging:

 * Read the output error message, it may be more informative than you first think (see [above](#common-exceptions)).
 * Check that all variables that you are trying to use are defined and within scope.
 * Check that all variables are of the expected type and shape that you want. You can use
   `print(type(x))`, where `x` is your variable name, to find the type.
 * Check that any `for` or `while` loops exit when expected; do your `while` loops have a break
   condition and increment any counters correctly?
 * To find out where a code is failing, or if there are any problematic variables, add `print`
   statements at various places within your code. If a print statement is not reached you know the
   error occurred before it in the code. Doing this iteratively allows you to home in on a problem.
   Remember to remove the print statements (unless they are generally useful) after debugging is
   complete.
 * Use [Google](https://www.google.com)! Your problem is probably not unique, so someone else may
   have come across it before and asked "the internet". Sometimes you can just cut and paste an
   error or part of an error into Google, but other times you will have to think a bit about how to
   phrase your query with some context. You will learn to hone your
   [Google-fu](https://en.wiktionary.org/wiki/Google-fu) and pose better questions.
 * Use [StackOverflow](https://stackoverflow.com/). This a dedicated question and answer site for
   coding issues and many Google queries will point you to this site. If asking questions on this
   site they should be specific and if possible include a short reproducible snippet of code that
   replicates your problem. **Do not** use StackOverflow to try and get the answer to your
   assignments. **Do not** post questions containing very large chunks of code with ambiguous
   requests like "Why does my code not work?". Be aware, StackOverflow is a community of volunteers,
   and some members are more courteous than others!

### "Rubber duck" debugging

To make sure you understand what your code is doing, compared to what it is supposed to do, it can
be useful to walk through your code section by section describing it to, e.g., a [rubber
duck](https://en.wikipedia.org/wiki/Rubber_duck_debugging) :duck:.
