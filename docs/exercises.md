# Exercises

Here are a selection of exercises covering various aspects of the course material. Their aim is to
make you think about how to solve a problem using code. These are not assessed, but you are
encouraged to try these out as the best way to learn to code is to do!

In several cases there are already exist functions, e.g., in NumPy, for performing some of these
exercise problems. While generally you should use existing functions from well maintained libraries
(they will be very well tested and robust), here the aim is for you to think about how you would
code up the function yourself.

## Exercise {{ counter() }}

!!! question "Part 1"
    Open a Python/IPython terminal and declare two variables as @(floating point numbers). Add the
    two variables and store the output as a new variable. Print out the new variable value to the
    screen.

??? info "Solution"
    ```console
    $ ipython
    ```

    ```python
    >>> x = 1.2774392  # variable containing a floating point number
    >>> y = -3.4374323  # another variable containing a floating point number
    >>> z = x + y  # add the two variables and store result in z
    >>> print(z)  # print the result z to the screen
    ```

!!! question "Part 2"
    Print out the resulting variable two 3 decimal places.

??? info "Solution"
    Several options exist, e.g.,

    ```python
    >>> print("{0:.3f}".format(z))
    ```

    or

    ```python
    >>> print(f"{z:.3f}")
    ```

    or

    ```python
    >>> print("%.3f" % z)
    ```

!!! question "Part 3"
    Perform the same task, but this time write the code in a text file saved with the `.py`
    extension. Run the code in VS Code and also from the @(command line).

## Exercise {{ counter() }}

!!! question
    In a Python/IPython terminal, or in a script, import an appropriate library to calculate the
    sine of a list of angles that are given in degrees.

