---
title: Phys281 Lecture 1
author: Matthew Pitkin and Elisabetta Boella
date: 11 October, 2021

---

# Course Aims

Programming is an important skill for scientists in the modern world. At the end of this module you
should be able to:

1. Understand the basic concepts involved in writing computer programs;
2. Understand the main features of Python;
3. Design and write simple programs in Python;
4. Devise and use test procedures for your programs;
5. Learn how to debug computer programs;
6. Design and write programs to solve numerical problems.

---

# Staff 

* Academics
  * Elisabetta Boella, <e.boella@lancaster.ac.uk>, A019
  * Neil Drummond, <n.drummond@lancaster.ac.uk>, B075

* Contact 
  * Chat in Teams ([Elisabetta](https://teams.microsoft.com/l/chat/0/0?users=e.boella@lancaster.ac.uk)/[Neil](https://teams.microsoft.com/l/chat/0/0?users=n.drummond@lancaster.ac.uk)) or via email
  * **Note**: You can only expect help Monday to Friday from 9 to 5

---

# Lectures

* Programming is a skill
  * It is not suited to book learning
  * It requires practice to learn, i.e., workshops 

* Course notes are available online in html and as video demonstrations
  * Moodle course page <https://modules.lancaster.ac.uk/course/view.php?id=35041>
  * Course notes page <https://www.lancaster.ac.uk/staff/drummonn/PHYS281/>
    * run the examples in the notes yourself!

* Look on Moodle for the suggested reading each week (quite top heavy loaded towards the start of the
course).

During the lectures we will primarily go through a series of exercises.

---

# Workshops

Weekly in-person computing labs workshops on Tuesdays/Wednesdays (check your time table). Participation can be via [Teams](https://teams.microsoft.com/l/channel/19%3a2fc8b74ecec9415da068a9d1db998c2f%40thread.tacv2/General?groupId=6450347a-2db6-4607-b96d-5b56f586d9b5&tenantId=9c9bcd11-977a-4e9c-a9a0-bc734090164a) if you cannot attend in person.
  
* Read the course notes before the workshops.
* Attempt, or at least look at, exercises before the workshops if possible

We will be present to provide help and guidance in completing coursework, or general programming advice

* it's interactive: ask questions, help each other out, but *do not* share completed code with everyone
* post on Teams channel for general questions
* do not be afraid of asking basic questions - there is a wide range of coding experience across the class

---

# Recommended Books

The text for this course is
  
**Python and Matplotlib Essentials for Scientists and Engineers**, 

Matt A. Wood, IOP Publishing 2015

<http://iopscience.iop.org/book/978-1-6270-5620-5>.

The book is freely available from the Institute of Physics as a pdf or ebook.

<p class="fragment" style="color:orange;">Note the book is based on Python2 and not Python3</p>

There are many online Python tutorials that you can also use, e.g., the official Python tutorial at:

<https://docs.python.org/3/tutorial/>

---

# Assessment

* Is by coursework only. There is no exam!
* The first five weeks of online quizzes/exercises are worth 6% per week (total of 30%). 
* The final five weeks is a single project.
  * Gravitational simulation of an *n*-body gravitational system (e.g., a Solar System simulator)
  * Two intermediate online assessments worth 5% each
  * Final Report worth 30%
  * Final Project Code worth 30%

---

# Coursework Submission

* All work in the first five weeks will be tested using Moodle via a quizzes and exercises.
  * There is an unmarked [practice](https://modules.lancaster.ac.uk/mod/quiz/view.php?id=1685860) exercise available to try out. Do this before attempting the actual exercise for grades.
  * Submission time for first five weeks is 14:00 on Tuesday of the following week. 
  * Late submission deadline is 14:00 on Wednesday. 
  * Late penalty of one grade level.
  * Announcements made via Moodle and Teams.
  * First five weeks are open for submission from today
* If you need an extension/have a problem contact Elisabetta, myself or Louise Crook <louise.crook@lancaster.ac.uk>. 
  * email or Teams is preferred to Moodle messages (which can get lost)
  * If you have a problem come and talk to us!

---

# Why Python?
 
* Python is now becoming a popular language in school, so you are more likely to have experience that we can build on.
* Python is currently one of the most used languages in industry (see, e.g., the IEEE Spectrum report).
* There are a huge number of widely used and tested resources and packages out there for scientific computing, such as NumPy, SciPy and Matploltib.
* Python is portable - Python programs are cross platform and run on most computer systems in use today.
* Many modern data science and machine learning applications use Python as an interface, which is driving its growth.
* Python is currently used by many academics in the department.

---

# Why Python?

In the [TIOBE](https://www.tiobe.com/tiobe-index/) index Python popularity and usage is still
growing:

| Sep 2021 | Sep 2020 | Change | Language | Ratings | Change |
| -------- | -------- | ------ | -------- | ------- | ------ |
| 1 | 1 |  | C | 11.83% | -4.12% |
| 2 | 3 | ↑ | Python | 11.67% | +1.20% |
| 3 | 2 | ↓ | Java | 11.12% | -2.37% |
| 4 | 4 | | C++ | 7.13% | +0.01% |
| 5 | 5 | | C# | 5.78% | +1.20% |
| 6 | 6 | | Visual Basic | 4.62% | +0.50% |

---

# Which Python 

* Installing/using Python 3.6, 3.7, 3.8, or 3.9 is acceptable (Python2 is not acceptable)
* Recommend installing Python using [Anaconda](https://www.anaconda.com/distribution/)
  * <https://www.lancaster.ac.uk/staff/drummonn/PHYS281/demo-anaconda/>
* By default Anaconda has the following modules required for the computing labs
  * **NumPy** <https://pypi.org/project/numpy/>
  * **SciPy** <https://pypi.org/project/scipy/>
  * **Matplotlib** <https://pypi.org/project/matplotlib/>

---

# Which Editor 

* Recommend using [**Microsoft Visual Studio Code**](https://code.visualstudio.com/)
  * <https://www.lancaster.ac.uk/staff/drummonn/PHYS281/demo-vs-code/>
  * Comes with terminal integration
  * Code Checking
  * Debugger 
  * Auto completion
  * Auto Indentation 
  * Choose Colour Themes and Font sizes that suit you

---

# Backup Your Code

* Use OneDrive or some other backup system or version control software.
  * No excuses for lost work. 

This is particularly important when it comes to the project work.

---

# Week 1

## Quizzes 

* A quiz on Moodle

## Exercises 

1. Complete the Hello World exercise.
2. Complete Euler's Formula exercise.
3. Complete the trig results exercise.
4. Complete the broken code exercise.

---

## Week 1 quizzes

* Using Python as a Calculator.
  * Make sure you do not include the prompt
  * Copy the exact answer (no rounding or guessing)
* Multiple-choice introductory questions.
  * Check basic knowledge

---

# Week 1 Exercise 1

Create a Python function called `helloWorld` (**note the case**) that prints 

```python
Hello World! 
How are things.
```
to standard output using the `print` function. 

**Aims**

* Use editor to write a Python program. 
* Create your first function. 

---

# Week 1 Exercise 2

Create a Python function called `eulersFormula` that returns the value of Euler's formula

$\Huge{e^{i\pi} + 1}$

using Pythons `cmath` or `math` module.


**Aims**

* Use the editor to write a Python program. 
* Check that you can import functions from libraries 
* Understand accuracy limitations of computer programs. 

---

# Week 1 Exercise 3

Create a Python function called `trigResults` that takes a floating point number, *x*, as an
argument and returns two values using the `a, b` syntax containing the following quantities (in this
exact order)

\begin{eqnarray} {\sin(x)}\\
{ \csc(x) \mathrm{(~cosecant~)}}
\end{eqnarray}

using Python's `math` library. 

**Aims**

* return a multiple values as the result of a function. 
* Practice using the `math` library.

---

# Week 1 Exercise 4

Fix the following broken code:

```python
# countdown function
deg 2TheMoon(countdown)
    # count down to zero
    for i range(countdown, -1, -1):
        print("{}...".format(i)
   print("BLAST OFF!!!!')

% use the function
toTheMoon(10)
```

**Aims**

* learn how to apply correct Python syntax
* learn how to debug code

