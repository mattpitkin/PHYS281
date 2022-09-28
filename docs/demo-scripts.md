# Python scripts

<iframe width="560" height="315" src="https://www.youtube.com/embed/FWgddKdrBI0" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

A Python @(script) is a file that generally contains a short self-contained set of instructions,
i.e., lines of code, that perform a specific task. They are called scripts because they are read and
interpreted by Python line-by-line in order from the first line to the last.

!!! tip
    In reality scripts can be any length and do multiple things, but this is not recommended. If a
    script file is getting too long it can often be broken into several shorter files, with the
    required bits imported into a main script (see the tutorial on [importing
    modules](../demo-importing-modules/index.html)).

A Python script file usually has the `.py` suffix @(file
extension). File names can be anything that your operating system
allows, but it is recommended that they be short and descriptive of
what the script is designed to do. It is also good practice to not
have blank spaces in file names.

## Example script

An example script might be a file called `tell_time.py` that contains:

```python
"""
A script to show the user the current time.

Author: Matthew Pitkin
Email: m.pitkin@lancaster.ac.uk
Date: 22/06/2020
"""

# import the required modules
import datetime


def gettime():
    """
    A function to return the current time.

    Returns
    -------
    tuple:
        A tuple containing the hour, minutes and seconds.
    """

    now = datetime.datetime.now()

    return now.hour, now.minute, now.second + 1e-6 * now.microsecond

# get the time
hour, minute, seconds = gettime()

print("The current time is {}:{}:{}".format(hour, minute, seconds))
```

### Script structure

The above script's structure is as follows:

