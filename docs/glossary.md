Here is a glossary of commonly used terms within these notes. For a more complete glossary see the
set provided in the Python documentation [here](https://docs.python.org/3/glossary.html) (any
descriptions in quotation marks are lifted directly from that page).

## `%`

The percent sign is used for [modular arithmetic](https://en.wikipedia.org/wiki/Modular_arithmetic),
i.e., it returns the integer remainder after division of one number by another. E.g., `10 % 3` gives
`1`.

## `*`

The multiplication [operator](#operator), i.e., used for getting the product of two values/objects.
An asterisk is used rather than the standard cross.

## `**`

The exponentiation [operator](#operator), i.e., used for raising a value to the power of an
exponent. E.g., in `x = 2 ** 5` the value of 2 is raised to the power of 5. Integer or floating
point numbers can be used for both the base and exponent.

## `+`

The addition [operator](#operator), i.e., used for getting the sum of two values/objects.

## `-`

The subtraction [operator](#operator), i.e., used for getting the difference between two
values/objects.

## `/`

The division [operator](#operator), i.e., used for getting the quotient of two values/objects.

## `@`

The "at" symbol has two uses. It can be used as an operator to perform [matrix
multiplication](https://en.wikipedia.org/wiki/Matrix_multiplication). Alternatively, it is used when
defining a [decorator](#decorator) function wrapping another function.

## Alias

An alternative, and generally shorter, way of referring to a [namespace](#namespace). When importing
a @(module), the module's namespace can be aliased using the `as` keyword, e.g., in `import numpy as
np` the `numpy` namespace has been aliased to `np`, which can then be used within the code in place
of `numpy`. 

## Argument

An argument is a variable or value that is passed to a function, so that it can be used within the
function.

## Attribute

An attribute is ["*A value associated with an object which is referenced by name using dotted
expressions. For example, if an object `o` has an attribute `a` it would be referenced as
`o.a`*"](https://docs.python.org/3/glossary.html#term-attribute). Attributes can be variables within
a class ([data attributes](#data-attribute)) or methods.

## Boolean

A data type that can take one of two possible values, "True" or "False", which can be used when
performing [Boolean algebra](https://en.wikipedia.org/wiki/Boolean_algebra), i.e., evaluating
logical expressions. In Python, Boolean variables have the [type](#type) "`bool`".

## Built-in

Something, for example a function or module, that is defined within any Python installation and
is therefore available to use in any Python code.

## Call

Call refers to using a function. For example, if you ran `print("Hello")` you could also say that
you "called" the `print` function.

## Child

A class that inherits attributes from a [parent](#parent) class, sometimes known as a subclass.

## Class

A class is ["*A template for creating user-defined objects. Class definitions normally contain
method definitions which operate on instances of the
class.*"](https://docs.python.org/3/glossary.html#term-class)

## Class attribute

A [data attributes](#data-attribute)) of a class that is owned by the class itself, and so will
have the same value for all [instances](#class-instance) of the class.

## Class instance

A instance of a class is an object created from a class, e.g., in `x = int(1)` the variable `x` is
an instance of the [`int`](#int) class.

## Class method

A class method is [*"A function which is defined inside a class
body."*](https://docs.python.org/3/glossary.html#term-method)

## Class variable

This is a ["*variable defined in a class and intended to be modified only at class level (i.e., not
in an instance of the class).*"](https://docs.python.org/3/glossary.html#term-class-variable)

## Command line

The line in a [terminal](#terminal) into which you type a command. In a Python session, the command
line will start with the [command prompt](#command-prompt) `>>>` and contain a flashing cursor.

## Command prompt

The starting characters on the [command line](#command-line) in a [terminal](#terminal). In a Python
session, the command prompt will be `>>>` and contain a flashing cursor.

## Data attribute

This is a class [attribute](#attribute) that refers to a data variable within the class.

## Decorator

A decorator is ["*A function returning another
function*"](https://docs.python.org/3/glossary.html#term-decorator). To define a function that is
wrapped in another "decorator" function, the line before the function definition should contain
`@decoratorname`, where `decoratorname` is the name of the decorating function. 

## Directory

A named location on a disk drive which contains other files or directories. The word
[folder](#folder) and directory may be used interchangeably and in a file explorer they may be
represented with a :fontawesome-regular-folder:, :fontawesome-regular-folder-open: or similar icon.

## Escape character

In a Python string the forward slash `\` is an [escape
character](https://en.wikipedia.org/wiki/Escape_character). This means that in certain cases the
combination of the forward slash and the following character have a different meaning, e.g., `\n`
will be interpreted as starting a new line. The also allow you to insert "illegal" characters into a
string, e.g., to use a quotation mark in a string defined within quotation marks you can use `x =
"They said \"Hello\""`. Some common Python escape characters are listed
[here](https://www.w3schools.com/python/gloss_python_escape_characters.asp).

## Exception

An [exception](https://docs.python.org/3/tutorial/errors.html#exceptions) is an error detected in a
code during its execution. When exceptions are encountered the code will, generally, fail and an
error message will be printed to screen. Python has a set of standard
[exceptions](https://docs.python.org/3/library/exceptions.html) dependent on the "type" of error
encountered.

## File extension

This is the end part of a file's name, after the full stop, that defines type of file that it is.
For example, in `myscript.py` the file extension is `py` and shows this is a Python file, or in
`mydocument.docx` the file extension `docx` shows this is a Microsoft Word document.

## float

A class for defining a [floating point number](#floating-point-number). Python automatically
recognises variables set with numbers containing decimal places or exponential notation to be
floating point numbers, e.g., in `y = -9.7` the variable `y` will be a `float` type, which is
equivalent to explicitly saying `y = float(-9.7)`.

## Floating point number

A [floating point](https://en.wikipedia.org/wiki/Floating-point_arithmetic) number is any real
non-integer number. The "floating point" refers to the decimal point in the number, which can
"float", i.e., be placed anywhere between the other digits in the number.

## Folder

A synonym for a [directory](#directory), i.e., a name location on a disk drive in which other files
or folder are stored.

## Function

A function is a piece of code that can take in variable [arguments](#argument), perform some
operations, and return an output. In Python, functions are defined using the `def`
[keyword](#keyword).

## Function attribute

This is a class attribute that refers to a function (also known as a [class method](#class-method)).

## Immutable

An object that cannot be changed after it is created. The opposite is something that is
[mutable](#mutable).

## Indent

Using [whitespace](#whitespace) (a series of spaces or tabs) to place a code block away from the
left hand edge of the screen.

## Index

The location of a value within an array-like object, e.g., a list. Indices start at 0 for the
location of the first value, and end at one less than the length of the object.

## Instance attribute

A [data attributes](#data-attribute)) of a class that has a value specific for each
[instance](#class-instance) of that class, e.g., as defined by the user.

## int

A class for defining integer numbers. Python automatically recognises variables set with integer
number values to be integers, e.g., in `x = 1` the variable `x` will be an `int` type, which is
equivalent to explicitly saying `x = int(1)`.

## Iterable

An iterable is ["[a]n object capable of returning its members one at a
time."](https://docs.python.org/3/glossary.html#term-iterable), for example a list.

## Keyword

In Python there are a set of [reserved
words](https://www.w3schools.com/python/python_ref_keywords.asp) that cannot be used for variable,
function or class names as they already have a defined usage. These are keywords.

## Keyword argument

A keyword argument to a function is an [argument](#argument) defined by a keyword identifier and
value pair separated by an equals sign. The value after the equals sign provides a default value
used within the function if the keyword is not used in the function call, e.g., in `def func(x=2):`
the argument `x` is the keyword and `2` is the default value it takes. Keyword arguments can be
passed to the function in any order provided the keyword identifier is used, if not used then the
arguments must be given in the order in the function definition.

## Linting

Linting is the automatic checking of code, using an analysis tool called a
[linter](https://en.wikipedia.org/wiki/Lint_(software)), for any errors or bugs. In Python, these
might be include unclosed brackets, incompatible indents, missing colons are function definitions,
etc.

## Method

In Python, a method is how a [function](#function) within a class is referred to.

## Module

["A module is a file containing Python definitions and
statements."](https://docs.python.org/3/tutorial/modules.html#modules)

## Mutable

An object that is changeable after created. The opposite is something that is
[immutable](#immutable).

## Namespace

Most generally: ["A _namespace_ is a mapping from names to
objects"](https://docs.python.org/3/tutorial/classes.html#python-scopes-and-namespaces). However, a
common use of namespace is at the [module](#module) level and refers to using something (e.g., a
function) within a module by explicitly declaring the module's name to avoid ambiguity with other
potentially identically named objects. E.g., using the `sin` function with the `math` module: `x =
math.sin(1.0)`.

## Object

In Python, object's are the building blocks of a code; everything is an object! They can contain
data (variables) and ways of manipulating data (functions). Objects have a type which is defined
using their class. Generally, any [instance of a class](#class-instance) is an object.

## Operator

An operator generally refers to one of the mathematical [binary
operators](https://en.wikipedia.org/wiki/Binary_operation) of addition `+`, subtraction `-`,
multiplication `*`, and division `/`, used in [elementary
arithmetic](https://en.wikipedia.org/wiki/Elementary_arithmetic).

## Package

A Python module, or set of modules, that have been "packaged" together into an installable piece of
software. Once a package is installed you can import the modules from within it.

## Parent

A class who's attributes will be inherited by a new [child](#child) class. This is sometimes known as a
superclass.

## Path

The location of a file within a file system is given by its path, e.g.,
`C:\Users\username\Project\myfile.py` is the path to the file `myfile.py`. Having the path starting
from the drive letter, or root directory, is also known as the "absolute path". Paths can also be
relative to the current directory, which is known as a "relative path".

## Positional argument

A positional argument to a function is an [argument](#argument) defined by a name without the equals
sign, e.g., in `def func(a, b):` both `a` and `b` are positional arguments. When using the function
the positional arguments must be passed in the order that they are given in the function definition.
They must come before any [keyword arguments](#keyword-argument).

## PyPI

A [repository](https://pypi.org/) of shared Python packages that are installable using the Python
package installer [`pip`](https://pip.pypa.io/en/stable/).

## Script

A script is a file containing code that is generally used to perform just one job and is standalone
(i.e., it can be run on its own without having to be run by a different code). A Python script file
has the [file extension](#file-extension) `py`.

## Shell

A [program](https://en.wikipedia.org/wiki/Shell_(computing)) that provides a command line
interface with an operating system, often run within a [terminal](#terminal).

## Slice

Slices are a way of accessing multiple index values using the colon `:` notation, e.g., `start:stop`
or `start:stop:step`, where `start` is the index of the first value to return, `stop` is the index
_one after_ that of last value to return, and `step` is the integer step between indexes of returned
value. The [`slice`](https://www.w3schools.com/python/ref_func_slice.asp) built-in function can also
be used to generate a slice.

## String

In programming a string generally refers to a [variable](#variable) type that holds some text, i.e.,
a series of alphanumeric characters. In Python, strings are defined by text enclosed within
apostrophes, quotation marks, or a series of three apostrophes/quotation marks, e.g., `x = 'Hello'`,
`x = "Hello"` and `x = """Hello"""` are all equivalent ways of defining a string.

## subclass

A synonym for a [child](#child) class.

## superclass

A synonym for a [parent](#parent) class.

## Syntax

In programming languages "syntax" refers to the specific required structure, or grammar, of the
language for it to be understood by the computer.

## Syntax highlighting

This is the automatic highlighting of text within a code, via font colour, weight or italicisation,
that uses recognised syntax, formatting or keywords for a given programming language. Text editors
with syntax highlighting can often recognise the language and highlight appropriately.

## Terminal

A text-based window for running commands via a command-line prompt in a [shell](#shell). In Windows,
a common terminal program is
[PowerShell](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/powershell).

## Traceback

This is a message returned after encountering an [exception](#exception) that reports the function
calls made at the point where it encountered the error. This may be nested through several layers of
functions.

## Type

In Python, [variables](#variable) have a type, which is the *kind* of thing (e.g., an integer or a
[string](#string)) that the variable represents as defined by its [class](#class). Often "type" and
"class" will be used interchangeably.

## Variable

A variable in Python is a named object (or named class instance), e.g., in `x = 2.9` a variable
called `x` has been created that pointed to the `float` number object `2.9`. 

## Virtual environment

A virtual environment is an isolated environment used for Python projects. It can have a specific
version of Python and specific versions of various packages as required for the project. These are
isolated and independent from any versions of the packages that may be installed globally on the
computer.

## Whitespace

Spaces ++space++, tabs ++tab++ and carriage returns ++return++/new lines within a document or string
and known as [whitespace](https://en.wikipedia.org/wiki/Whitespace_character).