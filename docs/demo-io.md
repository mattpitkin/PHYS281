---
title: Reading and writing data
authors:
    - Matthew Pitkin
date: 2020-09-24
---

# Reading and writing data

<iframe width="560" height="315" src="https://www.youtube.com/embed/Q3gy1pNZQls" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

A code might require input data and it might also create data for outputting. Therefore it is useful
to be able to read and write data from and to a file. This is often referred to as I/O, standing for
"Input/Output".

Files can either contain plain [ASCII text](https://en.wikipedia.org/wiki/ASCII), i.e., text that is
readable if the file is opened with a standard text editor, or information that is in a binary
format (generally this is not readable by standard editor unless the format is known).

Plain text files are useful in that they are human readable, although for the same amount of
information they will generally be larger in size (i.e., memory taken up on disc) than an equivalent
binary file.

!!! note
    When reading and writing it is useful to know your directory structure and be explicit about
    where you want to save to/read from. This means giving the full path, including directories
    (and drive letter on Windows), of the file. For example, you might refer to files with:

    ```python
    filename = "C:/My Documents/myfile.txt"
    ```

    to make sure you are using the file on the C-drive, in the `"My Documents"` folder, and with
    the name `myfile.txt`. Note that the slashes are in the opposite direction (forward slashes) to
    the way they are normally shown in Windows. Equivalently you could use backslashes as:

    ```python
    filename = "C:\\My Documents\\myfile.txt"
    # or
    filename = r"C:\My Documents\myfile.txt"
    ```

    which both stop Python interpreting backslashes (`\`) in a string as an @(escape character)
    for the following letter (e.g., `\n` in a string means new line).

    Another option is to use the [`pathlib`](https://docs.python.org/3/library/pathlib.html)
    built-in module to construct `Path` objects that can be used instead of strings, e.g.,:

    ```
    from pathlib import Path
    filename = Path("/My Documents/myfile.txt")
    ```

    On Windows, using `pathlib` will often work with or without the drive supplied if the file is
    locally stored.

    It is useful to save to filenames that do not contain spaces.

## Basic reading and writing to file (ASCII text only)

The built-in Python function [`open`](https://docs.python.org/3/library/functions.html#open)
provides a way to open files and make them ready for reading their content or writing to them.

When using `open` it requires the name of the file to open and the "mode", i.e., whether to open the
file for reading (mode `"r"`), writing (mode `"w"`), or appending (mode `"a"`). It returns a [file
object](https://docs.python.org/3/glossary.html#term-file-object).

### Reading

Suppose you have a plain text file called `mydata.txt` in your current directory containing some
numerical data (this will be used in further examples):

```
--8<-- "docs/mydata.txt"
```

The first line starts with a `#` and is a comment line a giving the "names" of the columns. The two
columns can be read into two lists using the following code:

```python
fp = open("mydata.txt", "r")  # open mydata.txt for "r"eading
x = []  # empty list to contain x data
y = []  # empty list to contain y data
for line in fp.readlines():  # loop through each line in the data
    if line[0] == "#":
       # skip lines that start with a "#"
       continue
    data = line.split()  # split the line on any whitespace
    x.append(float(data[0]))  # convert string into float
    y.append(float(data[1]))

fp.close()  # close the file

print(x)
print(y)
[1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]
[9.8, 10.3, 12.4, 13.2, 14.7, 16.1, 17.2, 18.7, 20.1, 21.3]
```

In the above code,
[`readlines`](https://www.w3schools.com/python/ref_file_readlines.asp)
is a method of the file object. It goes through the file and returns a
list, where each entry is a string containing a line from the file.
One can avoid reading in the entire file at once by simply using `for
line in fp:`; this saves time and memory when files are very large.

When reading data in this way you must know what the data file looks like, i.e., you need to know
that comment lines start with a `#` and that it contains two columns of numbers.

!!! note
    Here, the file object variable has been named `fp`. I have used this as a hangover from writing
    `C` code where it is often used to mean "file pointer". Any variable name can be given to the
    file object.

The `open` function can be used as a [context
manager](https://www.geeksforgeeks.org/context-manager-in-python/). This is basically just a way of
making sure the resource, in this case the open file, is closed after use. Above, the file was
explicitly closed using the `close` method, `fp.close()`, but you do not need to close the file if
instead you use the
[`with`](https://docs.python.org/3/reference/compound_stmts.html#the-with-statement) statement:

```python
x = []  # empty list to contain x data
y = []  # empty list to contain y data
with open("mydata.txt", "r") as fp:
    # indent within the with statement
    for line in fp:  # loop through each line in the data
        if line[0] == "#":
            # skip lines that start with a "#"
            continue
        data = line.split()  # split the line on any whitespace
        x.append(float(data[0]))  # convert string into float
        y.append(float(data[1]))

# exited the with statement, but don't need to close fp
```

Reading binary data can be done by opening the file with the `"rb"` mode instead of `"r"` and
reading the entire contents using the [`read`](https://www.w3schools.com/python/ref_file_read.asp)
method of the file object. However, converting the read-in data to something that is usable within
Python is trickier as you have to know exactly the layout and memory size for the data stored within
the file. We will not cover this here.

### Writing

To write to a plain text file you again have to open a file, but this time with the mode set to
write, `"w"`. Once the file is open you can then use the
[`write`](https://www.w3schools.com/python/ref_file_write.asp) method of the file object to add data
to the file. You can only write out string data, so any numbers must be converted to strings.

```python
# create some data
datax = range(10, 21)
datay = [2.3 - 4.5 * x + 5.4 * x ** 2 for x in datax]

filename = "newfile.txt"

fp = open(filename, "w")
for i in range(len(datax)):  # loop over the data
    fp.write("{} {}\n".format(datax[i], datay[i]))

fp.close()  # close the file
```

After this program is run, the contents of file `newfile.txt` will look like:

```
10 497.3
11 606.2
12 725.9
13 856.4
14 997.7
15 1149.8
16 1312.7
17 1486.4
18 1670.9
19 1866.2
20 2072.3
```

In the output format string `"{} {}\n".format(datax[i], datay[i])` it separates the two numbers by a
single space and ends with the newline character `\n`. If the `\n` is not added the numbers would
all be written out on the same line. Values can be separated by multiple spaces, or tabs by using
the tab character `\t`.

!!! warning
    If you open a file for writing that already exists it will overwrite the existing file and its
    contents will be gone. If you want to make sure that the file does not exist before writing
    you can do something like:

    ```python
    import os  # import the built-in os module

    filename = "newfile.txt"  # name of file to write to
    if os.path.isfile(filename):
        print("Warning: you are trying to write to an existing file.")
    else:
        fp = open(filename, "w")
        ...
    ```

Instead of the `write` method, the built-in
[`print`](https://www.w3schools.com/python/ref_func_print.asp) function can also be used to write to
a file. The above code could be replicated with:

```python
filename = "newfile.txt"

fp = open(filename, "w")
for i in range(len(datax)):  # loop over the data
    print(datax[i], datay[i], file=fp)

fp.close()  # close the file
```

When using print it automatically converts `datax[i]` and `datay[i]` to their string
representations, automatically adds a space separating them (the separator can be altered using the
`sep` keyword argument), and automatically adds a newline character.

#### Appending

Instead of writing to an entirely new file you can append data to an existing file. To do this you
would open the file with the append mode `"a"`. If the file does not already exist a new file will
be created. If the file does exist anything you write to it will be added to the end.

### Using `pathlib`

The built-in [`pathlib`](https://docs.python.org/3/library/pathlib.html) module provides a useful
[`Path`](https://docs.python.org/3/library/pathlib.html#pathlib.Path) object for defining file or
directory paths, rather than using strings.

The [`Path`](https://docs.python.org/3/library/pathlib.html#pathlib.Path) object has methods for
[reading](https://docs.python.org/3/library/pathlib.html#pathlib.Path.read_text) and
[writing](https://docs.python.org/3/library/pathlib.html#pathlib.Path.write_text) from and to text
files. For example, to read the `mydata.txt` file defined [above](#reading) you could do:

```python
from pathlib import Path

p = Path("mydata.txt")

# read all the contents of the file
contents = p.read_text()
```

This would read in all the file contents to a string variable, so it would still have to be parsed
in some way, e.g.:

```python
x = []
y = []
for line in contents.split("\n"):  # loop through each line in the data
    if line[0] == "#":
        # skip lines that start with a "#"
        continue
    data = line.split()  # split the line on any whitespace
    x.append(float(data[0]))  # convert string into float
    y.append(float(data[1]))
```

A `Path` object can also just be passed to the `open` function, or other IO-functions such as those
in [NumPy](#numpy), as if it were a string, e.g.,

```python
from pathlib import Path

p = Path("myfile.txt")
with open(p, "w") as fp:
    ...
```

## Pickling

If your data is purely numerical then writing to a plain text file is a simple way to store it.
However, you may want to save Python **objects** instead. There is a built-in Python module called
[`pickle`](https://docs.python.org/3/library/pickle.html) that allows (most) objects to be saved in
a binary file.

If you define a simple class like:

```python
class MyData:
    def __init__(self, x, y, name):
        self.x = x
        self.y = y
        self.name = name

    def __str__(self):
        return "MyData: '{}'\n x: {}\n y: {}".format(self.name, self.x, self.y)
```

and then create and instance of that class:

```python
x = [0.7, 0.8, 0.9, 1.0, 1.1]
y = [-10, -9, -8, -7, -6]
mydata = MyData(x, y, "Lab1")
```

it can be saved in a pickle file using the
[`dump`](https://docs.python.org/3/library/pickle.html#pickle.dump) method:

```python
import pickle

filename = "mydata.pkl"
fp = open(filename, "wb")  # open writing to binary file
pickle.dump(mydata, fp)
fp.close()
```

This data can then be read back in using the
[`load`](https://docs.python.org/3/library/pickle.html#pickle.load) function, e.g.,

```python
# read in the MyData object
filename = "mydata.pkl"
fp = open(filename, "rb")  # open reading from binary file
data = pickle.load(fp)
print(data)
MyData: 'Lab1'
 x: [0.7, 0.8, 0.9, 1.0, 1.1]
 y: [-10, -9, -8, -7, -6]
```

!!! note
    To load in a pickled object, the objects class must be available, i.e., defined in the script
    that you are importing into, or in an importable module, so that it can be reconstructed.

## JSON

A plain text file format that allows you to save additional meta data is
[JSON](https://www.json.org/json-en.html). A JSON file has the format of a dictionary object, so
data (numbers, lists, string, or even further dictionaries) stored in a dictionary can be output as
a JSON file. Dictionaries have keys and values; therefore the keys can provide information (meta
data) about the data that is stored.

The data can be written to a text file using the
[`dump`](https://docs.python.org/3/library/json.html#json.dump) function from the built-in
[`json`](https://docs.python.org/3/library/json.html) Python module:

```python
import json  # import json module

# create dictionary to store data
data = {}
data["x values"] = [0.7, 0.8, 0.9, 1.0, 1.1]
data["y values"] = [-10, -9, -8, -7, -6]
data["name"] = "Lab1"

# open file for writing
filename = "mydata.txt"
fp = open(filename, "w")

# write json file
json.dump(data, fp, indent=2)  # "indent=2" indents each line by 2 spaces

fp.close()
```

The output file is human readable and in this case contains:

```json
{
  "x values": [
    0.7,
    0.8,
    0.9,
    1.0,
    1.1
  ],
  "y values": [
    -10,
    -9,
    -8,
    -7,
    -6
  ],
  "name": "Lab1"
}
```

A JSON file can be read back in using the
[`load`](https://docs.python.org/3/library/json.html#json.load) function, e.g.,:

```python
import json

# open file for reading
filename = "mydata.txt"
with open(filename, "r") as fp:
    data = json.load(fp)
print(data)
{'x values': [0.7, 0.8, 0.9, 1.0, 1.1], 'y values': [-10, -9, -8, -7, -6], 'name': 'Lab1'}
```

## NumPy

[NumPy](../demo-numpy/index.html) can be used to both save and read plain text data, or pickle
objects in binary files.

### Reading and writing text files

Considering our original `mydata.txt` file, this could be read in as a NumPy `ndarray` using the
[`loadtxt`](https://numpy.org/doc/stable/reference/generated/numpy.loadtxt.html) function, e.g.,:

```python
import numpy as np

filename = "mydata.txt"
data = np.loadtxt(filename, comments="#")
print(data)
[[ 1.   9.8]
 [ 2.  10.3]
 [ 3.  12.4]
 [ 4.  13.2]
 [ 5.  14.7]
 [ 6.  16.1]
 [ 7.  17.2]
 [ 8.  18.7]
 [ 9.  20.1]
 [10.  21.3]]
```

Rather than taking a file object, `loadtxt` can just be passed the file name. Lines starting with a
particular character, in this case `#`, can be ignored using the `comments` keyword argument.

If the data file contained columns with values separated by commas (often called [comma separated
value](https://en.wikipedia.org/wiki/Comma-separated_values), or CSV, files), then the `delimiter`
keyword argument could be used, e.g., `data = np.loadtxt(filename, comments="#", delimiter=",")`.

More control, including converting particular columns to certain data types is available, with the
finest grain of control found using the
[`genfromtxt`](https://numpy.org/doc/stable/reference/generated/numpy.genfromtxt.html#numpy.genfromtxt)
function.

1D and 2D NumPy arrays can be saved to text files using the
[`savetxt`](https://numpy.org/doc/stable/reference/generated/numpy.savetxt.html) function, e.g.,:

```python
import numpy as np

# data to save
data = np.array([[0.1, 10.0], [0.2, 11.0], [0.3, 12.0], [0.4, 13.0]])

filename = "mydata.txt"
np.savetxt(filename, data)
```

The output format (i.e., the number of decimal places on float numbers) can be set using the `fmt`
keyword argument, e.g., `np.savetxt(filename, data, fmt="%.5f")` would output floats with 5 decimal
places. The delimiter between the output values can be set (by default a space), and header and
footer text, preceded by a comment character, can also be set.

### Binary files

NumPy arrays can be saved as binary files containing pickled data using the
[`save`](https://numpy.org/doc/stable/reference/generated/numpy.save.html#numpy.save) function and
then read back in using the
[`load`](https://numpy.org/doc/stable/reference/generated/numpy.load.html#numpy.load) function,
e.g.,:

```python
import numpy as np

# our data
data = np.array([[0.1, 10.0], [0.2, 11.0], [0.3, 12.0], [0.4, 13.0]])

# save the data
filename = "mydata.npy"  # npy is the standard file extension name
np.save(filename, data)

# read in the data
newdata = np.load(filename)
print(newdata)
[[ 0.1 10. ]
 [ 0.2 11. ]
 [ 0.3 12. ]
 [ 0.4 13. ]]
```

By default, the [`save`](https://numpy.org/doc/stable/reference/generated/numpy.save.html#numpy.save)
function assumes you are saving a NumPy array object. However, you can get it to save other Python
objects by explicitly telling it to allow pickling. For example, if you had a simple class like:

```python
class DataPoint:
    def __init__(self, x, y, z):
        # store copies of x, y and z in the class
        self.x = x
        self.y = y
        self.z = z
```

and generated a list containing many `DataPoint` objects:

```python
import numpy as np

mydata = [DataPoint(x, y, np.sqrt(x ** 2 + y ** 2)) for x, y in np.random.rand(10, 2)]
```

then to save this you would use:

```python
filename = "mydata.npy"
np.save(filename, mydata, allow_pickle=True)
```

If you were to then read this data in:

```python
readdata = np.load(filename, allow_pickle=True)
```

then `readdata` will contain the original `DataPoint` objects.

!!! note
   The [`load`](https://numpy.org/doc/stable/reference/generated/numpy.load.html#numpy.load)
   function will always load the data as a NumPy array object. So, in the example above, while
   `mydata` was a list, `readdata` will instead be a NumPy array, although it will still contain
   the `DataPoint` objects.

### Pandas

While not covered in this tutorial, [Pandas](https://pandas.pydata.org/) is an advanced Python
module primarily for holding data tables. It has methods for reading and writing to a variety of
file formats including plain text, CSV and Excel spreadsheets.