1. comment block (see [below](#commenting-code)), held within opening and closing `"""`, describing
   the script;
2. importing of required modules (see the tutorial on [importing
   modules](../demo-importing-modules/index.html));
3. defining any functions (see the tutorial on [functions](../demo-functions/index.html));
4. performing any required tasks (in this case getting the time);
5. outputting any required information (in this case printing the time to the screen).

This is a useful basis in which to order your code. In reality modules can be imported, and
functions defined, anywhere within a code, so long as it is before they are used (remember scripts
are interpreted from start to finish, so you must define something before you use it).

### Commenting code

In most programming languages you can place comments in your code. These are useful ways of
including notes and information to describe what your code is doing and why.

!!! important
    Comments are important! They allow other people (and future you!) to understand a code more
    easily rather than trying to have to interpret it themselves. Use comments liberally throughout
    your code.

In Python there are two ways to specify if a line contains a comment rather than code that you want
to run (both of which are shown in the above [example](#example-script)):

1. Start a line with a hash `#`.
2. Place text between opening and closing lines containing three quotation marks `"""` or three
   apostrophes `'''` (you can also define a @(string) @(variable) using this syntax).

Any comment lines will be ignored by the Python interpreter when the file is run.

## Running a script

The above [example](#example) script can be run in a @(terminal) using:

```bash
python tell_time.py
```

If you write a script in _VS Code_ you do not need to open a terminal to run it. You can hit the
green play button :fontawesome-solid-play: in the top right corner and it will automatically open a
terminal and run the script for you.

!!! note
    If you are using Linux or Mac you can start your scripts with the line:

    ```python
    #!/usr/bin/env python
    ```

    This is known as a ["shebang"](https://en.wikipedia.org/wiki/Shebang_(Unix)) and if you make
    your script executable, e.g., with `chmod u+x tell_time.py` you can then just run it in the
    terminal with `./tell_time.py`, rather than having to type `python tell_time.py`.

## Using functions from another script

As described in the [Importing Modules](../demo-importing-modules/index.html) demonstration, any
file with the `.py` extension is also a Python module. This means that you can import @(variables),
@(functions) or @(classes) defined in one script into another.

For small projects with multiple scripts it is useful to keep them in the same directory so that you
can import between them as needed. (The more advanced topic of
"[packaging](https://github.com/mattpitkin/lancstro)" your project is beyond the scope of this
course, although is a very useful thing to learn.)

For example, I could create a new script in the same directory as `tell_time.py` called
`sydney_time.py` that contains:

```python
"""
A script to tell me the current time in Sydney, Australia.

Author: Matthew Pitkin
Email: m.pitkin@lancaster.ac.uk
Date: 22/06/2020
"""

# import gettime function from tell_time script/module
from tell_time import gettime

# use gettime function from tell_time
hour, minute, seconds = gettime()

# get the time in Sydney
sydneyhour = (hour + 9) % 24

print("The current time in Sydney is {}:{}:{}".format(sydneyhour, minute, seconds))
```

!!! important
    If you import a whole script as a Python module, e.g., use

    ```python
    import tell_time
    ```

    in the above example, then that script will get run during the import. So in that `tell_time`
    case the time will also get printed. This is sometimes what you want to achieve, but you may
    just want to import the script so that you can use specified functions, classes or variables.
    To make sure that parts of the script are _not_ run on import you could instead write
    `tell_time.py` as:

    ```python hl_lines="28"
    """
    A script to show the user the current time.

    Author: Matthew Pitkin
    Email: m.pitkin@lancaster.ac.uk
    Date: 22/06/2020
    """

    # import the required modules
    import datetime


    def gettime():
        """
        A function to return the current time.

        Returns
        -------
        tuple:
            A tuple containing the hour, minutes and seconds.
        """

        now = datetime.datetime.now()

        return now.hour, now.minute, now.second + 1e-6 * now.microsecond

    # anything within this if statement will not get run on import
    if __name__ == "__main__":
        # get the time
        hour, minute, seconds = gettime()

        print("The current time is {}:{}:{}".format(hour, minute, seconds))
    ```

    Anything within the if statement `if __name__ == "__main__":` will only get run when running
    the script directly, but will not get run if importing the script as a module.

## Inputs

A script can contain all the information that is required to run it (values that are defined within
a script are sometimes referred to as being "hard-coded"). But often your script might require
information from the user to provide it with data or tell it how it should run.

There are various ways that you can provide inputs to your script, which we will briefly mention below.

### Requesting input

You can make a script request user input from the keyboard by using the @(built-in)
[`input`](../demo-built-in-functions/index.html#input) function. `input` can take in a string as an
@(argument), for example, a request for certain input to be provided, and then will take in whatever
is written on the keyboard until the user presses ++enter++. This will then be assigned to a
variable as a @(string), e.g., after using:

```python
name = input("Enter your name: ")
```

the `name` variable will contain whatever was entered. As the returned variable is always a string
you may have to convert it if, for example, you want a number, e.g., convert an age to an integer
number:

```python
age = int(input("Enter your age: "))
```

### Inputs from a file

A common and sensible way to take inputs is to read in data from a file. For more information on
this see the tutorial on [reading files](../demo-io/index.html). 

### Command line arguments

When you run a script from the @(command line), i.e., by typing in the script name, you can pass it
additional values (called command line arguments), that can then be used within the code, by writing
them on the command line following the script's name. One way of using any additional command line
arguments within your script is to use the [`sys`](https://docs.python.org/3/library/sys.html)
standard module, in particular [`sys.argv`](https://docs.python.org/3/library/sys.html#sys.argv),
which will list of all command line arguments as @(strings) (including the script name as the first
value in the list). As a very simple demonstration, if we had a script containing just:

```python
# import the sys module
import sys

print(sys.argv)
```

and called it, say, `test.py`, then running it with some additional arguments gives:

```bash
python test.py 1 Hello 5.6
['test.py', '1', 'Hello', '5.6']
```

If we know the order that any command line arguments our code requires are going to be given, then
we can extract the appropriate value from its position in the `argv` list and use it as required.
For example, if we had the following script:

```python
import sys

# assume first name is the first command line argument (after the script name)
firstname = sys.argv[1]

# assume surname is the second command line argument
surname = sys.argv[2]

print("Your name is {} {}".format(firstname, surname))
```

it assumes that there must be two arguments and that the user knows that the first one should be the
first name and the second one should be the surname. If the user were to run (assuming this was in a
script called `printname.py`):

```bash
python printname.py Joe Bloggs
Your name is Joe Bloggs
```

then all is well. But, if there user ran:

```bash
python printname.py Bloggs Joe
```

or

```bash
python printname.py Joe
```

things would not work as expected.

Sometimes we might not want to have to give all the command line values, or we might not want to
worry about having them in the correct order. The standard Python module
[`argparse`](https://docs.python.org/3.8/howto/argparse.html#id1) can instead be used to provide
more control over the command line inputs, for example, allowing named flags to specify inputs
required. We will not go into detail of `argparse` here, except to show a very basic example (which
we will assume is saved as a script called `person.py`):

```python
import argparse

# create the parser (defining what command line arguments are expected)
parser = argparse.ArgumentParser()

# add an argument called "name", which will require a --name flag followed by the input to be used 
parser.add_argument("--name", help="Enter your name")
parser.add_argument("--age", help="Enter your age", type=int)  # convert to integer
parser.add_argument("--occupation", help="Enter your occupation", default=None)  # default to None if not provided

# parse the command line arguments
args = parser.parse_args()

# use the arguments
print("{} is {} years old".format(args.name, args.age))
if args.occupation is not None:
    print("{} is a {}".format(args.name, args.occupation))
```

By default, when using `argparse`, if you give the script the `--help` argument it will print out
the required arguments to screen given the information you provided to `help=` above: 

```bash
python person.py --help
usage: person.py [-h] [--name NAME] [--age AGE] [--occupation OCCUPATION]

optional arguments:
  -h, --help            show this help message and exit
  --name NAME           Enter your name
  --age AGE             Enter your age
  --occupation OCCUPATION
                        Enter your occupation
```

If we give it some inputs we get:

```
python person.py --age 40 --name Matthew --occupation lecturer
Matthew is 40 years old
Matthew is a lecturer
```

Here, we see that by using these flags, it doesn't matter what order we enter the command line
arguments.

## Outputs

The simplest way for a Python script to output some information is to print that information to the
screen for the user to see.

For this the @(built-in) [`print`](../demo-built-in-functions/index.html#print) function can be
used. This function takes a @(string) and outputs it to the screen:

```python
print("Hello")
Hello
```

This is useful for simple bits of information, but if your script is dealing with larger amounts of
information then it is more useful to output it to a file (see the tutorial on [outputting to
file](../demo-io/index.html)), or to generate a plot (see the tutorial on
[plotting](../demo-matplotlib/index.html)).
