---
title: Basic data types
authors:
    - Matthew Pitkin
date: 2020-08-12
---

# Basic data types

<iframe width="560" height="315" src="https://www.youtube.com/embed/-OA05dhv2y8" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

In a code you can define @(variables) and these have a @(type), where the type is the kind of
*thing* that the variable represents. For example, a variable might hold an integer number, or a set
of alphanumeric values (known as a string).

* a variable is the _name_ you give any object that you create in a code, e.g., in `x = 2` a
  variable called `x` has been defined, which can be reused later in the code.

!!! note
    Variable names must start with a letter, but can then contain numbers or underscores.
    Variable names are case sensitive, i.e., `a = 2` and `A = 2` are different
    variables. It is useful to have descriptive variable names.

Some languages have *static typing*, where you must explicitly tell the code what the variable's type
is. In the `C` language you would define a variable that holds an integer with, e.g.,

```C
int myvariable = 2;
```

Python is a ["duck typing"](https://en.wikipedia.org/wiki/Duck_typing) language - "*If it walks like
a duck and it quacks like a duck, then it must be a duck*". It will work out the type for basic data
types by what they "look" like:

```python
x = 5
type(x)
<class 'int'>
```

It has determined that the variable `x` is of the integer (or `int`) type. In this example
[`type()`](../demo-built-in-functions/index.html#type) is a @(built-in) Python function that returns
the type of a variable.

!!! note
    Everything in Python is an @(object) (hence *object oriented programming*, or OOP). In OOP
    an object is a thing that contains data in the form of variables and/or functions to act on that
    data. All variables are objects and therefore the @(type) refers to the "type" of object.
    "Type" is sometimes used interchangeably with "@(class)", where a class defines a type.

The main basic data types (in Python and many languages) are:

* `int`: represents an positive or negative integer number;
* `float`: represents a "@(floating point number)", i.e., a non-integer number;
* `str`: represents some alphanumeric text, know as a "@(string)";
* `bool`: represents a @(boolean) value, i.e., "True" or "False".

```python
# defining an integer
myInteger = 2

# defining a float (note the decimal point)
myFloat = -59.87534

# define a string
myString = "Hello"

# define a boolean
myBool = True
```

The basic data types are @(objects), and as such have @(data attributes) and @(methods):

* @(data attributes) are variables that are contained within an object;
* @(methods) are functions within an object.

Examples:

```python
x = 1
# int and float objects contain real and imag attributes
x.real
1
```

```python
y = 1.5
# floats contain an is_integer() method
y.is_integer()
False

# the float can be returned as an integer ratio
y.as_integer_ratio()
(3, 2)
```

!!! note
    Due to being held in a finite amount of computer memory, floating point numbers are not
    exact. They can show loss of precision when including many significant figures, e.g.,:

    ```python
    x = 4.1 - 1.2
    print(x)
    2.8999999999999995
    ```

    The above calculation has produced a number that is very close to, but not quite, `2.9`.
    This can mean that you have to be careful if doing comparisons with floats, as:

    ```python
    print(x == 2.9)
    False
    ```

    You might instead do:

    ```python
    print(abs((x - 2.9)/x) < 1e-15)  # difference has very small relative error
    ```

## Strings

@(Strings) can be defined in three different, but equivalent, ways:

```python
z1 = "Hello"
z2 = 'Hello'
z3 = """Hello"""  # you could also use three consecutive apostrophes
```

### String methods

Strings have a _lot_ of [methods](https://www.w3schools.com/python/python_ref_string.asp), for example:

```python
z = "Hello"
# show the string in upper case
z.upper()
'HELLO'
# replace l's with x's
z.replace("l", "x")
'Hexxo'
```

Some particularly useful methods (at least ones I use regularly!) are the
[`split`](https://docs.python.org/3/library/stdtypes.html#str.split) and
[`strip`](https://docs.python.org/3/library/stdtypes.html#str.strip) methods.

The `split` method allows you to split a string into a list of values based on a particular
separator (lists are covered in [another tutorial](../demo-compound-data-types/index.html#lists)).
By default `split` will split a string based on @(whitespace), i.e., spaces, tabs or new lines,
e.g.:

```python
name = "Matthew Pitkin"
# split this into a list containing the first name and surname
names = name.split()
print(names)
['Matthew', 'Pitkin']
```

But, you can also split based on a particular character, e.g.:

```python
# split comma separated values
x = "1,2,3,4"
vals = x.split(",")
print(vals)
['1', '2', '3', '4']
```

The `strip` method will strip-off leading or trailing values from a string. By default it will strip
off whitespace from a string. This is useful if, for example, you have a set of comma separated
values (maybe read in from a file) and they contain superfluous spaces:

```python
namelist = "Matthew, Helen, Tom, Tracy, Steve"
# split these names on commas
names = namelist.split(",")
print(names)  # they'll still contain extra space
['Matthew', ' Helen', ' Tom', ' Tracy', ' Steve']
# so instead:
names = [name.strip() for name in namelist.split(",")]
['Matthew', 'Helen', 'Tom', 'Tracy', 'Steve']
```

In the above example it has used list comprehension, which is covered in [another
tutorial](../demo-flow-control/index.html#list-comprehension).

### String concatenation

To join strings together you can just use the addition operator `+`, e.g.,

```python
x = "Hello"
y = " "  # a space
z = "World!"
phrase = x + y + z
print(phrase)
Hello World!
```

### String formatting

The basic Python types have a representation of themselves in a string format. So, for example, if
you define an integer and print it you will see:

```python
x = 34
print(x)
34
```

You can place an object's string representation into another string using the
[`format()`](https://www.w3schools.com/python/ref_string_format.asp) method. For example:

```python
x = 12
y = 14
z = x + y
print("The sum of {} + {} = {}".format(x, y, z))
The sum of 12 + 14 = 26
```

The `format()` method replaces the curly brackets with the string representations for `x`, `y` and
`z`.

You can have even more control about how numbers are displayed, for example:

```python
x = 12.9627459845
y = 13.9875284843
z = x + y
print("The sum of {0:.2f} + {1:.2f} = {2:.2f}".format(x, y, z))
The sum of 12.96 + 13.99 = 26.95
```

In this case the `0` represents the first argument to `format`, which is followed by the formatting
type `:.2f` that means "show a floating point number (`f`) to two decimal places (`.2`)."

In Python versions greater than 3.5 there is another way to use string formatting. If you define a
string with an `f` (known as an [f-string](https://www.python.org/dev/peps/pep-0498/)) before the
opening quotes you can use variable names within curly brackets to show their values, e.g.:

```python
firstname = "Matthew"
age = 21

mystring = f"My name is {firstname} and my age is {age}."
print(mystring)
My name is Matthew and my age is 21.
```

!!! note
    There are multiple equivalent ways of getting variables into strings. There are another couple
    of options (at least). The first of these is to use an older Python 2 style syntax:

    ```python
    mystring = "My name is %s and my age is %d." % (firstname, age)
    ```

    where the "`%s`" is a placeholder for inserting a string and the "`%d`" is a placeholder for
    inserting an integer (`%f` would be used for a float, or `%e` is you wanted it in scientific
    notation, with the whole range of values that can be used given
    [here](https://docs.python.org/2/library/stdtypes.html#string-formatting)). After the string a
    `%` character is used followed by a tuple containing the variables to insert given in the order
    they are to be inserted.

    Another option is to just concatenate multiple strings together, e.g.,

    ```python
    mystring = "My name is " + firstname + " and my age is " + str(age)
    ```

    where it should be noted that we have had to use `str` to convert the integer valued `age`
    variable into a string. 

    We recommend using the `format` method of string formatting, although it's more important to
    pick one method and be consistent throughout your code.

### Unicode, escape characters and "raw" strings

In Python 3 strings are by default [unicode](https://home.unicode.org/) strings. This means that in
addition to the standard Roman alphabet keyboard characters, they can include characters like:
accented letters, non-Roman alphabet characters, and various emoji symbols:

```python
sentence = "Dr Müller likes 𝜋 🙂"
```

In fact, you can even have variable names that use (some) unicode characters:

```python
𝜋 = 3.14
print(𝜋)
3.14
```

Strings are defined using quotation marks or apostrophes, so what if you want to use a quotation
mark or apostrophe within a string?

If you have a string that you define using quotation marks then you can use apostrophes within it,
and vice versa:

```python
a = "It was Matthew's birthday"
b = '"Be quiet!", said the lecturer.'
```

However, another way is to use the "[escape
character](https://www.w3schools.com/python/gloss_python_escape_characters.asp)" `\`. For example
using a `\"` in a string that is defined with quotation marks means that you want to display a
quotation mark:

```python
a = "\"Thank you.\", said the lecturer."
print(a)
"Thank you.", said the lecturer.
```

The escape character followed by certain letters can be used to add additional formatting within a
string. You can add tabs or new lines within a string with the "`\t`" and "`\n`" characters:

```python
listings = "1.\tApples\n2.\tPears\n3.\tOranges\n"
print(listings)
1.	Apples
2.	Pears
3.	Oranges
```

If you want to show a `\` itself within a string you need to use `\\`. This is particularly
important for file paths within Windows, which use `\` as the separator:

```python
# rather than, where the \t will get changed to a tab
path = "C:\Users\mydirectory\textfile.txt"
# use
path = "C:\\Users\\mydirectory\\myfile.txt"
```

#### Raw strings

If you want to ignore escaped characters you can make a string use "raw" text. To do this you add an
`r` before the opening quotation mark/apostrophe. For example to actually include "`\n`" in a
string, rather than have it interpreted as a new line, you would write:

```python
rawstring = r"Ignore the \n escape characters"
print(rawstring)
Ignore the \n escape characters
```

The above Windows file path could instead be written as a raw string to avoid needing the double
`\`'s:

```python
path = r"C:\Users\mydirectory\textfile.txt"
```

## Booleans

A boolean value just represents True or False, so can only take two values:

```python
x = True
y = False
```

`True` and `False` must have an uppercase first letter to be recognised by Python. Booleans are
generally used for comparison in logical expressions, which are covered in [another
tutorial](../demo-flow-control/index.html#conditional-expressions). For example, evaluating an
equality will return a boolean value:

```python
x = 2

testequality = (x == 2)  # == test if two values/objects are the same

print(type(testequality))
<class 'bool'>
print(testequality)
True
```
