---
title: Python classes
authors:
    - Matthew Pitkin
date: 2020-08-12
---

# Classes

Almost everything in Python is an object. All objects (e.g., named variables, functions) have a
type. An object's type is also known as its
[**class**](https://docs.python.org/3/tutorial/classes.html). A class can also be thought of as a
template for creating an object of that type.

Objects can combine holding data with functionality. Anything that you can access in an object is
known as an **attribute**. Attributes can either be **data attributes** (sometime also known as
class properties or members) or **function attributes** (also known as **class methods**).

A new object class can be defined using the
[`class`](https://www.w3schools.com/python/ref_keyword_class.asp) keyword.

## A simple class

A simple class containing just data attributes can be created using:

```python
class Particle:
    # indents are required to define thing within a class
    name = "electron"
    charge = -1.6e-19  # electric charge in coulombs
    mass = 9.1e-31  # mass in kg
```

An instance of this class can then be created with:

```python
electron = Particle()  # note the brackets are required
```

The data attributes of the object can be accessed using a `.`, e.g.:

```python
print(electron.mass)
9.1e-31
```

For an instance of the class these data attributes can be altered:

```python
electron.mass = 2
print(electron.mass)
2
```

## A class with initialisation

The above class has been created with a fixed set values of the data attributes. Every time an
instance of the class is created the attributes will be the same.

It is often useful to be able to create an instance of a class with a set of user defined values
rather than fixed values. Python classes can have a special method called `__init__` that defines
how the class is initialised and can take in user supplied arguments. In OOP languages like `C++`
the `__init__` method is equivalent to what is called a constructor.

```python
class Particle:
    def __init__(self, name, charge, mass)
        # the initialisation function
        self.name = name
        self.charge = charge
        self.mass = mass
```

Now, creating an instance of a `Particle` class different particles can be created by supplying
their values, e.g.:

```python
electron = Particle("electron", -1.6e-19, 9.1e-31)
proton = Particle("proton", 1.6e-19, 1.7e-27)

for part in [electon, proton]:
    print("{} mass = {}".format(part.name, part.mass))
electron mass = 9.1e-31
proton mass = 1.7e-27
```

The `__init__` method of a class can can have positional and/or keyword arguments, just like any
other function. Using keyword arguments allows the setting of default initialisation values if no
user supplied values are given, e.g.,

```python
class Particle:
    def __init__(self, name="electron", charge=-1.6e-19, mass=9.1e-31):
        # if no values are supplied the default values will be used
        self.name = name
        self.charge = charge
        self.mass = mass

myparticle = Particle()
print(myparticle.name)
electron
```

### `self`

The `__init__` method, and any other regular method defined in a class, takes `self` as its first
argument. But when creating the new object above nothing was passed for `self` (i.e., the brackets
were empty)! When **defining** a class method the method has to have the class instance explicitly
passed to it. This allows that method to access all the class attributes of the current class
instance via `self`. But, when using a method `self` is passed implicitly, i.e., the user does not
have to supply it as it is supplied automatically.

### Special methods

There are a set of [special method names](https://rszalski.github.io/magicmethods/) (sometimes
called "dunder", or magic, methods as they start and end with a double underscore) like `__init__`
that can be defined in a class. These can be used

 * to allow comparisons of objects of specific class
 * define how mathematical operators work on a class
 * access attributes within a class
 * provide representations of class

One particular special method is
[`__str__`](https://thomas-cokelaer.info/blog/2017/12/difference-between-__repr__-and-__str__-in-python/).
This defines how to displayed a class instance as a string, for example if trying to print the
object, e.g.:

```python
class Particle:
    def __init__(self, name="electron", charge=-1.6e-19, mass=9.1e-31):
        # if no values are supplied the default values will be used
        self.name = name
        self.charge = charge
        self.mass = mass

    def __str__(self):
        # a string representing the object
        vowel = self.name[0].lower() in ["a", "e", "i", "o", "u"]
        firstword = "An" if vowel else "A"

        return "{} {} with mass of {} kg and charge of {} C".format(
            firstword, self.name, self.mass, self.charge
        )

myparticle = Particle(name="positron", charge=1.6e-19)
print(myparticle)
A positron with mass of 9.1e-31 kg and charge of 1.6e-19 C
```

A similar method that can be used instead is `__repr__`.

### Adding methods

Methods are defined just like standard functions, but within the class definition. The first
argument that they take must be `self`, so that all other class attributes are available using it.

```python
class Particle:
    def __init__(self, name, charge, mass, spin=None):
        # the initialisation function
        self.name = name
        self.charge = charge
        self.mass = mass
        self.spin = spin

    def fermion_or_boson(self):
        """
        Determine if the particle is a fermion or a boson.
        """

        if self.spin is not None:
            if self.spin % 0.5 == 0.0:
                return "fermion"
            elif self.spin % 1.0 == 0.0:
                return "boson"
            else:
                print("Particle is neither a fermion or a boson")
                return None
        else:
            return None
```

Like the data attributes this can then be accessed using a `.`, e.g.:

```python
electron = Particle("electron", -1.6e-19, 9.1e-31, spin=1/2)
print(electron.fermion_or_boson())  # note the brackets when accessing the method
fermion
```

The `fermion_or_boson` method does not take in any arguments (other than the impicit `self`). A
method that could be added to the particle is one that calculates the [Lorentz
force](https://en.wikipedia.org/wiki/Lorentz_force) on the particle in an electric and magnetic
field:

```python
class Particle:
    def __init__(self, name, charge, mass, spin=None):
        # the initialisation function
        self.name = name
        self.charge = charge
        self.mass = mass
        self.spin = spin

    def fermion_or_boson(self):
        """
        Determine if the particle is a fermion or a boson.
        """

        if self.spin is not None:
            if self.spin % 0.5 == 0.0:
                return "fermion"
            elif self.spin % 1.0 == 0.0:
                return "boson"
            else:
                print("Particle is neither a fermion or a boson")
                return None
        else:
            return None

    def lorentz_force(self, E, B=[0.0, 0.0, 0.0], v=[0.0, 0.0, 0.0]):
        """
        Calculate the Lorentz force on the particle.

        Parameters
        ----------
        E: array
            A vector giving the x, y and z components of the electric field
            (required).
        B: array
            A vector giving the x, y and z components of the magnetic field
            (defaults to zero).
        v: array
            A vector giving the x, y and z components of the particle's
            velocity (defaults to zero)
        """

        if len(E) != 3:
            # check E is the right length
            raise ValueError("E is not the right length")

        F = 3 * [0.0]  # initialise F as zeros
        
        # calculate F = q * (E + v x B)
        F[0] = self.charge * (E[0] + v[1] * B[2] - v[2] * B[1])
        F[1] = self.charge * (E[1] + v[2] * B[0] - v[0] * B[2])
        F[2] = self.charge * (E[2] + v[0] * B[1] - v[1] * B[0])

        return F


myparticle = Particle()

# calculate the Lorentz force
F = Particle.lorentz_force()

```

The `lorentz_force` method above takes one positional argument and two keyword arguments (that give
default values). Any number of positional or keyword arguments could be used.

The `lorentz_force` method could be simplified using Numpy (see [#demo-numpy]).

## Static methods

Static methods are functions within a class that can be used without creating a new instance of that
class. As they do not use an instance of the class they do not have access to any of the other class
attributes, i.e., they are standalone and must be supplied with all the variables they required.

Unlike normal methods they do not get passes the `self` argument. The make a method static you use
the [`@staticmethod`](https://docs.python.org/3/library/functions.html#staticmethod)
[decorator](https://docs.python.org/3/glossary.html#term-decorator) on the line above the method
definition, e.g.:

## `classmethod`

A `classmethod`

## Class inheritance