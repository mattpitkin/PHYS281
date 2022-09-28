---
title: Compound data types
authors:
    - Matthew Pitkin
date: 2020-08-12
---

# Compound data types

<iframe width="560" height="315" src="https://www.youtube.com/embed/jh54qY16Ddw" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

In addition to the [basic data types](../demo-data-types/index.html) for integers (`int`),
@(floating point numbers) (`float`) and @(strings) of text (`str`), there are some other standard
Python data types that can hold multiple pieces of data.

## Lists

Lists can hold an array of any other Python object. Lists are defined using square brackets `[]` or
the `list` class name.

```python
# a list containing some integers
x = [1, 2, 3]

print(type(x))
<class 'list'>
```

You can access items in a list @(variable) using their @(index) placed within square brackets
`[idx]`. The index is an integer giving an item's location within the list. In Python indices start
at zero, e.g., the first value in a list is obtained with:

```python
print(x[0])
1
```

You can access the last element of a list using:

```python
print(x[-1])
3
```

You can create an empty list using two equivalent ways:

```python
x = []
x = list()
```

To find out the length of a list, i.e., how many items it contains, you can use the `len()`
built-in function:

```python
x = [1, 2, 3]
print(len(x))
3
```

You can initialise a list to contain multiple instances of a particular value, e.g., initialising it
to contain 10 zeros, with:

```python
x = [0] * 10
print(x)
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
```