??? info "Solution"
    A method using the [`math`](https://docs.python.org/3/library/math.html) library is:

    ```
    import math

    # make a list of angles (assumed to be in degrees)
    angles = [0, 15, 30, 45, 60, 75, 90, 105, 120, 135, 150, 165, 180]

    sines = []
    # loop over angles
    for angle in angles:
        rad = math.radians(angle)  # convert angle to radians
        # rad = angle * math.pi / 180  # an alternative
        sines.append(math.sin(rad))  # calculate sine an append to list
    ```

    A different method using the [`NumPy`](https://numpy.org/doc/stable/index.html) library is:

    ```
    import numpy as np

    rads = np.deg2rad(angles)  # convert angles to radians
    sines = np.sin(rads)
    ```

## Exercise {{ counter () }}

!!! question "Part 1"
    Use list comprehension to generate a list containing the square root of all integers between 1 and 50.

??? info "Solution"
    ```python
    import math

    sqroots = [math.sqrt(x) for x in range(1, 51)]
    ```

!!! question "Part 2"
    Now use list comprehension to generate the square roots of only even numbers.

??? info "Solution"
    ```python
    import math

    sqroots = [math.sqrt(x) for x in range(1, 51) if x % 2 == 0]

## Exercise {{ counter() }}

!!! question
    In a Python file, write a function that asks the user to input a date in the format
    "YYYY-MM-DD" and then prints out the day of the week (see the Python
    [`datetime`](https://www.w3schools.com/python/python_datetime.asp) library). In another Python
    script, or Python/IPython terminal, import the function that you have written and run it.

??? info "Solution"
    Create a Python (called, say, `weekday.py`) file containing:

    ```python
    from datetime import datetime

    def getweekday():
        # ask user for input
        datestr = input("Input a date in the format YYYY-MM-DD: ")

        # split string into parts
        year, month, day = datestr.split("-")

        # convert into datetime object
        d = datetime(int(year), int(month), int(day))

        # get the day of the week
        weekday = d.strftime("%A")

        # output day of the week
        print(f"The date {datestr} was on a {weekday}")
    ```

    You may want to add a check that the date in is the correct format. This function could then be
    used with:

    ```console
    $ ipython
    ```

    ```python
    >>> from weekday import getweekday
    >>> getweekday()  # run the function
    ```

## Exercise {{ counter() }}

!!! question
    Suppose you have a set of files containing the results of multiple consecutive
    experiments/simulations. To distinguish the files each file name is suffixed by an integer with
    preceding zeros, such the the number is always 3 digits long (assuming no more than 1000 files
    exist), e.g.,:

    ```
    experimental_results_000.txt
    experimental_results_001.txt
    ...
    experimental_results_258.txt
    experimental_results_259.txt
    ```

    Assuming you know how many files you have and the file name format, how might you loop over all
    the files to read them in?

??? info "Solution"
    A possible solution is:

    ```python
    N = 260  # total number of files

    basename = "experimental_results_{0:03d}.txt"

    # loop over files and read in results
    results = []
    for i in range(N):
        thisfile = basename.format(i)

        # read in the results in some form
        with open(thisfile, "r") as fp:
            results.append(fp.read())
    ```

## Exercise {{ counter() }}

!!! question "Part 1"
    Write a function that takes in a list of numbers as an argument and returns their
    [mean](https://en.wikipedia.org/wiki/Arithmetic_mean).

??? info "Answer"
    An example of how to do this is:

    ```python
    def mean(values):
        s = 0.0  # variable to hold sum of values
        for value in values:
            s += value

        # return the mean
        return s / len(values)
    ```

    You could add some checking that values is indeed a list. You could also use the built-in
    Python [`sum()`](https://docs.python.org/3/library/functions.html#sum) function rather
    than using the for loop.

!!! question "Part 2"
    Write a function that takes in a list of numbers as an argument and returns their [standard
    deviation](https://en.wikipedia.org/wiki/Standard_deviation). Can the function from Part 1 be
    re-used?

??? info "Solution"
    An example of how to do this is:

    ```python
    def std(values):
        # get the mean of the values (re-use the previous function)
        mu = mean(values)
        
        # get the variance (re-use mean function again)
        var = mean([(x - mu)**2 for x in values])

        # return the standard deviation
        return var ** 0.5
    ```

!!! question "Part 3"
    Write a function that that takes in list of numbers as an argument and returns the median.

??? info "Solution"
    An example of how to do this is:

    ```python
    def median(values):
        # use the built-in sorted function to sort the values in ascending order
        sortvals = sorted(values)

        # get the halfway index
        half = int(len(values) / 2)
        
        # check if values contains an odd or even number of values
        if len(values) % 2 == 0:
            # an even number, so return average of middle two numbers
            return (values[half - 1] + values[half]) / 2
        else:
            # an odd number, so return middle number
            return values[half]
    ```

## Exercise {{ counter() }}

!!! question
    Write a function that:
    
     * takes in a list of strings as an argument,
     * finds the unique strings,
     * counts the number of occurrences of each of those unique strings in the list
     * returns those number counts in a dictionary keyed by the unique string values.

    E.g.,

    ```python
    >>> animals = ['cat', 'dog', 'dog', 'dog', 'cat', 'horse']
    >>> counts = count_occurrences(animals)
    >>> print(counts)
    {'cat': 2, 'dog': 3, 'horse': 1}
    ```

??? info "Solution"
    A way of doing this is:

    ```python
    def count_occurrences(values):
        # get unique strings by converting to a set
        unique = set(values)

        # create empty dictionary for counts
        counts = {}

        # loop over unique strings and count occurrences
        for word in unique:
            count = 0
            for w in values:
                if w == word:
                    count += 1

            # short method (use count method of a list)
            #counts[word] = values.count(word)

        return counts
    ```

## Exercise {{ counter() }}

!!! question "Part 1"
    Write a function that takes in a list as an argument and returns a new list containing the square of
    every $n$th index (starting at the 0 index), where $n$ is another argument to the function with a
    default value of 2.

    E.g.,

    ```python
    >>> values = [2, 3, 4, 5, 6, 7, 8, 9, 10]
    >>> sq = square_index(values)
    >>> print(sq)
    [4, 16, 36, 64, 100]
    ```

??? info "Solution"
    A way of doing this is:

    ```python
    def square_index(values, step=2):
        squ = []

        # loop over list in steps of "step"
        for i in range(0, len(values), step):
            squ.append(values[i] ** 2)

        return squ

        # short method (using slice notation instead)
        #return [x ** 2 for x in values[::step]]
    ```

    You may want to include checks that `values` is a list and that `step` is an integer.


!!! question "Part 1"
    Alter the function so that it takes in another argument, `reverse`, which defaults to `False`, but
    if `True` makes the function return the list in reverse order.

??? info "Solution"
    A way of doing this is:

    ```python
    def square_index(values, step=2, reverse=False):
        squ = []

        # get indices to return
        if reverse:
            idxs = range(len(values), 0, -step)
        else:
            idxs = range(0, len(values), step)

        # loop over list in steps of "step"
        for i in idxs:
            squ.append(values[i] ** 2)

        return squ
    ```

    The [`slice()`](https://docs.python.org/3/library/functions.html#slice) function could also be
    used rather than the [`range()`](https://docs.python.org/3/library/functions.html#func-range)
    function.

## Exercise {{ counter() }}

!!! question "Part 1"
    Given a square 2D matrix, e.g.,:

    ```python
    M = [[1.5, 2.1, 3.6, 4.1], [-0.2, 6.1, 7.2, -5.0], [3.4, 10.1, 1.7, 12.9], [-13.0, 1.3, -2.4, 0.8]]
    ```

    write a function that takes in the matrix as an argument and returns it's
    [diagonal](https://en.wikipedia.org/wiki/Main_diagonal) elements as a list.

??? info "Solution"
    ```python
    def diag(M):
        """
        Return the diagonal elements of a square 2D matrix.

        Parameters
        ----------
        M: matrix
            A square 2D matrix

        Returns
        -------
        list:
            A list of the diagonal elements of the matrix.
        """

        de = []

        # loop over length of matrix
        for i in range(len(M)):
            de.append(M[i][i])

        return de
    ```

    You may want to include tests that the matrix is two-dimensional and square.

!!! question "Part 2"
    Write a function to calculate the [determinant](https://en.wikipedia.org/wiki/Determinant) of
    the matrix.
    
    Hint: The built-in Python
    [`itertools`](https://docs.python.org/3/library/itertools.html#module-itertools) module can
    calculate permutations. You will also need to calculate the [_signature_ (or
    parity)](https://en.wikipedia.org/wiki/Parity_of_a_permutation) of the permutation.

??? info "Solution"
    ```python
    from itertools import permutations
    
    def sgn(permutation):
        """
        Get the signature, or parity of a permutation (based on
        https://gist.github.com/lycantropos/217710b0afc40b3031762274275c204a)
        if numbers between 0 and N, where N is the length of the permutation
        list.

        Parameters
        ----------
        permutation: list
            A permutation of the numbers from 0 to len(list)

        Returns
        -------
        int:
            A 1 for an even permutation, -1 for an odd permutation.
        """

        if len(permutation) == 1:
            return 1

        transitions_count = 0
        for idx, element in enumerate(permutation):
            for next_element in permutation[idx + 1:]:
                if element > next_element:
                    transitions_count += 1

        return 1 if not (transitions_count % 2) else -1

    def det(M):
        """
        Calculate the determinant of a square 2D matrix.

        Parameters
        ----------
        M: matrix
            A square 2D matrix

        Returns
        -------
        float:
            The determinant value.
        """

        # length of matrix
        n = len(M)

        D = 0.0  # variable to sum up determinant

        # get permutations (use Leibniz formula)
        for perm in permutations(range(n)):
            subD = 1.0
            for i in range(n):
                subD *= M[i][perm[i]]

            # get signature of permutation
            D += sgn(perm) * subD

        return D
    ```

## Exercise {{ counter() }}

!!! question "Part 1"
    You have a file containing the student grades for 3 different exercises. The file consists of
    a header line (denoted by starting with a `#`), followed by lines containing four values
    separated by commas ("comma separated values", or CSV):

    1. unique student ID
    2. grade for exercise 1 (mark out of 20)
    3. grade for exercise 2 (mark out of 30)
    4. grade for exercise 3 (mark out of 40)

    E.g.,:

    ```
    # Student ID, Exercise 1 (20), Exercise 2 (30), Exercise 3 (40)
    1234, 12, 23, 29
    1235, 9, 28, 31
    1236, 13, 8, 25
    ```

    Read in the file and then calculate each student's total mark (as a percentage rounded to the
    nearest integer), where the three exercises are weighted at 25%, 25% and 50%, respectively. You
    can used a library such as [NumPy](https://numpy.org/doc/stable/index.html) to read in the
    data.

??? note "Solution"
    A possible way _without_ using, e.g., NumPy

    ```python
    resfile = "results.csv"  # the results file

    maxmarks = [20, 30, 40]  # maximum marks for each exercise
    weights = [0.25, 0.25, 0.50]  # fractional weights for each exercise

    # read in results
    grades = {}
    with open(resfile, "r") as fp:
        for line in fp.readlines():
            # ignore header lines starting with a #
            if line[0] != "#":
                # split the line on commas
                splitline = line.split(",")

                # get student ID (string trailing whitespace)
                studentid = splitline[0].strip()

                # get grades (converting to integers)
                grades[studentid] = [int(grade.strip()) for grade in splitline[1:]]

    # calculate final weighted grades
    finalgrades = {}
    for studentid in grades:
        finalgrade = 0.0
        for i in range(len(maxmarks)):
            finalgrade += weights[i] * (grades[studentid][i] / maxmarks[i])

        finalgrades[studentid] = round(finalgrade * 100)  # convert to percentage
    ```

    This can be more compact using NumPy's
    [`loadtxt()`](https://numpy.org/doc/stable/reference/generated/numpy.loadtxt.html) function or
    the more complete
    [`genfromtxt()`](https://numpy.org/doc/stable/reference/generated/numpy.genfromtxt.html)
    function, e.g.,:

    ```python
    import numpy as np

    resfile = "results.csv"  # the results file

    maxmarks = [20, 30, 40]  # maximum marks for each exercise
    weights = [0.25, 0.25, 0.50]  # fractional weights for each exercise
    
    results = np.loadtxt(
        resfile,
        comments="#",  # ignore header (could also use skiprows=1)
        delimiter=",",  # comma separated values
    )

    # calculate final weighted grades
    gradevalues = np.round(
        100 * sum(weights[i] * results[:,i+1] / maxmarks[i] for i in range(len(weights)))
    )

    for i in range(len(results)):
        studentid = str(results[i, 0])  # convert ID to string
        finalgrades[studentid] = gradevalues[i]
    ```

    Another option would be to use the
    [pandas](https://pandas.pydata.org/pandas-docs/stable/index.html)
    [`read_csv()`](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.read_csv.html)
    function.

!!! question "Part 2"
    Write the results to a new CSV file with the total grade as a new fifth column.

??? info "Solution"
    There are again multiple ways of doing this. E.g., using the NumPy [`savetxt()`] function
    (assuming we have the `results` and `finalgrades` as above):

    ```python
    import numpy as np

    # append final results onto the "results" array
    results = np.hstack((results, [grade for grade in finalgrades.items()]))

    outputfile = "final_results.csv"
    header = "np.Student ID, Exercise 1 (20), Exercise 2 (30), Exercise 3 (40), Final grade (%)"

    np.savetxt(outputfile, results, fmt="%d", delimiter=",", header=header)
    ```

## Exercise {{ counter() }}

!!! question "Part 1"
    Write a function that returns a [boxcar function](https://en.wikipedia.org/wiki/Boxcar_function) of the form:

    $$
    f(x) = \left\{\begin{array}{rl}
     C, & \text{if } a \leq x \leq b  \\
     0, & \text{otherwise},
     \end{array}\right.
    $$

    where the arguments should be a list containing $x$ values at which to evaluate the function,
    the limits $a$ and $b$ at which the boxcar starts and stops, and the amplitude $C$. The
    following defaults (to give a standard
    [rectangular function](https://en.wikipedia.org/wiki/Rectangular_function)) should be set:
    $a = -1/2$, $b=1/2$, and $C = 1$.

??? info "Solution"
    A potential way of doing this is:

    ```python
    def boxcar(x, a=-0.5, b=0.5, C=1):
        vals = []

        # loop over x-values
        for xs in x:
            if a <= xs <= b:
                # add box
                vals.append(C)
            else:
                # add zeros
                vals.append(0.0)
        
        return vals
    ```

    You may want to include checks that `x` is a list, that `a` is less than `b`, and that `C` is positive.
    An alternative way using NumPy array operations would be:

    ```python
    import numpy as np

    def boxcar(x, a=-0.5, b=0.5, C=1):
        # initialise the array filled with zeros and the same length as x
        vals = np.zeros_like(x)

        # get indices of x-array with the [a, b] range
        idx = np.argwhere((x > a) & (x < b))

        # fill in vals with C
        vals[idx] = C
        
        return vals
    ```

!!! question "Part 2"
    Write a function to that returns a
    [triangular function](https://en.wikipedia.org/wiki/Triangular_function) of the form:

    $$
    f(x) = \left\{\begin{array}{rl}
    C - \left|\frac{ {\rm d}y}{ {\rm d}x}(x - x_0)\right|, & \text{if } a \leq x \leq b \\
    0, & \text{otherwise},
    \end{array}\right.
    $$

    where $x_0$ is the midpoint of the triangle and ${\rm d}y/{\rm d}x$ is the gradient of the
    sides of the triangle. The arguments should be a list containing $x$ values at which to
    evaluate the function, the limits $a$ and $b$ at which the triangle starts and stops, and
    the peak triangle amplitude $C$. The following defaults (to give a standard normalised
    [triangular function](https://en.wikipedia.org/wiki/Triangular_function)) should be
    set: $a = -1$, $b=1$, and $C = 1$.

??? info "Solution"
    A potential way to do this is:

    ```python
    def tri(x, a=-1, b=1, C=1):
        vals = []
        
        # get half-width of the triangle's base
        halfwidth = (b - a) / 2

        # mid-point of triangle
        mid = a + halfwidth

        # gradient of triangle sides dy/dx
        grad = C / halfwidth

        # loop over x-values
        for xs in x:
            if a < xs < b:
                vals.append(C - abs(grad * (xs - mid)))
            else:
                vals.append(0.0)

        return vals
    ```

    You may want to include checks that `x` is a list, that `a` is less than `b`, and that `C` is positive.
    An alternative way using NumPy array operations would be:

    ```python
    import numpy as np

    def tri(x, a=-1, b=1, C=1):
        # initialise the array filled with zeros and the same length as x
        vals = np.zeros_like(x)
        
        # get half-width of the triangle's base
        halfwidth = (b - a) / 2

        # mid-point of triangle
        mid = a + halfwidth

        # gradient of triangle sides dy/dx
        grad = C / halfwidth

        # get indices of x-array with the [a, b] range
        idx = np.argwhere((x > a) & (x < b))

        # fill in indicies with a triangle
        vals[idx] = C - np.abs(grad * (x[idx] - mid))

        return vals
    ```

!!! question "Part 3"
    Create a plot showing both a boxcar function *and* a triangle function evaluated over some
    range of $x$-values. The two functions should be plotted in different colours and there should
    be a legend giving the function names.

??? info "Solution"
    A potential solution is:

    ```python
    from matplotlib import pyplot as plt
    import numpy as np

    # create a range of x-values
    x = np.linspace(-5, 5, 1000)

    # get boxcar function (choosing some input values)
    b = boxcar(x, a=-4.5, b=-1.5, C=3.5)

    # get triangle function (choosing some input values)
    t = tri(x, a=-3.1, b=2.5, C=6.0)

    # make the plot
    plt.plot(x, b, color="r", label="boxcar")
    plt.plot(x, t, color="b", linestyle="--", label="triangle")
    plt.legend()  # add the legend based on the label values
    plt.xlim([x[0], x[-1]])  # make x-axis limits stick to the x range
    plt.show()
    ```

    ![Plot of boxcar and triangle function](exercises/exercises_boxcar_tri.png)

## Exercise {{ counter() }}

!!! question "Part 1"
    Write a function to "bin" a list of numbers, i.e., count how many of the numbers are in each of
    a set of intervals over the full range (e.g., the bin sizes in a
    [histogram](https://en.wikipedia.org/wiki/Histogram)). The function arguments should be
    the list of numbers, the number of bins (defaulting to 10), and the lower and upper bin edges
    (if not given by the user these should default to use the smallest and largest number in the
    input list, respectively).

    Try doing this without using NumPy!

??? info "Solution"

    ```python
    def binned(samples, nbins=10, low=None, high=None):
        """
        Count the number of values within a set of bins.

        Parameters
        ----------
        samples: list
            A list of numbers which will be "binned"
        nbins: int
            The number of bins into which to split the range of numbers
        low: float
            The edge of the lowest bin (defaults to the smallest value in `samples`)
        high: float
            The edge of the highest bin (defaults to the largest values in `samples`)

        Returns
        -------
        tuple
            A tuple containing two lists: the bin edges and the number counts in each
            bin
        """

        # get the bin ranges
        if low is None:
            low = min(samples)

        if high is None:
            high = max(samples)

        # step size between bins
        binstep = (high - low) / nbins

        # lists to contain bin edges and number counts
        binedges = [low]
        bincounts = []

        # loop over bins
        for i in range(nbins):
            # set upper edge of bin
            binedges.append(binedges[-1] + binstep)

            # count number of samples in bin
            bincount = 0
            for sample in samples:
                if binedges[i] <= sample < binedges[i+1]:
                    bincount += 1

                # add in amy samples that equal max value in the final bin
                if i == (nbins - 1) and sample == max:
                    bincount += 1

            bincounts.append(bincount)

        return binedges, bincounts
    ```

!!! question "Part 2"
    Edit the function to take another argument, `norm`, which if `True` normalised the bin counts
    so that the area under the histogram $A = \sum_i^{N_{\rm bins}} n_i \Delta x$ adds up to 1.

??? info "Solution"

    ```python
    def binned(samples, nbins=10, low=None, high=None, norm=False):
        """
        Count the number of values within a set of bins.

        Parameters
        ----------
        samples: list
            A list of numbers which will be "binned"
        nbins: int
            The number of bins into which to split the range of numbers
        low: float
            The edge of the lowest bin (defaults to the smallest value in `samples`)
        high: float
            The edge of the highest bin (defaults to the largest values in `samples`)
        norm: bool
            If True normalise the bin counts (default is False)

        Returns
        -------
        tuple
            A tuple containing two lists: the bin edges and the number counts in each
            bin
        """

        # get the bin ranges
        if low is None:
            low = min(samples)

        if high is None:
            high = max(samples)

        # step size between bins
        binstep = (high - low) / nbins

        # lists to contain bin edges and number counts
        binedges = [low]
        bincounts = []

        # total number of samples
        nsamples = len(samples)

        # loop over bins
        for i in range(nbins):
            # set upper edge of bin
            binedges.append(binedges[-1] + binstep)

            # count number of samples in bin
            bincount = 0
            for sample in samples:
                if binedges[i] <= sample < binedges[i+1]:
                    bincount += 1

                # add in amy samples that equal max value in the final bin
                if i == (nbins - 1) and sample == max:
                    bincount += 1

            if norm:
                # normalise the bin counts
                bincount = (bincount / nsamples) / binstep

            bincounts.append(bincount)

        return binedges, bincounts
    ```

## Exercise {{ counter() }}

!!! question
    Estimate the value of $\pi$ using a Monte-Carlo method (i.e., through drawing random numbers).

??? info "Solution"
    A potential solution, based on the ratio of the area of a square with sides 2 units long
    ($A_s = 2 \times 2 = 4$) to a circle with radius of 1 unit ($A_c = \pi r^2 = \pi$), being
    $(A_s / A_c) = 4/\pi$, is:

    ```python
    # import numpy for random number generation
    import numpy as np

    # create random number generator
    rstate = np.random.default_rng()

    # set the number of samples to draw for estimation
    nsamples = 10000

    # draw nsamples samples in x and y uniformly from the square between -1 and +1
    samples = rstate.uniform(-1, 1, (nsamples, 2))

    # get "magnitude" of each point sqrt(x^2 + y^2)
    radius = np.sqrt(samples[:, 0] ** 2 + samples[:, 1] ** 2)
    # radius = np.linalg.norm(samples, axis=1)  # another option

    # work out how many samples are within the unit circle (i.e., radius < 1)
    numincirc = np.sum(radius < 1)

    # get estimate of pi
    estpi = 4 * (numincirc / nsamples)

    print(estpi)
    ```