# The Python terminal

<iframe width="560" height="315" src="https://www.youtube.com/embed/11Xayj8lZi4" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

A @(terminal) is a text-based window into which you can type commands and view outputs. 

You can run Python as an interactive environment within a terminal. Within this you can type and run
any Python commands. The terminal is useful for quick calculations and prototyping.

There are two types of Python terminal sessions: a *regular* session and an enhanced interactive
session called [IPython](https://ipython.org/). Within a terminal window (e.g., a Powershell
terminal on Windows, or a terminal session within _VS Code_) you enter a regular Python terminal
session by typing `python` and hitting ++return++. You should see something like:

```python
Python 3.7.2 (default, Dec 29 2018, 06:19:36) 
[GCC 7.3.0] :: Anaconda, Inc. on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> 
```

where the `>>>` is the @(command prompt) starting the @(command line), i.e., the line that you input
commands onto. You can type commands in, e.g.,

```
>>> x = 1 + 4
>>> print(x)
5
```

To quit the Python session and return to the regular terminal, type `quit()` and hit ++return++.

## IPython terminal

Rather than the standard Python terminal, it is recommended to instead use the enhanced interactive
terminal, [IPython](https://ipython.org/), which offers more features for ease of use. IPython is
started by typing `ipython` (or `ipython3`) and hitting ++return++. Now you should see something like:

```ipython
Python 3.7.2 (default, Dec 29 2018, 06:19:36) 
Type 'copyright', 'credits' or 'license' for more information
IPython 7.2.0 -- An enhanced Interactive Python. Type '?' for help.

In [1]: 
```

where the @(command prompt) (`In [1]:`) looks slightly different. It is sometimes called an input
"cell".

In IPython you can do all the things of a standard Python terminal session:

```ipython
In [1]: x = 1 + 4

In [2]: print(x)
5
```

The number in square brackets `[N]` increases by one for each new prompt.

If you just do a calculation in a cell like:

```ipython
In [1]: 2 * 6
Out[1]: 12
```

you get an `Out[N]` prompt containing the answer, where the number `[N]` is the same as the
associated `In [N]` prompt that produced it. The `Out [N]` prompt actually stores the answer as a
@(variable) that can be used later, e.g.,

```ipython
In [2]: x = Out[1] - 4

In [3]: print(x)
8
```

It is _not_ recommended to store and use variables this way though!

## Python as a calculator

You can use the Python terminal as a calculator using standard arithmetic @(operators):

 * `+` : add to numbers
 * `-` : subtract two numbers
 * `*` : multiply two numbers
 * `/` : divide two numbers

```python
a = 1 + 8
print(a)
9

b = 9 - 2.4
print(b)
6.6

c = 12.1 * 3.7
print(c)
44.77

d = 3 / 4
print(d)
0.75
```

If you add, subtract or multiply two integers you will get an integer value back. For division it
will return a @(floating point number) (i.e., a non-integer number with a decimal point in it) even
if the inputs are integers. To perform division that returns an integer rounded down to the nearest
integer value use `//`, e.g.,

```python
a = 3 // 4
print(a)
0

b = 34 // 13
print(b)
2
```

!!! note
    If you are using Python 2 (which is not recommended, but you may come across some old code)
    division of two integers will return an integer based on the result rounded down to the nearest
    integer.

A couple of other useful operators are:

 * `**` : raise to the power
 * `%` : the remainder after division

```python
a = 2 ** 4
print(a)
16

b = 13 % 4
1
```

### The `math` library

For more complex mathematical operators you can use the @(built-in)
[`math`](https://docs.python.org/3/library/math.html) library. Some examples are:

```python
import math

# square root
x = math.sqrt(4)
print(x)
2.0

# trigonometry (inputs are in radians)
x = math.sin(2.3)
print(x)
0.7457052121767203

# use the constant pi from within math
y = math.cos(math.pi)
print(y)
-1.0

z = math.tan(0.0)
print(z)
0.0

# natural and base 10 logarithm
x = math.log(100.0)
print(x)
4.605170185988092

y = math.log10(100.0)
print(y)
2.0
```

## Shell commands

Within IPython you can use some standard [shell
commands](../demo-terminal/index.html#terminal-cheat-sheet), for example:

i) showing you current directory

```ipython
In [1]: pwd
Out[1]: u'/home/matthew'
```

ii) listing the contents of your current directory:

```ipython
In [2]: ls
test1.txt         test2.txt
myfiles/
```

iii) change to another directory

