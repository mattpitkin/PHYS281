# Demonstration video overview

This directory will contain a set of screen captured practical demonstrations of
various aspects of Python programming. At the moment this is just an area to write
down ideas for each demonstration. Scripts/slides for accompanying each demonstration
will also be provided.

## Demonstrations

### Installing Anaconda & VS Code on various systems

Provide a demonstration of installing Anaconda and VS Code on Windows, Mac and Linux
(maybe Miniconda for Linux).

Also provide a quick demonstration of creating new environments in Anaconda.

### Using a terminal

Provide a demonstration of navigating a file system using a terminal including the
terminal within VS Code.

### Basic Python usage from a terminal

Show differences between Python and IPython terminals (recommend using IPython).
Show how to navigate a file system within IPython. Show basic use of Python as
a calculator, show print function.

IPython tips lip tab completion and history.

### Importing modules and namespaces

Demonstrate importing modules. Later on we will show how functions can be imported
from scripts in a similar manner.

### Basic Python built-in types

Show basic duck typing for int, floats, strings, lists, tuples, dicts.
Show that these are object, i.e. they have methods (e.g., str.upper(), list.append()).

### Scripts

Describe what is meant be a script - a short self-contained bit of code to generally do one thing.

Show how to write a script and run a script (from VS Code, from command line, from within IPython).
Show how running script within IPython means that any variables within it can be used.

Describe adding comments.

Code etiquette - useful naming conventions for variables, functions and files, commenting
code, sensible spacing, sensible line lengths.

### Functions

Describe how to define and use functions in Python, including indentation.
Discuss function arguments including positional arguments and keyword arguments.
Describe returning things from functions and how to return and capture multiple
values. (Note the difference between printing something to screen and returning a value)

Show a docstring for a function.

### Flow control

Describe for loops (including the range and enumerate built-in functions),
while loops, if...elif...else statements.

Some basics on iterators.

### Objects and classes

Describe how everything in Python is an object. A thing that can contain both data and
functions (known as methods) that can act on that data.

A class is a template that defines a particular object. So to define a new type of
object you have to write its class.

You then use the class to create an instance of an object of the type defined by
that class.

Describe the __init__ method and some other dunder methods. Describe self.
Describe class attributes.

Describe classmethods (methods that return an instance of the class) and
staticmethods (methods that can be used without creating a new instance of the class,
but do not have access the class attributes).

### File IO

Show basics of file IO. The open function for reading a writing a plain text file.

### NumPy and SciPy

Show some of the basic of NumPy, mainly focusing the use of NumPy arrays.

Some random number generation. Some basic fitting. Show basic IO with NumPy (maybe mention pandas).

### Plotting with Matplotlib

Show how to create basic plots of data with Matploltib. Regular plots with different
line styles and marker styles, adding axes labels and legends. Adding multiple data
sets to plots. Simple histogramming.

Saving plots to different formats. Label font sizes, plot size...

### Parsing command line arguments

Show how to use argparser module to pass command line arguments to a script.

### Unit testing

Describe testing code with simple unit tests.

### Exception handling

Maybe describe how to throw and catch errors

### Accessing help

Help of function in terminal and using Google!
