---
title: NumPy basics
authors:
    - Matthew Pitkin
date: 2020-08-14
---

# NumPy

<iframe width="560" height="315" src="https://www.youtube.com/embed/FIckY_FMpc8" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

[NumPy](https://numpy.org/) is a Python library containing many useful features for numerical and
scientific computation. It is not a @(built-in) module, but is available in the default Anaconda `base`
environment.

NumPy can be imported using:

```python
import numpy
```

You will often find that the NumPy @(namespace) is aliased as:

```python
import numpy as np
```

In this tutorial we will use this `np` namespace.

This tutorial will not go into the details of the vast majority of functionality in NumPy, but much
more information can be found through NumPy's [official
documentation](https://numpy.org/doc/stable/). We will mainly focus on NumPy's array class, which is
useful for holding multi-dimensional numerical arrays.

## NumPy arrays

The basic class for NumPy arrays is the
[`ndarray`](https://numpy.org/doc/stable/reference/generated/numpy.ndarray.html) class. They can
hold arrays of any Python object, but are most generally used to hold arrays of numbers.

NumPy `ndarray`s have a variety of useful @(data attributes) and @(methods), a few of which will be
mentioned below.

### Creating an array

Rather than using the `ndarray` class definition for creating new instances of NumPy arrays, the
standard way is to use the
[`array`](https://numpy.org/doc/stable/reference/generated/numpy.array.html) function. To create a
numerical array you can pass the `array` function a list of values:

```python
x = np.array([1, 2, 3])
print(type(x))
print(x)
print(x.dtype)
<class 'numpy.ndarray'>
[1 2 3]
int64
```

Above, we passed `array` a list of values and created a NumPy `ndarray` holding those values. The
`array` function will automatically try and identify the number's type and as we passed a list of
integers it has set the array's `dtype` attribute to `int64` (which stands for a 64 bit integer). If
_any_ of the numbers were a `float` the type for all numbers would be a float:

```python
x = np.array([1.0, 2, 3])
print(x.dtype)
float64
```

It is often useful to be explicit about the type of number that you want to store, and generally
make sure they are floats if you are going to perform further mathematical operations on the array:

```python
x = np.array([1, 2, 3], dtype=float)  # explicitly type the values to be floats
print(x.dtype)
float64
```

!!! warning
    If you have an integer array and use the `+=` operator to add another non-integer array to it,
    it will raise an error:

    ```python
    x = np.array([1, 2, 3])
    y = np.array([3.5, 4.5, 6.5])
    x += y
    ---------------------------------------------------------------------------
    TypeError                                 Traceback (most recent call last)
    <ipython-input-23-3fa90755daf3> in <module>
    ----> 1 x += y

    TypeError: Cannot cast ufunc add output from dtype('float64') to dtype('int64') with casting rule 'same_kind'
    ```

`ndarray`s have a `shape` attribute that returns a tuple containing the dimensions of the array and
the size of each dimension:

```
x = np.array([1, 2, 3])
print(x.shape)
print("Number of dimension: {}".format(len(x.shape)))
print("Length of array: {}".format(x.shape[0]))
(3,)
Number of dimension: 1
Length of array: 3
```

Like a regular [`list`](../demo-compound-data-types/index.html#lists), values within an array can be
accessed using indexing, where the index starts at zero:

```python
print(x[0])  # first value in the array
1
print(x[1])  # second value in the array
2
```

You can also change the contents of an array by setting the values using their index, e.g.,

```python
x[2] = 100
print(x)
[  1   2 100]
```

As with a [`list`](../demo-compound-data-types/index.html#lists), multiple values can be returned,
or assigned, using a [slice](../demo-compound-data-types/index.html#slices) (the `:`):

```python
x = np.array([0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100])
print(x[2:4])  # get values from indexes 2 and 3
[20 30]
print(x[4::2])  # get values from index 4 to the end in steps of 2
[ 40  60  80 100]
x[0:3] = [20, 19, 18]  # re-assign the first three values
print(x)
[ 20,  19,  18,  30,  40,  50,  60,  70,  80,  90, 100]
```

You can assign returned parts of an array to a new variable:

```python
y = x[4::2]
print(y)
[ 40  60  80 100]
```

Again, similarly to a [`list`](../demo-compound-data-types/index.html#copying-lists), if you assign
a new variable name to an existing lists it just "points" to the existing list rather than making a
copy, e.g.,:

```
x = np.array([1, 2, 3])
y = x  # assign a variable y to point to x
y[0] = 100  # change something in y
print(x)  # see the change in x
[100   2   3]
```

The same is true of returned slices of parts of a list. If you assigned the return slice from a list
as a new variable it just "points" back to the memory in the original array, so if you alter the new
array the original one will be altered too:

```python
x = np.array([0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100])
y = x[4::2]
print(y)
[ 40  60  80 100]
y[0] = 1000  # change the first index of y
print(y)
[1000   60   80  100]
print(x)  # see the change effects x
[   0   10   20   30 1000   50   60   70   80   90  100]
```

#### Copying arrays

If you want a new array that contains the same contents as another one, but is not just a pointer,
you must copy the array. The simplest way to do this is to create a new array from the old one:

```python
x = np.array([1, 2, 3])
y = np.array(x)  # make a new array that contains a copy of x
print(y)
[1 2 3]
y[0] = 100  # change y
print(y)
[100   2   3]
print(x)  # show x in unaffected by the change to y
[1 2 3]
```

There are a couple of equivalent ways to do this using the
[`copy`](https://numpy.org/doc/stable/reference/generated/numpy.ndarray.copy.html#numpy.ndarray.copy)
method of a `ndarray` or the NumPy
[`copy`](https://numpy.org/doc/stable/reference/generated/numpy.copy.html#numpy.copy) function:

```python
y = x.copy()  # another way to copy
y = np.copy(x)  # yet another way to copy!
```

#### Pre-initialised arrays

You can create arrays initialised with all elements containing zero, using the
[`zeros`](https://numpy.org/doc/stable/reference/generated/numpy.zeros.html#numpy.zeros) function:

```python
x = np.zeros(10)  # an array of 10 zeros
print(x)
[0. 0. 0. 0. 0. 0. 0. 0. 0. 0.]
```

Or, containing all ones (using the
[`ones`](https://numpy.org/doc/stable/reference/generated/numpy.ones.html#numpy.ones) function):

```python
x = np.ones(10)  # an array of 10 ones
print(x)
[1. 1. 1. 1. 1. 1. 1. 1. 1. 1.]

x = 2.3964 * np.ones(3)  # an array of 3 values of 2.3964
print(x)
[2.3964 2.3964 2.3964]

# or equivalently
x = np.full(3, 2.3964)
```

#### Complex arrays

Arrays can contain [complex numbers](../demo-compound-data-types/index.html#complex-numbers), e.g.,:

```python
x = np.array([2 + 3j, 9 + 5j, -5 - 6j])
```

The real and imaginary components of the array can be accessed separately using the `real` and
 `imag` array attributes (there are equivalent
 [`real`](https://numpy.org/doc/stable/reference/generated/numpy.real.html#numpy.real) and
 [`imag`](https://numpy.org/doc/stable/reference/generated/numpy.imag.html#numpy.imag) functions
 that can also be used):

```python
print(x.real)
[ 2.  9. -5.]
print(x.imag)
[ 3.  5. -6.]
```

#### Useful methods

Some other useful methods of an `ndarray` are:

 * [`sum`](https://numpy.org/doc/stable/reference/generated/numpy.ndarray.sum.html#numpy.ndarray.sum):
   return the sum of all the values in the array
 * [`prod`](https://numpy.org/doc/stable/reference/generated/numpy.ndarray.prod.html#numpy.ndarray.prod):
   return the product of all the values in the array
 * [`mean`](https://numpy.org/doc/stable/reference/generated/numpy.ndarray.mean.html#numpy.ndarray.mean):
   return the mean of the values in the array
 * [`std`](https://numpy.org/doc/stable/reference/generated/numpy.ndarray.std.html#numpy.ndarray.std):
   return the standard deviation of the values in the array
 * [`max`](https://numpy.org/doc/stable/reference/generated/numpy.ndarray.max.html#numpy.ndarray.max):
   return the maximum value in the array
 * [`argmax`](https://numpy.org/doc/stable/reference/generated/numpy.ndarray.argmax.html#numpy.ndarray.argmax):
   return the index of the maximum value in the array
 * [`min`](https://numpy.org/doc/stable/reference/generated/numpy.ndarray.min.html#numpy.ndarray.min):
   return the minimum value in the array
 * [`argmin`](https://numpy.org/doc/stable/reference/generated/numpy.ndarray.argmin.html#numpy.ndarray.argmin):
   return the index of the minimum value in the array
 * [`tolist`](https://numpy.org/doc/stable/reference/generated/numpy.ndarray.tolist.html#numpy.ndarray.tolist):
   return the contents of the array as a Python `list`

```python
x = np.array([1.0, 2.0, 3.0, 4.0])

# sum the array
print(x.sum())  # these are methods so the brackets are required
10.0

# get the product
print(x.prod())
24.0

# get the mean
print(x.mean())
2.5

# get the standard deviation
print(x.std())
1.118033988749895

# get the maximum value
print(x.max())
4.0

# get the index of the maximum value
print(x.argmax())
3

# get the minimum value
print(x.min())
1.0

# get the index of the minimum value
print(x.argmin())
0

# return the array as a list
y = x.tolist()
print(y)
[1.0, 2.0, 3.0, 4.0]
print(type(y))
<class 'list'>
```

There are many other [methods](https://numpy.org/doc/stable/reference/generated/numpy.ndarray.html)
not covered here. The majority of these methods have equivalent NumPy functions that can be used
instead, and some take in arguments, which have not been covered here (i.e., they can work
differently for arrays with more than one dimension).

### Multidimensional arrays

Arrays can have any number of dimensions. You can create multi-dimensional arrays from
[multi-dimensional lists](../demo-compound-data-types/index.html#lists-of-lists) (in the examples
here we will stick to 2D objects), e.g.,:

```python
x = np.array([[1, 2, 3], [4, 5, 6]])  # a 2x3 2D array
print(x.shape)
(2, 3)
print(x)
(2, 3)
[[1 2 3]
 [4 5 6]]
```

Values can be accessed either in a list-like indexing manner:

```python
print(x[0][2])  # get the value from the 1st row and 3rd column
3
```

or using a comma to separate the indices of the rows and columns, e.g.,:

```python
print(x[0, 2])  # get the value from the 1st row and 3rd column
3
```

@(Slices) can also be used, e.g.,:

```python
print(x[1, :])  # get all values from the 2nd row
[4 5 6]
```

!!! tip "Reminder"
    Slices are a way of accessing multiple index values using the colon `:` notation, e.g., `start:stop`
    or `start:stop:step`, where `start` is the index of the first value to return, `stop` is the index
    _one after_ that of last value to return, and `step` is the integer step between indices of the
    returned value. If `start` is not supplied, it defaults to 0, i.e., the start of the array, if
    `stop` is not defined it defaults to the last value in the array, and if `step` is not supplied
    it defaults to 1.

    The [`slice`](https://www.w3schools.com/python/ref_func_slice.asp) built-in function can also
    be used to generate a slice.

You can get the [transpose](https://en.wikipedia.org/wiki/Transpose) of an array using the
[`T`](https://numpy.org/doc/stable/reference/generated/numpy.ndarray.T.html#numpy.ndarray.T)
attribute, e.g.,:

```python
y = x.T
print(y.shape)
(3, 2)
print(y)
[[1 4]
 [2 5]
 [3 6]]
```

The [`zeros`](https://numpy.org/doc/stable/reference/generated/numpy.zeros.html#numpy.zeros) and
[`ones`](https://numpy.org/doc/stable/reference/generated/numpy.ones.html#numpy.ones) functions
can also return multi-dimensional arrays initialised to contain 0 or 1, by specifying the shape of
the required array as a tuple, e.g.,:

```python
x = np.zeros((4, 5))  # a 4x5 2D array of zeros
print(x)
[[0. 0. 0. 0. 0.]
 [0. 0. 0. 0. 0.]
 [0. 0. 0. 0. 0.]
 [0. 0. 0. 0. 0.]]
```

### Joining arrays

Unlike a `list`, a NumPy `ndarray` does not have an `append` method to add new values to it. There
are instead a variety of ways to add new values.

You can insert values into an indexed position in an array using the
[`insert`](https://numpy.org/doc/stable/reference/generated/numpy.insert.html#numpy.insert) function.

```python
x = np.array([0, 1, 2, 3])
y = np.insert(x, 0, -1)  # insert the value -1 into the 0th index of the array
print(y)
[-1  0  1  2  3]
```

This does not alter the original array, but instead returns a new copy containing the inserted
value.

You can concatenate two arrays (of the same shape) using the
[`concatenate`](https://numpy.org/doc/stable/reference/generated/numpy.concatenate.html#numpy.concatenate)
function:

```python
x = np.array([1, 2, 3])
y = np.array([4, 5, 6])
z = np.concatenate((x, y))  # pass the arrays for concatenation via a tuple
print(z)
[1 2 3 4 5 6]
```

There are also the
[`hstack`](https://numpy.org/doc/stable/reference/generated/numpy.hstack.html#numpy.hstack) and
[`vstack`](https://numpy.org/doc/stable/reference/generated/numpy.vstack.html#numpy.vstack)
functions that are similar to `concatenate`.

### Mathematical operations on an array

NumPy `ndarray`s are [overloaded](../demo-classes/index.html#operator-overloading) so that the
standard mathematical @(operators) can be applied to them.

```python
# adding two arrays
x = np.array([5.5, 9.6, 12.2])
y = np.array([4.5, 0.4, -2.2])
z = x + y
print(z)
[10. 10. 10.]

# add a number to all values in an array
z = x + 2
print(z)
[ 7.5 11.6 14.2]

# add y to x in-place (i.e., x gets changed)
x += y
print(x)
[10. 10. 10.]

# subtract two arrays
z = x - y
[ 5.5  9.6 12.2]

# multiply two arrays (multiplication of each component individually,
# sometimes called the Hadamard product)
z = x * y
print(z)

# multiply all numbers in an array by a value
z = x * 2
print(z)
[20. 20. 20.]

# divide two arrays
z = x / y
print(z)
[ 2.22222222 25.         -4.54545455]

# raise an array to a power
z = x ** 2
print(z)
[100. 100. 100.]
```

#### Linear algebra

1D arrays can be thought of as vectors, and NumPy can be used to compute vector
[dot](https://en.wikipedia.org/wiki/Dot_product) and
[cross](https://en.wikipedia.org/wiki/Cross_product) products:

```python
x = np.array([1, 0, 0])
y = np.array([0, 1, 0])
print(np.dot(x, y))  # vectors are orthogonal
0
z = np.cross(x, y)
print(z)
[0, 0, 1]
```

!!! note
    The [`dot`](https://numpy.org/doc/stable/reference/generated/numpy.dot.html#numpy.dot) function
    can be used for arrays of any number of dimensions, but if you have 1D arrays (e.g., vectors)
    then the [`vdot`](https://numpy.org/doc/stable/reference/generated/numpy.vdot.html#numpy.vdot)
    function can be used instead (if you supply higher dimensional arrays to `vdot` they will get
    "flattened" into 1D arrays). `vdot` is faster than `dot` when used on vectors:

    ```python
    %timeit np.dot(x, y)
    818 ns ± 39 ns per loop (mean ± std. dev. of 7 runs, 1000000 loops each)
    %timeit np.vdot(x, y)
    613 ns ± 6.89 ns per loop (mean ± std. dev. of 7 runs, 1000000 loops each)
    ```

    If the first vector supplied to `vdot` is complex valued then its complex conjugate is
    automatically used when calculating the dot product. This is not the case for `dot`
    (see also, yet another similar function
    [`inner`](https://numpy.org/doc/stable/reference/generated/numpy.inner.html#numpy.inner)!):

    ```python
    x = np.array([3 + 4j, 8 - 1j, 9 + 2j])
    y = np.array([10.0, 9.0, 8.0])
    print(np.dot(x, y))
    (174+47j)
    print(np.vdot(x, y))
    (174-47j)
    print(np.dot(np.conj(x), y))  # explicitly perform complex conjugation to replicate vdot
    (174-47j)
    ```

The norm or magnitude of a vector can be calculated using the
[`norm`](https://numpy.org/doc/stable/reference/generated/numpy.linalg.norm.html) function in the
NumPy linear algebra submodule
[`linalg`](https://numpy.org/doc/stable/reference/routines.linalg.html):

```python
print(np.linalg.norm(z))
1.0
```

For square 2D arrays, you can get the [diagonal](https://en.wikipedia.org/wiki/Main_diagonal)
elements with the
[`diag`](https://numpy.org/doc/stable/reference/generated/numpy.diag.html#numpy.diag) function:

```python
x = np.array([[1.0, 2.0], [3.0, 4.0]])
print(np.diag(x))
[1. 4.]
```

The [inverse of the array](https://en.wikipedia.org/wiki/Invertible_matrix) and its
[determinant](https://en.wikipedia.org/wiki/Determinant) can be found using the
[`inv`](https://numpy.org/doc/stable/reference/generated/numpy.linalg.inv.html#numpy.linalg.inv) and
[`det`](https://numpy.org/doc/stable/reference/generated/numpy.linalg.det.html#numpy.linalg.det)
methods in the
[`linalg`](https://numpy.org/doc/stable/reference/routines.linalg.html#module-numpy.linalg)
submodule, e.g.,:

```python
# get the inverse
print(np.linalg.inv(x))
[[-2.   1. ]
 [ 1.5 -0.5]]

# get the determinant
print(np.linalg.det(x))
-2.0000000000000004
```

[Matrix multiplication](https://en.wikipedia.org/wiki/Matrix_multiplication) can be performed using
the [`matmul`](https://numpy.org/doc/stable/reference/generated/numpy.matmul.html#numpy.matmul)
function, e.g.,:

```python
x = np.array([[1.0, 2.0], [3.0, 4.0]])
y = np.array([[4.5, 5.5], [-9.2, 6.4]])

z = np.matmul(x, y)
print(z)
[[-13.9  18.3]
 [-23.3  42.1]]
```

!!! note
    There is actually an operator `@` that can be used for matrix multiplication:

    ```python
    z = x @ y
    [[-13.9  18.3]
     [-23.3  42.1]]
    ```

Matrix-vector products can be performed using the `dot` function, e.g., for performing a 90 degree
anti-clockwise [rotation](https://en.wikipedia.org/wiki/Rotation_matrix):

```python
R = np.array([[0, -1], [1, 0]])
x = np.array([0.5, 0.5])
y = np.dot(R, x)
print(y)
[-0.5  0.5]
```

For more advanced usage there are also the
[`tensordot`](https://numpy.org/doc/stable/reference/generated/numpy.tensordot.html#numpy.tensordot)
function and the powerful (but tricky)
[`einsum`](https://numpy.org/doc/stable/reference/generated/numpy.einsum.html#numpy.einsum)
function.

### Range-like arrays

The built-in Python [`range`](https://docs.python.org/3/library/functions.html#func-range) function
can return a list of integers, but it is often useful to have a 1D array of non-integer uniformly
spaced values. There are a couple of different ways to do this using NumPy: the
[`linspace`](https://numpy.org/doc/stable/reference/generated/numpy.linspace.html) and
[`arange`](https://numpy.org/doc/stable/reference/generated/numpy.arange.html#numpy.arange)
functions.

`linspace` takes in an initial value and a final value, and the number of points within that range
(inclusive of the start and end values) at which to generate evenly spaced values:

```python
start = 0.1
stop = 1.2
num = 12
values = np.linspace(start, stop, num)
print(len(values))
12
print(values)
[0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.  1.1 1.2]
```

With `arange`, instead of supplying the number of steps you supply the step size, so equivalently we
could have done:

```python
start = 0.1
stop = 1.2
step = 0.1
values = np.arange(start, stop, step)
print(values)
[0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.  1.1]
```

!!! note
    `arange` is not inclusive of the final value, so if you want to include a value at your
    intended final values you could instead use:

    ```python
    values = np.arange(start, stop + step, step)
    print(values)
    [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.  1.1 1.2]
    ```

If you just give `arange` an integer start value, and optionally a stop value, it will work just
like `range` (i.e., using a default step size of 1), but will return a NumPy array rather than a
list.

## NumPy maths

NumPy has its own [functions](https://numpy.org/doc/stable/reference/routines.math.html) for many
mathematical functions. Ones that are commonly used are the trigonometric functions, exponentiation
and logarithm. Many of these are equivalent to, and can be used in place of, the functions in the
built-in `math` library. The main differences is that these functions work on arrays (or regular
lists), so all values in the array can have the function applied to them. NumPy also contains some
[constants](https://numpy.org/doc/stable/reference/constants.html), such as &pi;, accessed with
[`np.pi`](https://numpy.org/doc/stable/reference/constants.html#numpy.pi).

Some examples are:

```python
x = np.arange(0, 2 * np.pi, np.pi / 2)  # values at 0, pi/2, pi and 3pi/2 rads
print(np.sin(x))  # Sine of values
[ 0.0000000e+00  1.0000000e+00  1.2246468e-16 -1.0000000e+00]

print(np.cos(x))  # Cosine of values
[ 1.0000000e+00  6.1232340e-17 -1.0000000e+00 -1.8369702e-16]

print(np.exp([1., 2., 3.]))  # e to the power of values
[ 2.71828183  7.3890561  20.08553692]

print(np.log([10, 100, 1000]))  # natural logarithm
[2.30258509 4.60517019 6.90775528]

print(np.log10([10, 100, 1000]))  # base-10 logarithm
[1. 2. 3.]
```

## NumPy random number generation

NumPy can be used to generate random numbers using functions within the
[`random`](https://numpy.org/doc/stable/reference/random/index.html) submodule. These can be useful
for [Monte Carlo simulations](https://en.wikipedia.org/wiki/Monte_Carlo_method).

Random numbers drawn by a computer using software are only
[pseudo-random](https://en.wikipedia.org/wiki/Pseudorandom_number_generator), i.e., they use a seed
as a starting point and they have a period (eventually they will return the same number, although in
most practical applications this will never happen). By default the seed will be set using something
like the computer's clock time, but it can be set (or reset) manually, for example if you explicitly
wanted repeatable "random" draws, using the
[`seed`](https://numpy.org/devdocs/reference/random/generated/numpy.random.seed.html) function,
which takes an integer value:

```python
from numpy.random import default_rng

rng = default_rng(98263954)
print(rng.uniform())  # a random number between 0 and 1
0.22816342984233473
print(rng.uniform())
0.33584602757208415

# reset the seed
rng = default_rng(98263954)
print(rng.uniform())  # a random number between 0 and 1
0.22816342984233473
```

!!! warning
    Only set the seed if you want really want identical and repeatable random numbers. If doing
    simulations that rely on the random aspect being independent over multiple runs then it is best
    to not set a seed.

There are many [probability
distributions](https://numpy.org/doc/stable/reference/random/legacy.html#distributions) from which
random numbers can be drawn, but below are a few common examples.

### Uniform distribution

Numbers can be drawn randomly from a
[uniform](https://en.wikipedia.org/wiki/Uniform_distribution_(continuous)) distribution within a
given interval, using the
[`uniform`](https://numpy.org/doc/stable/reference/random/generated/numpy.random.Generator.uniform.html#numpy.random.Generator.uniform)
function. This takes the lower and upper range of the interval and the shape of array to return (by
default a single draw is returned):

```python
from numpy.random import default_rng

rng = default_rng()  # use default seed

# draw a single random number between 0 and 5
x = rng.uniform(0, 5)
print(x)
4.853972144648509

# draw an array of 5 random numbers between 3.5 and 6.7
x = rng.uniform(3.5, 6.7, 5)
print(x)
[4.87159694 5.39695169 5.0000419  5.25914921 4.49457314]

# draw a 2x2 array of random numbers between -1 and 1
x = rng.uniform(-1, 1, (2, 2))
print(x)
[[ 0.68813313 -0.97703578]
 [ 0.25991054 -0.09875825]]
```

### Normal distribution

Numbers can be drawn from a [Normal](https://en.wikipedia.org/wiki/Normal_distribution) (or
Gaussian) distribution using the
[`normal`](https://numpy.org/doc/stable/reference/random/generated/numpy.random.Generator.normal.html#numpy.random.Generator.normal)
function, which takes the mean (the `loc` parameter, defaulting to 0), the standard deviation (the
`scale` parameter, defaulting to 1) and the shape of the array to return:

```python
from numpy.random import default_rng

rng = default_rng()

# draw a single Normally distributed random number from a distribution with a
# mean of 2 and standard deviation of 1
x = rng.normal(2, 1)
print(x)                                                     
1.5730723103489876

# draw an array of 100 random numbers between with a mean of 0 and standard
# deviation of 2
x = rng.normal(0.0, 1.0, 100)
print(x.mean())
print(x.std())
0.13988286116368978
1.0674409970150702
```

### Random integers

Random integers between an upper and lower bound can be generated using the
[`integers`](https://numpy.org/doc/stable/reference/random/generated/numpy.random.Generator.integers.html#numpy.random.Generator.integers)
function:

```python
from numpy.random import default_rng

rng = default_rng()

# generate 10 random integer values between 1 and 7 (excluding 7), i.e., dice rolls
dicerolls = rng.integers(1, 7, 10)
print(dicerolls)
[5, 1, 4, 0, 4, 0, 3, 0, 4, 2]

# generate some more
dicerolls = rng.integers(1, 7, 10000)
print("Fraction of 1's rolled: {}".format((dicerolls == 1).sum() / len(dicerols)))
Fraction of 1's rolled: 0.1712

# similar is the choice function
coinflips = rng.choice(["head", "tail"], 10)
print(coinflips)
['head' 'tail' 'tail' 'head' 'head' 'tail' 'head' 'head' 'head' 'tail']
```

## Saving and loading data

Saving and loading data using [NumPy](https://numpy.org/doc/stable/reference/routines.io.html) is
discussed in the ["Reading and writing data"](../demo-io/index.html#numpy) tutorial.
