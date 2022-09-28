# Importing modules

<iframe width="560" height="315" src="https://www.youtube.com/embed/Jnj4Ivbt9G8" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

A @(module) is ["*... a file containing Python definitions and
statements*"](https://docs.python.org/3/tutorial/modules.html#modules).

Python comes with a large range of [modules](https://docs.python.org/3/py-modindex.html) within the
[Python Standard Library](https://docs.python.org/3/library/) that contain many useful functions and
classes. These modules are files that are automatically bundled with, and accessible by, every
Python installation (the bundled modules can change between different Python versions).

There are also a huge range of third-party @(packages) that can be installed and then used within
Python; see, for example, the [PyPI](https://pypi.org/) package repository and the [Anaconda
Cloud](https://anaconda.org/anaconda/repo).

To use a module within a Python terminal or script you must "import" it, which means loading in either
the entire module or certain things within it.

For example, if we wanted to determine the date we could use the @(built-in) module
[`datetime`](https://docs.python.org/3/library/datetime.html#module-datetime), by importing it with
the Python [`import`](https://docs.python.org/3/reference/simple_stmts.html#import) @(keyword)
statement:

```python
import datetime
print(datatime.date.today())
2020-06-10
```

Once imported, the module @(variables), @(functions) and @(classes) exist within the module's
@(namespace): the "namespace" is, generally, a way to try and keep names used within a program
unique (i.e., if another module was imported that also had a `date` class it would still be separate
from that in `datetime`).

In the example above, to use the `date` class that exists within the `datetime` module we have had
to write `datatime.date`, where in this case the module name `datetime` becomes the "namespace" within which we used the `date` class.

You don't need to keep the namespace, e.g., we could just import the `date` class from `datetime`
using the `from` @(keyword):

```python
from datetime import date
print(date.today())
2020-06-10
```

But, this runs more risk of clashing names.

As the module definition states, you can import from any Python file,
where a Python file is one saved with the "`.py`" @(file extension),
e.g., `myfunctions.py` (it's best to have file names that are
representative of the contents). If we had a file called `message.py`
with the following content:

```python
def message_in_box(a):
    """
    Print a message in a box.

    Parameters
    ----------
    a: str
        The message to print.
    """

    messagelen = len(a)
    output = "{}\n# {} #\n{}"
    print(output.format((4 + messagelen) * "#", a, (4 + messagelen) * "#"))
```

then we could use this in another Python file, or in a Python terminal session, with:

```python
import message

message.message_in_box("Hello world!")
################
# Hello world! #
################
```

When importing you can use an alias for commonly used module namespaces or functions/classes. This
can be for convenience or to avoid clashes. There are two common aliases that you might see in codes
on the internet:

```python
import numpy as np
from matplotlib import pyplot as plt
```

In the first instance this means that the `numpy` namespace is aliased to `np` and in the second the
`pyplot` submodule of `matplotlib` is aliased to `plt`, e.g.,

```python
import numpy as np
x = np.sin(3.2)

# rather than
import numpy
x = numpy.sin(3.2)
```

!!! warning
    You can define a variable whose name is the namespace of an imported module. However, you then
    will not be able to use the imported module as it has been redefined as a new variable, e.g.,:

    ```python
    import numpy as np

    # define a variable with the name np!
    np = 2

    # try and use the numpy sin function
    x = np.sin(1.2)
    AttributeError: 'int' object has no attribute 'sin'
    ```

    In this case `np` is now an integer rather than an alias to the `numpy` module.
