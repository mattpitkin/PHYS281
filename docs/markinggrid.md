---
title: Project marking
authors:
    - Matthew Pitkin
    - Brooke Simmons
date: 2020-10-26
---

# Project marking

Below are further details of what you must submit for the project and guideline marking grids.

## Code

You should submit a zipped files containing all your Python scripts, which should be submitted via
Moodle [here](https://modules.lancaster.ac.uk/mod/assign/view.php?id=1700679). This zip file should
also contain a plain text file called `README` or `README.txt` that briefly describes (in a single sentence) the contents
of each Python file and how to run your simulation(s), i.e., which file to run to reproduce simulations. If you produced large data files you do not
need to include these in the submission. In the vast majority of cases we will not be attempting to
run your code - the evidence for it working should be in your report - but don't use this as an
excuse to submit code that fails.

Some general advice is:

* Back up your code somewhere (e.g., OneDrive, Google Drive, Box, Dropbox, [github](https://github.com)).
* Try to make your code modular. Have classes and functions in their own files. Have scripts that do
  certain tests or simulations in their own files too. If possible don't just edit or append every
  test run or simulation into one long file.
* Keep notes of the tests you're doing. Make sure that you document the initial conditions of each
  test, length of run, numerical approximant that your used, etc. Again, have different
  tests/simulations in different appropriately named and commented files.
* For long simulations output the final data to a file(s) and have any plotting scripts as separate
  files that read in that data. You don't want to have to re-run a long simulation just to change
  the marker style or font size on a plot!
* Back up your code, data files and plots somewhere (it's worth repeating!)

You should try and generate results at each stage as you develop your simulation rather than waiting
until everything is complete. Having a complete Solar System is a possible (but challenging) goal.
You may not reach this stage, or you may go beyond it. However, it is more important that your code
works and you can show it works than simulating the full system. 

If you have a working simulation it is more important to get it tested rather than making fancy
plots or interfaces. While having a fancy GUI interface or movies of the simulations are nice, do
not sacrifice spending time doing these things when tests or good documentation or writing your
report are more important.

If you are struggling with where to start it is useful for you to make use of the two project
exercises ([Final Project Part 1](https://modules.lancaster.ac.uk/mod/quiz/view.php?id=1332898) and
[Final Project Part 2](https://modules.lancaster.ac.uk/mod/quiz/view.php?id=1332908)) as a basis for
your simulation. If you look at the marking grid below, code similar to that from the [Final Project
Part 1](https://modules.lancaster.ac.uk/mod/quiz/view.php?id=1332898) exercise would already enable
you to get a D with some small additional work. The code from the [Final Project Part
2](https://modules.lancaster.ac.uk/mod/quiz/view.php?id=1332908) exercises would give you a C with
some additional work. Also look at, and experiment with, the example [test
file](https://modules.lancaster.ac.uk/mod/resource/view.php?id=1332897) accompanying the Week 6
exercises.

### Code marking grid

Below is a marking grid giving a guide as to how the code will be marked. The code will be marked
based on a set of four attributes: functionality, style, algorithms used, and testing. The weights
of marks between the different attributes are given in brackets.

| Grade | Functionality (40%) | Style (20%) | Algorithms (20%) | Testing (20%) |
| ----- | ------------------ | ---------- | --------------- | ------------ |
| A+    | The simulation produces and evolves an n-body gravitationally interacting system with ability to naturally take in arbitrary bodies, or simulates systems with additional physics. | Code uses object oriented features including classes with appropriate methods to set up and evolve the simulation. Code is exceptionally well laid out and easy to understand with appropriate classes, class methods and functions in their own modules with separate analysis/simulation scripts. Code is exceptionally well documented with docstrings and comments throughout. Data and outputs are stored in easily understandable and accessible objects and file types. | Three or more different numerical approximations are used for evolving the system. | Units tests of the key code algorithms are provided. Tests comparing the system to simplified analytical situations are provided. Tests show that conserved properties of the system are indeed conserved to a good approximation. |
| A | The simulation produces and evolves an n-body gravitationally interacting system in 3 dimensions. The inclusion of additional bodies is possible, but requires relatively trivial amounts of further code. | Some use of classes to define the main objects in the simulation, which provide appropriate methods to evolve the simulation. Good use of functions with proper docstrings and comments. Code uses some modularity to split it over multiple files. Data and outputs are stored in an easily usable form. | At least two different numerical approximations are used for evolving the system (e.g., Euler and Euler-Cromer) and comparisons between methods exist. | Tests comparing the system to simplified analytical situations are provided. Tests show that conserved properties of the system are indeed conserved to a good approximation. |
| B | The simulation is able to evolve a system of three or more particles in 2 or 3 dimensions based on their mutual gravitational attraction. Adding new bodies to the system would require significant code alterations. | Code uses functions and basic classes without methods. Functions have basic, but informative docstrings and code comments are widely, but inconsistently used. Data is stored, but the format is not easy to use. | At least two different numerical approximations are used for evolving the system (e.g., Euler and Euler-Cromer), but there is little-to-no direct comparison between methods. | Some quantitative tests are provided, but only at a global level without testing individual aspects of the code. |
| C | The simulation is able to evolve a system consisting of 2 particles in 2 dimensions based on their mutual gravitational attraction. | Code has some very basics docstrings and minimal non-descriptive comments. Data are produced and an attempt is made to store it. | One numerical approximation is correctly used and implemented. | Qualitative, rather than quantitative, tests are provided to show the simulation "looks" correct. |
| D | The simulation is able to evolve a system consisting of a single particle in 2 dimensions in a gravitational field. | Code lacks comments and docstrings. Code is provided in a single script with no modular aspects. Minimal use of functions and no use of classes. No attempt is made to store results in a usable format. | Numerical approximations are not used and only analytical equations are used to calculate particle position. | Only very basic qualitative testing is performed. |
| Fail | No attempt is made to evolve the motion of objects. | Code provided is incoherent and not understandable. | No evolution of objects over time. | No testing of the code is provided. |

!!! note
    You _can_ write your project without making use of Python classes at all. In terms of marking
    the code "style", to get the highest grades without using classes the other aspects of the
    code style must be shown to a higher level, i.e., the code documentation must be present and
    informative, the structure of the code must be sensible and well thought out, the data must be
    stored within the code in a clear and sensible way.

## Report

The report should be **no more than 10 pages long** including pictures (but excluding title page,
abstract and references). You do not need to include code within the report. The report can be
written in whatever software you prefer (e.g., LaTeX or Word), but you **must** submit a **PDF**
file for marking on Moodle [here](https://modules.lancaster.ac.uk/mod/assign/view.php?id=1700680).
If using LaTeX an example template file is available on Moodle and you may want to make use of
online services such as [Overleaf](https://overleaf.com) or [Authorea](https://www.authorea.com/)
for writing your report. Writing a report about a coding project may seem a challenge, but the
report is not meant to be a description of your code. It is meant to describe the physical processes
that you are simulating, how you determined if the simulation worked, how different methods (i.e.,
numerical approximations) compared, and any insights that you gained.

Make sure figures you include are legible, i.e., they have large enough label and legend fonts to be
readable and they use distinguishable lines or markers. Within the report figures should be
captioned to briefly describe what they show and they should be numbered and referred to in the text
(do not include figures if you are not going to describe and refer to them in the text of the
report). If using LaTeX it is good to save your figures using Matplotlib directly as PDFs rather
than converting between png/jpg and pdf. If saving as png/jpg use a `dpi` equal to 150 or more to
give good quality images.

The report should contain:

* An abstract briefly outlining the aims of the project and any outcomes. If you have quantifiable
  results you can summarise them here.
* An introduction describing the physics behind the simulation and motivations for the numerical
  approximation methods used, including equations as appropriate. You do not need to include a long
  historic background discussion of, e.g., planetary motion.
* A description of how you tested your code and any outcomes of tests, i.e., simplified situations
  or tests against analytical results.
* A description of global tests of your simulation, quantified if possible and with some explanation
  of features observed, e.g.,
    * it reproduces stable orbits
    * it conserves **total** linear momentum or angular momentum
    * comparisons against the JPL ephemeris
    * comparisons of different numerical approximation methods for the above cases and using different
    time steps (in what situations did certain setups work well or fail?).
* A conclusion/discussion summarising your findings, describing limitations of your simulation, and
  further work you could do to enhance you simulation.
* Relevant references to the literature; try not to just refer to websites or course notes if a published primary source (book or paper) is available (some references to websites are acceptable, e.g., for software or Solar System ephemerides).

If you extend or produce a simulation with additional/different physics (e.g., electrostatics) or of
alternative systems to the Solar System then that is also perfectly acceptable.

We will not be harsh when it comes to grammar and spelling within the report, but do try and make it
legible and well laid out and formatted. If it is easy for us to see that you have fulfilled certain
goals it is easier for us to award marks. If we have to try and infer things based on incomplete
information or an incoherent layout then awarding marks becomes more difficult.

The report should not contain:

* lengthy descriptions of you code (you are submitting your full code, so we do not need to see it twice);
* descriptions of the process of debugging your code unless it provides insight into how you tested
  the code or what you learned;
* too many figures; you only have 10 pages, so think about what you want to show and therefore
  produce figures that provide useful summary information.
* references purely to websites (unless to software without an associated publication).

### Report marking grid

Below is a marking grid giving a guide to how the report will be marked. The report will be marked
based on a set of five attributes: abstract, introduction, results (including testing), conclusions,
and presentation. The weights of marks between the different attributes are given in brackets.

| Grade | Abstract (10%) | Introduction (20%) | Results (40%) | Conclusions (20%) | Presentation (10%) |
| ----- | -------- | ------------ | ------- | ----------- | ------ |
| A+ | Abstract succinctly summaries the project and enthuses the reader, including mentioning aspects beyond the project's main scope. It includes quantitative results from the simulation including brief explanations of the effects seen. | An exceptional description of the background theory behind the simulation and algorithms being applied, including numerical approximation methods beyond Euler and Euler-Cromer and any extensions beyond the scope of the exercise. | Results include thorough and coherent descriptions of outcomes of a large suite of tests validating the simulation. In depth comparisons between different numerical approximations and time steps are described including detailed quantitative and qualitative assessment of the differences. | A thorough critical examination of the simulation and results is provided. Discussions on the limitations of the methods used are provided. Discussions show high levels of insight into features of the observed results and describe areas for improvement. | The report is superbly laid out and is written in a highly readable writing style. All figures and tables and exceptionally clear, with self-contained and informative captions. |
| A | Abstract provides a readable and succinct summary of the project. It includes some quantitative results from the simulations. | An excellent description of the background theory behind the simulation and algorithms being applied, including two numerical approximation methods such as Euler and Euler-Cromer. | Results include a coherent description of outcomes of a suite of tests validating the simulation. Comparisons between different numerical approximations and different time steps are described including quantitative and qualitative assessment of the differences. Any errors are minor and do not effect the interpretation of the results. | A critical examination of the simulation and results is provided. Discussions on the limitations of the methods used are provided. Discussions show insight into features of the observed results and describe areas for improvement. | The report is very well laid out with clearly defined sections that are ordered in an appropriate manner. Figures and tables are all legible and of a high quality and all have informative captions. |
| B | Abstract provides a good and understandable summary of the project. It includes some qualitative description of results from the simulations. | A good description of the background theory behind the simulation and algorithms being applied, including two numerical approximation methods such as Euler and Euler-Cromer. | Results include a qualitative description of outcomes of a suite of tests validating the simulation. Comparisons between different numerical approximations are described including a qualitative assessment of the differences. There may be some minor errors in the results that affect their interpretation. | A good summary of the results is provided including some qualitative interpretation. Limitations of the simulation and areas for improvement are acknowledged, but lack detail. | The report has a good structure with relevant sections included. The writing style is good and generally flows in a coherent manner between section. Figures are generally legible, with minor exceptions. Captions are included, but provide more limited information. |
| C | Abstract provides a satisfactory summary of the project. It includes some qualitative description of results from the simulations. | A satisfactory description of the background theory behind the simulation and algorithms being applied, including one numerical approximation method such as Euler or Euler-Cromer. | Results include a qualitative description of outcomes of more than one test validating the simulation. There are several errors in the results that lead to misinterpretations of the results. | A satisfactory summary of the results is provided including some qualitative interpretation. Limitations of the simulation and areas for improvement are not mentioned. | The report has a satisfactory structure with most relevant sections included. Writing style is mostly clear, but has areas of inconsistency and incoherence. Tables and figures exist and have captions, but are hard to interpret with the information given. |
| D | Abstract is present and contains some information about the project scope, but no discussion of results obtained. | The introduction describes some background although the description of how this relates to the simulation is not clear. Numerical approximations are not described or are inadequately described. | Results lack any qualitative or quantitative description of the simulation output. There are many errors in the results that lead to misinterpretations of the results. | Results are summarised, but not in a clear manner giving the reader only limited understanding of the outcomes. | Poor report structure with missing or undifferentiated sections. Writing style is not clear and can be incoherent. Figures that are included are not well formatted with missing or illegible material and captions are missing or inadequate. |
| Fail | Abstract is absent or provides no meaningful description of the report. | Introduction is missing or gives no indication of the necessary background material relevant to the report. | Results are missing, data is not presented or included in a way that is understandable. No description of the process by which results were obtained is given. There are very many errors in the results and their interpretation. | The conclusion provides no discussion of the outcomes of the work and no mention of the limitations of the work.  | Very poor report structure with important section missing. Figures are missing or entirely illegible. |