```ipython
In [3]: cd myfiles

In [4]: pwd
Out[4]: u'/home/matthew/myfiles'
```

!!! note
    If you change directory within IPython and then `quit()` you will be back in the original
    directory in which IPython was started.

You can access other shell commands by starting the prompt with an exclamation mark, e.g., to make a
new directory you could use:

```ipython
In [5]: !mkdir newdirectory

In [6]: ls
newdirectory/
```

## Getting help

You can access some general help in IPython with a few simple commands:

 * `?` provides an overview of IPython's features
 * `%quickref` provides a reference card of some basic usage
 * `help` shows documentation for an object (e.g., `help(int)` for documentation on an integer
   object)
 * `object?` or `object??`: adding a question mark or two after variable you have defined will give
   information about that object, e.g.,

```ipython
In [1]: x = 3

In [2]: x?
Type:        int
String form: 3
Docstring:  
int(x=0) -> int or long
int(x, base=10) -> int or long

Convert a number or string to an integer, or return 0 if no arguments
are given.  If x is floating point, the conversion truncates towards zero.
If x is outside the integer range, the function returns a long instead.

If x is not a number or if base is given, then x must be a string or
Unicode object representing an integer literal in the given base.  The
literal can be preceded by '+' or '-' and be surrounded by whitespace.
The base defaults to 10.  Valid bases are 0 and 2-36.  Base 0 means to
interpret the base from the string as an integer literal.
>>> int('0b100', base=0)
4

In [3]: x??

Type:        int
String form: 3
```

## Cell magic commands

Two useful
["magic"](https://ipython.readthedocs.io/en/stable/interactive/tutorial.html#magic-functions)
commands are: 

i) `%run`: run a Python script within the IPython terminal, e.g., if you have a file called, say
`script.py`, containing some Python code, you can run it with:

```ipython
In [1]: %run script.py
```

You can then access any variables defined within `script.py` in the IPython terminal.

ii) `%timeit`: get timing information on a function, e.g.:

```ipython
In [1]: %timeit sum(range(100000))
100 loops, best of 3: 2.08 ms per loop
```

## Efficiency tips

You can be far more efficient by using a couple of features of IPython: [command
history](https://ipython.readthedocs.io/en/stable/interactive/tutorial.html#history) and [tab
completion](https://ipython.readthedocs.io/en/stable/interactive/tutorial.html#tab-completion).
IPython saves all the commands you have previous entered in the order that you entered them. You can
scroll back and forth between old commands with the up ++up++ and down ++down++ arrow keys.

If you had previously typed a long command, you can start typing it and then press up ++up++ and it
will automatically fill in the rest.

Tab completion allows you to explore an objects @(attributes), e.g., if you define an integer `x =
1` and write

```ipython
In [1]: x = 1

In [2]: x.<TAB>
```

where `<TAB>` is replaced by hitting the tab key ++tab++, you get a scrollable list of attributes
of the object.

Or, you can use it to complete file strings. For example, if you are writing a string that is a file
name in your current directory, then start typing the string and hit tab to complete it.

## Resources

Some useful resources with information about using the IPython terminal are:

* [The IPython tutorial](https://ipython.readthedocs.io/en/stable/interactive/index.html)
* [Chapter 1 of the Python Data Science
  Handbook](https://jakevdp.github.io/PythonDataScienceHandbook/01.00-ipython-beyond-normal-python.html), which
  contains lots of useful tips on using an IPython terminal.
