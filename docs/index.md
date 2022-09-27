# PHYS281: Scientific Programming and Modelling Project

This website provides a series of notes introducing the Python programming language as part of the
PHYS281 course. These notes are available in both text and video formats. They can be accessed in
any order, but it is recommended to cover them in the order presented in the table of contents
sidebar. Concepts and terms will be covered in that order.

To get the most out of the notes it is recommended that you try writing and running the examples
that are presented. A series of exercises are provided to test yourself on the practicalities of
creating some code for a specific problem. These exercises are **not** part of the course
assessment.

This website was created by Matthew Pitkin, based on earlier lecture
notes by Iain Bertram and Robin Long.  Feedback to improve this
website is very welcome, so if you have any questions or comments
please contact the current module lecturers:

* Dr Elisabetta Boella, [e.boella@lancaster.ac.uk](mailto:e.boella@lancaster.ac.uk) ([Chat on MS Teams](https://teams.microsoft.com/l/chat/0/0?users=e.boella@lancaster.ac.uk))
* Neil Drummond, [n.drummond@lancaster.ac.uk](mailto:n.drummond@lancaster.ac.uk) ([Chat on MS Teams](https://teams.microsoft.com/l/chat/0/0?users=n.drummond@lancaster.ac.uk))

In this course we will use many jargon terms and unfortunately this is inevitable. In some cases
certain terms will be used interchangeably as synonyms. We have created a
[glossary](glossary/index.html) of many terms to try and help with this, but it will be incomplete.
Please do ask us if there are any concepts or terms that you do not understand and remember that
Google is your friend! It is worth noting that the aim of this course is to allow you to write and
use Python code. However, this is not a computer science course and we do not expect you to
understand the detailed reasons behind why something is done in a certain way. In the majority of
cases you can treat what we show you as a recipe to follow without needing to know why a particular
syntax or formatting is required.

## Course aims

Programming is an important skill for scientists in the modern world. At the end of this module you
should be able to:

* understand the basic concepts involved in writing computer programs;
* understand the main features of Python;
* design and write simple programs in Python;
* devise and use test procedures for your programs;
* learn how to debug computer programs;
* design and write programs to solve numerical problems.

Programming is a skill. While there is a syntax that that you have to learn, the skill is mainly
acquired through practice, i.e., actually writing and running code.

## What is Python?

[Python](https://www.python.org/) is a [programming
language](https://en.wikipedia.org/wiki/Programming_language), i.e., it is used to write
instructions with a specific syntax that are interpreted and run by a computer. Python is an
interpreted language rather than a compiled language. This means that you write a code that is then
interpreted and run line-by-line. In a compiled language, such as
[C](https://en.wikipedia.org/wiki/C_(programming_language)), the code you write has to be compiled
by a different program to produce an executable file (basically one written in a more primitive
machine language), that you then run.

Interpreted languages are often slightly slower at certain tasks than compiled languages, but have
the advantage that they are easier for doing code development, and can even be run interactively,
due to not having the extra compilation step.

Python is what is known as an [Object Oriented
Programming](https://en.wikipedia.org/wiki/Object-oriented_programming) (OOP) language (other major
languages that support the object oriented paradigm include
[C++](https://en.wikipedia.org/wiki/C%2B%2B) and
[Java](https://en.wikipedia.org/wiki/Java_(programming_language))). This means that the fundamental
things that you use within a code are objects; these are things that can contain both data and
functions that can perform specific tasks on that data.

There have been several versions of Python as the language gets updated and new features added. The
latest major version is Python 3, with Python 3.8 being a recent stable release. While most Python
code is fairly backwards compatible, i.e., can run with previous versions of the language, there are
some specific features that are not. Broadly speaking, code written based on Python 3.5 or above
should be compatible and in this course we will not use any syntax that does not work across these
versions.

Python can be run in both an interactive mode, i.e., you can start an interactive Python terminal
into which you can type and run commands immediately, or it can be used to run pre-written scripts.
In this course we will describe both these modes of use.

### Why Python?

There are many reasons why Python is a good choice as a programming language to learn:

* Python is now becoming a popular language in school, so you are more likely to have experience
  that we can build on.
* Python is currently one of the most used languages in industry (see, e.g., the [IEEE Spectrum
  report](https://spectrum.ieee.org/top-programming-languages-2022)).
* There are a huge number of widely used and tested resources and packages out there for scientific
  computing (see, e.g.,
  [https://wiki.python.org/moin/NumericAndScientific](https://wiki.python.org/moin/NumericAndScientific)),
  such as [NumPy](https://numpy.org/), [SciPy](https://scipy.org/) and
  [Matploltib](https://matplotlib.org/).
* Python is portable - Python programs are cross platform and run on most computer systems in use
  today.
* Many modern data science and machine learning applications use Python as an interface, which is
  driving its growth.
* Python is currently used by many academics in the department.

In the [TIOBE](https://www.tiobe.com/tiobe-index/) index Python popularity and usage is still
growing:

| Sep 2021 | Sep 2020 | Change | Programming Language | Ratings | Change |
| -------- | -------- | ------ | -------------------- | ------- | ------ |
| 1 | 1 |  | C | 11.83% | -4.12% |
| 2 | 3 | :fontawesome-solid-sort-up: | Python | 11.67% | +1.20% |
| 3 | 2 | :fontawesome-solid-sort-down: | Java | 11.12% | -2.37% |
| 4 | 4 | | C++ | 7.13% | +0.01% |
| 5 | 5 | | C# | 5.78% | +1.20% |
| 6 | 6 | | Visual Basic | 4.62% | +0.50% |

## Course overview

This course is assessed through coursework only. There is no exam.

The course assessment consists of two main components:
 
* 5 coursework assignments and quizzes over Weeks 1-5 (the weeks from that starting Oct 11th to that
  starting Nov 8th)
* A project over Weeks 6-10 (the weeks from that starting Nov 15th to that starting Dec 13th)

The 5 coursework assignments and quizzes count for 30% of the overall grade (6% each), with the
project counting for 70%.

Help and guidance for the exercises and project will be provided in weekly (Weeks 1-10) computer lab
sessions split over 3 sessions: 09:00-10:30 and 10:30-12:00 on Tuesdays and 11:30-13:00 (or
13:00-14:30 from Week 6 onwards) on Wednesdays. All students will be assigned to one of these
sessions. Support can also be found via the course Teams channel during these same time slots. There
will also be an "office hours" slot for additional help held on
[Teams](https://teams.microsoft.com/l/channel/19%3a2fc8b74ecec9415da068a9d1db998c2f%40thread.tacv2/General?groupId=6450347a-2db6-4607-b96d-5b56f586d9b5&tenantId=9c9bcd11-977a-4e9c-a9a0-bc734090164a)
on Mondays between 10:00-11:00.

The assignments and quizzes must be submitted on Moodle by 14:00 on the Tuesday the week after the
associated lab session (i.e., the Week 1 assignment should be submitted no later than 14:00 on
Tuesday of Week 2). The late submission deadline is 14:00 on Wednesday. If you
require an extension or have a problem please contact [Elisabetta
Boella](https://teams.microsoft.com/l/chat/0/0?users=e.boella@lancaster.ac.uk) or Neil Drummond or [Louise
Crook](https://teams.microsoft.com/l/chat/0/0?users=l.crook@lancaster.ac.uk) via email or Teams. The
assignments marking makes use of software called [CodeRunner](https://coderunner.org.nz/), which
will automatically test and mark your submitted code. To avoid losing marks it is highly recommended
that you test it on your own machine before submitting it within CodeRunner. Read the questions and
expected inputs/outputs carefully including making sure functions/classes are named exactly as
specified (including letter case).

The project grade is split between several components:

* 2 exercises to be submitted prior to the final project (5% each)
* The written project report (30%)
* The project code (30%)

The [project](https://www.lancaster.ac.uk/staff/drummonn/PHYS281/gravity/) aim is to create and test an n-body
gravitationally interacting system (i.e., the Solar System). The two exercises provide a basis on
which to build up to the full n-body simulation.

## Prerequisites

Before getting started with the course please make sure you are familiar with some of the basics of
the exploring the directory/folder structure of the computer operating system that you are using.
You should know how to browse the directory structure (e.g., with "[File
Explorer](https://en.wikipedia.org/wiki/File_Explorer)" in Windows, or
"[Finder](https://support.apple.com/en-gb/HT201732)" on a Mac OS), be able to create new folders,
and understand how file path structure is formatted, including drive if necessary (e.g.,
`C:\User\username\Project\myfile.py`).

Please also see the material in the "Course notes" -> "Getting started" menu for information on
installing the software required for this course
([Anaconda](https://www.lancaster.ac.uk/staff/drummonn/PHYS281/demo-anaconda/) and [Visual Studio
Code](https://www.lancaster.ac.uk/staff/drummonn/PHYS281/demo-vs-code/)) on your own machine or using
AppsAnywhere on a machine on campus. The ["Online Python environments"](#online-python-environments)
section below has some options for running Python, which can be used as a back-up alternative if you
have initial installation problems.

## Exercises

A selection of [exercises](https://www.lancaster.ac.uk/staff/drummonn/PHYS281/exercises/) have been created for
you to try out and test your Python knowledge. These exercises are not marked and are voluntary. They
will also be used for demonstration purposes during the course lecture slots.

## Other material

There are a variety of useful Python tutorials freely available online:

* The official Python documentation comes with a [tutorial](https://docs.python.org/3/tutorial/index.html)
  on getting started with Python, covering the majority of concepts required to become a proficient user.
* The `w3schools.com` site also offers a Python [tutorial](https://www.w3schools.com/python/default.asp)
  which provides interactive demonstrations embedded in the browser, and includes an introduction to
  [NumPy](https://numpy.org/).
* There is a very nice, and freely available, Software Carpentry course
  "[Plotting and Programming in Python](https://swcarpentry.github.io/python-novice-gapminder/index.html)".

### Recommended reading

* **Python and Matplotlib Essentials for Scientists and Engineers**, Matt Wood, IoP Publishing, 2015
  [http://iopscience.iop.org/book/978-1-6270-5620-5](http://iopscience.iop.org/book/978-1-6270-5620-5):
  this book is freely available as a pdf from the IoP website. Note that this book is written based
  on Python 2 rather than Python 3, so minor differences will be present.
* **Python Data Science Handbook**, Jake VanderPlas, O'Reilly,
  [https://jakevdp.github.io/PythonDataScienceHandbook/](https://jakevdp.github.io/PythonDataScienceHandbook/):
  this book is freely available from the website.

### Ethical programming

Coding is done by people and the outputs of code can affect peoples lives. In some cases the code
you produce may be part of publicly funded work. In others, it may be done within a private
institution and bound by national laws or industry-specific regulations and guidelines. So coding
cannot exist independently of ethics and scrutiny by others.

In general, it is good to think of the following practices when coding:

* Do not use code for illegal or malicious activities.
* Make sure you properly attribute any part of your code that uses code/algorithms from other
  sources. Many codes have open source licenses that allow you to use them or edit them provided
  proper credit is given. Consider giving an open source license to your own code (see, e.g.,
  [here](https://choosealicense.com/)), such as an [MIT
  license](https://choosealicense.com/licenses/mit/) or [GPL
  license](https://choosealicense.com/licenses/gpl-3.0/).
* Coding is often done as part of a community. In such cases be kind and be inclusive. Take a look
  at, e.g., the [NumFOCUS Code of Conduct](https://numfocus.org/code-of-conduct).
* If your code directly affects people or uses personal data, think about whether its design could
  contain or promote biases and if so whether it is possible to mitigate against them.
* Try to document, curate and distribute your code, so that it is useful and usable to others.
  Results should be reproducible into the future. For example, consider hosting your code on a open
  repository such as [Github](https://github.com) (other repositories exist!) and providing online
  documentation, including practical examples of running the code, on sites such as [_Read the
  Docs_](https://readthedocs.org/).
* Make sure any data that your code uses or produces is curated and handled in accordance with data
  protection and governance laws. This is particularly relevant to personal data, for which security
  of the data and compliance with laws and user agreed conditions of use are vital.

While these may not seem relevant to this particular course they are good things to keep in mind for
the future.

### Online Python environments

There are a variety of online Python environments that can be used as a back up. These generally
require your to create an account, but there are generally free account options that provide a
limited but usable range of functionality. For the first half of the course these should suffice for
any coding needs, but may be more limited when attempting the project. The options suggested below
seem to have NumPy, SciPy and Matplotlib available.

* Python Anywhere [https://www.pythonanywhere.com](https://www.pythonanywhere.com)
* repl.it [https://repl.it](https://repl.it)
* Google Colaboratory notebook
  [https://colab.research.google.com](https://colab.research.google.com) - this requires a Google
  account and provides a Jupyter Notebook like Python environment. You can produce plots and install
  a wide variety of packages using pip.

Let us know of any others. 