!!! note
    This is ok for initialising lists of numbers of strings, but it can be dangerous to initialise
    lists of compound data type in this way; each item in the list will "point" to the same object,
    so they are not independent copies, e.g., if creating a list of lists initialised to zero with

    ```python
    x = [[0] * 3] * 3
    print(x)
    [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    ```

    then each sublist will in fact be the same object. So if you change one you change them all:

    ```python
    x[0][0] = 1
    print(x)
    [[1, 0, 0], [1, 0, 0], [1, 0, 0]]
    ```

    In these cases [list comprehension](../demo-flow-control/index.html#list-comprehension) is a
    better option:

    ```python
    x = [[0 for _ in range(3)] for _ in range(3)]
    ```

    for which the sublists *will* be independent copies.

You can combine lists together using the `+` @(operator). To get a new list that is the combination
of two other lists concatenated together you can use:

```python
x = [1, 2]
y = [3, 4]
z = x + y
print(z)
[1, 2, 3, 4]
```

Or, you could extend an existing list in a couple of ways:

```python
x = [1, 2]
y = [3, 4]

# using the += operator
x += y
print(x)
[1, 2, 3, 4]

# or using the extend method
x = [1, 2]
x.extend(y)
print(x)
[1, 2, 3, 4]
```

### Slices

You can return certain values from a list using slice notation: `startidx:endidx` or
`startidx:endidx:step`.

With `startidx:endidx` the `startidx` value is the index for the first list value you want to return
and `endidx` is **one more** than the index of the last list value that you want to return, e.g.:

```python
x = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
print(x[0:5])
[1, 2, 3, 4, 5]

# equivalently
print(x[:5])
[1, 2, 3, 4, 5]

print(x[2:7])
[3, 4, 5, 6, 7]

# print up to the last value
print(x[5:])
[6, 7, 8, 9, 10]

# get a new variable pointing to a set of values
y = x[3:5]
print(y)
[4, 5]
```

With `startidx:endidx:step` you can also just return every `step`th value, e.g.:

```python
# return every other value
print(x[::2])
[1, 3, 5, 7, 9]

# return every other value from index 2 onwards
print(x[2::2])
[3, 5, 7, 9]

# return every third value from the start to one before index 8
print(x[:8:3])
[1, 4, 7]
```

You can return a reversed version of the list with:

```python
print(x[::-1])
[10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
```

!!! note
    Rather than using the colon notation `startidx:endidx:step` you can create a slice using the
    built-in [`slice`](https://www.w3schools.com/python/ref_func_slice.asp) function. For example,
    the following two ways of slicing are equivalent:

    ```python
    # using colon slice notation
    x = [5, 4, 3, 2, 1, 0, -1, -2, -3, -4, -5]
    print(x[1:-1:2])
    [4, 2, 0, -2, -4]

    # using the slice function
    print(x[slice(1, -1, 2)])
    [4, 2, 0, -2, -4]
    ```

### Copying lists

If you set a new variable to be equal to another list variable then the new variable is **not** a
copy of the original list, it is just another name assigned to the same bit of memory as the
original variable name (in `C` jargon it's a
"[pointer](https://www.tutorialspoint.com/cprogramming/c_pointers.htm)"). So, if you change the new
variable then original one will also be changed. E.g.,

```python
x = [1, 2, 3]
y = x  # new variable "pointing" to the same list as x

y.append(4)
print(x)
[1, 2, 3, 4]
```

To create a new variable that is a copy of another list you must use the
[`copy`](https://www.w3schools.com/python/ref_list_copy.asp) method:

```python
x = [1, 2, 3]
y = x.copy()  # a copy of the list x

y.append(4)
print(x)
[1, 2, 3]
print(y)
[1, 2, 3, 4]
```

You can also make a copy by using
[`list`](https://docs.python.org/3/library/functions.html#func-list), e.g.,

```python
y = list(x)
```

or explicitly using the built-in [`copy`](https://docs.python.org/3/library/copy.html) module:

```
import copy
y = copy.deepcopy(x)
```

### Lists within lists

Lists can contain any other object. For example, you can create an array of numbers by having a list
that contains lists:

```python
x = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
```

For each level of the list you can access its values by using a new set of square brackets:

```python
# get the first sublist
print(x[0])
[1, 2, 3]

# get the second value from the third sublist
print(x[2][1])
8
```

### List methods

Like everything in Python, lists are @(objects) and have a variety of useful methods. We will
examine a few here, but they can all be seen by typing `help(list)` in a terminal.

#### Append

Add a new item onto the end of the list:

```python
x = [1, "Hello", 3.4]

# append a new item onto the end of the list
x.append(2)
print(x)
[1, 'Hello', 3.4, 2]
```

#### Insert

Insert an item at a given index:

```python
# insert something into the index 2 (i.e., the third item in the list)
x.insert(2, "World")
print(x)
[1, 'Hello', 'World', 3.4, 2]
```

#### Index

Find the index of a particular value in the list:

```python
x = ["a", "b", "c", "d"]
idx = x.index("b")
print(idx)
1
print(x[idx])
b
```

#### Sort

Sort the values in numerical or alphabetical order.

```python
x = ["b", "d", "a", "c"] 
x.sort()
print(x)
['a', 'b', 'c', 'd']

# sort in reverse order
x = ["b", "d", "a", "c"] 
x.sort(reverse=True)
print(x)
['d', 'c', 'b', 'a']
```

!!! note
    `sort` works "in place", i.e., it actually changes the list. To return a sorted version of a
    list, but keep the original list as it is you can use the built-in
    [`sorted()`](https://www.w3schools.com/python/ref_func_sorted.asp) function, e.g.,

    ```python
    x = ["b", "d", "a", "c"]
    y = sorted(x)
    print(x)
    ['b', 'd', 'a', 'c']
    print(y)
    ['a', 'b', 'c', 'd']
    ```

## Tuples

Tuples are very similar to lists, but they are @(immutable). This means that you cannot change any of
the values they contain once they have been created. Tuples are defined using regular brackets `()`
or with the `tuple` class name.

```python
x = (1, 2, 3, 4, 5)
print(x[1])
2

# show that it is immutable
x[3] = 12
TypeError: 'tuple' object does not support item assignment
```

They can be [sliced](#slices) in the same way a lists.

```python
print(x[::2])
(1, 3, 5)
```

If you want to create a tuple with a single value you have to use a comma after the value, otherwise
it will not be treated as a tuple:

```python
x = (1)
print(type(x))
<class 'int'>

x = (1,)
print(type(x))
<class 'tuple'>
```

You cannot extend or append to a tuple, but you can concatenate two tuples to get a new tuple:

```python
x = (1, 2)
y = (3, 4)
z = x + y
print(z)
(1, 2, 3, 4)
```

## Dictionaries

Dictionaries are a very useful array-like data type. Rather than referencing a value by its index in
the array you can reference it with a key. This key can be a word, so you do not have to know the
position you just have to know the key. Dictionaries are defined with curly brackets `{}` or the
`dict` class name using "key-value" pairs. The "key" can be any integer or a string (generally
descriptive strings are most useful) and the value can be any object, e.g., integers, floats, lists,
or even other dictionaries. When defining a dictionary key-value pairs are separated by colons,
while new items are separated by commas, e.g.,:

```python
x = {"firstname": "Matthew", "lastname": "Pitkin", "age": 39}
```

You can access a value from a dictionary by using its associated key in square brackets:

```python
print(x["firstname"])
'Matthew'
```

You can create an empty dictionary and add values to it with:

```python
x = {}
x["value1"] = 1
x["value2"] = 2
print(x)
{'value1': 1, 'value2': 2}
```

!!! note
    From Python 3.5 onwards the order than you place values into a dictionary will be preserved,
    but in earlier versions the order held in the dictionary may be different.

You can return just the keys in a dictionary using the `keys` method:

```python
x = {"firstname": "Matthew", "lastname": "Pitkin", "age": 39}
print(x.keys())
dict_keys(['firstname', 'lastname', 'age'])
```

and return just the values using the `values` method:

```python
print(x.values())
dict_keys(['firstname', 'lastname', 'age'])
dict_values(['Matthew', 'Pitkin', 39])
```

These are useful for _iterating_ over the dictionary, for example, in a
[for-loop](../demo-flow-control/index.html#for-and-while-loops).

You can remove values from a dictionary using the
[`del`](https://www.w3schools.com/python/ref_keyword_del.asp) @(keyword) or the `pop` method. `del`
just deletes a value, while `pop` deletes but also returns that deleted value:

```python
x = {"firstname": "Matthew", "lastname": "Pitkin", "age": 39}

del x["age"]
print(x)
{'firstname': 'Matthew', 'lastname': 'Pitkin'}

lastname = x.pop("lastname")
print(x)
print(lastname)
{'firstname': 'Matthew'}
Pitkin
```

## Sets

Set are a _bit_ like dictionaries that only contain keys. They can only contain one of any value
(i.e., no duplicates) and they are automatically sorted. Like dictionaries, they are defined using
curly brackets `{}` or the class name `set`. You cannot access values in a set using indexing. In
general, you will not come across sets very much. They are mainly useful for doing faster
comparisons if you are trying to work out if a value is in a "set" of other values.

```python
x = {1, 1, 5, 2, 3, 4, 4}
print(x)
{1, 2, 3, 4, 5}

# show some timing information (set vs list)
%timeit 2 in x
39 ns ± 0.238 ns per loop (mean ± std. dev. of 7 runs, 10000000 loops each)
y = [1, 2, 3, 4, 5]
%timeit 2 in y
49.5 ns ± 1.32 ns per loop (mean ± std. dev. of 7 runs, 10000000 loops each)

%timeit 10 in x
37.5 ns ± 0.93 ns per loop (mean ± std. dev. of 7 runs, 10000000 loops each)
%timeit 10 in y
97.7 ns ± 0.924 ns per loop (mean ± std. dev. of 7 runs, 10000000 loops each)
```

Another use for sets is as a quick way of removing duplicates from a list, e.g.,

```python
# a list containing some duplicate values
x = [1, 2, 3, 1, 6, 2, 5, 7, 8, 8, 10, 2, 4, 9, 9]

# convert to a set
y = set(x)

# convert back to a list
newx = list(y)
print(newx)
[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```

## Complex numbers

Complex numbers can be defined in Python using `j`-notation. For example:

```python
x = 2.3 + 5.4j
print(type(x))
<class 'complex'>
```

The standard mathematical @(operators) will work on complex numbers, e.g.,

```python
x = 2.3 + 5.4j
y = -1.2 + 8.3j
z = x + y
print(z)
(1.0999999999999999+13.700000000000001j)
```

The `complex` type has attributes for accessing the real and imaginary components separately:

```python
print(x.real)
2.3
print(x.imag)
5.4
```

It also has a method for returning the complex conjugate:

```python
print(x.conjugate())
(2.3-5.4j)
```
