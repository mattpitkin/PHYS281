---
title: Gravity simulation
authors:
    - Iain Bertram
    - Matthew Pitkin
    - Brooke Simmons
date: 2020-10-07
---

# Gravity simulation

The final project is to develop a physics simulation in which a physical system evolves with time.
An interesting type of system to consider is the motion of several particles or extended bodies
under the mutual influence of their gravitational fields. This is the example that we will use as
the starting point of the final project for this module.

There is plenty of scope to develop the simple gravitational field simulations described here into
simulations of more complicated systems and you are welcome to extend your project to involve
different physical systems, forces, etc. Initially though you should start by following the steps
presented below. You may find that doing this takes all of the available time or you may find that
you have plenty of extra time to simulate other systems. Either way you will need to write up your
findings in a report as detailed at the end of this [section](#project-description), so make sure
that you leave enough time for this.

As in the case of [numerical integration](../numerical-integration/index.html), most physics
simulations will require some amount of approximation which will introduce an error (i.e., an
inaccuracy) in the results from the simulation. There are various ways to establish the size of this
error:

- Apply the simulation to a system where there is an analytical solution to the equations of motion
  so that the predictions of the simulation can be directly tested against the known results. This
  approach has the advantage of allowing you to unambiguously calculate the size of any error in the
  simulation due to approximations, etc. However, it does not guarantee that the simulation will
  have the same size of error when it is applied to a regime for which there is not an analytical
  solution.
- Apply the simulation to a system for which there are experimental data so that the simulation can
  be directly tested against reality. In some ways this is of course what physics is all about and
  so is a good approach. The difficulty here is that experimental data often contain many
  additional subtle effects which may not be in your simulation so it may not be easy to understand
  where any discrepancies come from.
- For a range of systems, consider whether the simulation conserves quantities that you would expect
  to be conserved, e.g., energy, or total linear or angular momentum. Although conservation of
  energy, etc., does not guarantee that the details of the simulation are accurate, it provides a
  quick global check of the simulation's properties.

You are going to want to consider carefully how to use these approaches to assess the accuracy of
your own simulations.

Let's consider the various steps in developing a general simulation of particle motion in
gravitational fields.

## A "Particle" in The Earth’s Gravitational Field

To start off with, we want to simulate the trajectory of a particle in a cannonball-like trajectory
close to the surface of the Earth. You may want to bear in mind from the start that ultimately we
are going to want to create a simulation that is extendible to the more general case where the
acceleration due to gravity is not constant and may depend on other bodies involved in the
simulation. You should initially write a simulation that can simulate the parabolic trajectories of
a particle close to the surface of the Earth, but a bit of thought on how this might been extendible
to a more general case could save a lot of time later on.

For simplicity, our simulation can be considered initially to be in 2 dimensions: the $x$-direction
which is parallel to the ground, and the $y$-direction which is perpendicular to the ground. We are
of course inherently here assuming the surface of the Earth can be treated as being approximately
flat as long as we consider fairly short trajectories. Later on we can remove this assumption.

In this case we can represent the approximate acceleration by:
$$
  \vec{a} = g = -9.81 \hat{j} ~ \mathrm{m} \, \mathrm{s}^{-2}.
$$

To characterise the motion of a particle in this uniform gravitational field we will need to be able
to calculate the changes in the particle's position $\vec{x}$, and velocity $\vec{v}$ as a function
of time, $t$.

For many (although not all) physical systems we can write the velocity as
$$
  \vec{v}(t) = \int^{t} \vec{a}(\vec{x}, t) \, dt,
$$
and position as
$$
  \vec{x}(t) = \int^{t} \vec{v}(\vec{x}, t) \, dt,
$$
where $\vec{a}(t)$ is the acceleration of the particle and we have restricted ourselves here to
considering a single particle. Equivalently, these can be written as a pair of differential
equations
$$
\vec{v}(t) = \frac{\mathrm{d}\vec{x}(t)}{\mathrm{d}t},
$$
and
$$
\vec{a}(t) = \frac{\mathrm{d}\vec{v}(t)}{\mathrm{d}t}.
$$

In this simple example the acceleration is constant and we can of course just solve the equations
analytically to give the basic equations of motion for constant, uniform acceleration (i.e.
there is no spatial or temporal dependence). The familiar equations are:

$$
\begin{align}
  \vec{v} & =  \vec{v}_{0} + \vec{a} t \\
  \vec{x} & =  \vec{x}_{0} + \vec{v}_{0} t + \frac{1}{2} \vec{a} t^{2}
\end{align}
$$

where the initial position and velocity at time $t=0$ are given by $\vec{x}_{0}$ and $\vec{v}_{0}$,
respectively. As long as the acceleration is constant and uniform, these equations will be accurate
and hence our simulation will not be very interesting.

We would instead like an approximate numerical solution to the equations of motion, so that we can
consider the general case where the acceleration is not constant/uniform and analytical solutions
are therefore not always available. In addition, we'd like to track the evolution of the system as
time increases, so we don't just want the positions and velocities at a time $t$, we want to know
them at intermediate times too. The simplest approach to this is known as the [Euler
method](https://en.wikipedia.org/wiki/Euler_method) (or Euler forward method). It is an iterative
algorithm which allows us to calculate the approximate position and velocity at time $t+\Delta{t}$
given that we know them at the slightly earlier time $t$. It has the form

$$
\begin{align}
  \vec{x}_{n+1} & \approx \vec{x}_n + \vec{v}_n \Delta t, \\
  \vec{v}_{n+1} & \approx \vec{v}_n + \vec{a}_n \Delta t,
\end{align}
$$

where we assume that the acceleration is approximately constant for the small duration $\Delta t$
and the label $n$ denotes the start of this time step and $n+1$ the end of this time step. As when
we were considering [numerical
integration](https://www.lancaster.ac.uk/staff/drummonn/PHYS281/numerical-integration/) methods, this approach is
actually just the first couple of terms of a Taylor series expansion and we expect that there will
be an error of order $\Delta t^2$ each time we apply this iterative formula, so that the
cumulative error over a fixed time will be of order $\Delta t$. Alternative algorithms are discussed
later, but for now the Euler algorithm will suffice.

If we want to consider a slightly more complicated case of motion in the Earth's gravitational field
then we can take into account the variation of acceleration due to gravity with distance from the
Earth's centre $r$ using

$$
\vec{g} = -\frac{G M_\mathrm{E}}{r^2} \hat{r}
$$

for values of $r$ greater than the Earth's radius $R_\mathrm{E}= 6380\,\mathrm{km}$. The mass of the Earth is
given approximately by $M_\mathrm{E} = 5.974\!\times\!10^{24}\,\mathrm{kg}$ and $G$ is the gravitational
constant.

Care must be taken when defining the direction of the field or you could easily end up simulating
anti-gravity!

From this point on you are entirely free to develop your simulation in any way you wish, but **please read the project description thoroughly first!** The next two sections detail one way in
which you could develop your code with a view to developing a simulation of the Solar System, but
you can pick another goal.

## Particle traversing a tunnel through the Earth's core

In principle, we already know everything we need to know in order to simulate the general motion of
a system of particle's moving under the influence of each other's gravitational fields. However,
rather than jump immediately to this scenario we could also consider the following. It is clear that
the acceleration at the surface of the Earth is given by:

$$
\vec{g} = -\frac{G M_\mathrm{E}}{R^{2}_\mathrm{E}} \hat{r}.
$$

We could simulate the path of a projectile dropped from the Earth's surface into a hole that runs
through the centre of the Earth in a straight line, i.e., in a radial direction.

Assuming that the projectile has no component of velocity tangential to the Earth's surface, this is
a one-dimensional problem (which simplifies matters considerably). The gravitational field strength
will depend on the distance of the object from the centre of the Earth. To calculate the
gravitational field we need the mass of the part of the Earth contained within a sphere of radius
$r$ such that:

$$
\frac{m}{M_\mathrm{E}} = \frac{\frac{4}{3} \pi r^{3}}{\frac{4}{3}\pi R^3_\mathrm{E}} = \frac{r^3}{R^3_\mathrm{E}}.
$$

So the gravitational field will be given by:

$$
\vec{g} = -\frac{Gm}{r^2}\hat{r} = -G \frac{M_\mathrm{E}}{r^2} \frac{r^3}{R^3_\mathrm{E}}\hat{r}
  = -G \frac{M_\mathrm{E}}{R^3_\mathrm{E}}r \hat{r}
$$

Hopefully it is clear from this result that we would expect the motion of a projectile dropped into
this hole to be simple harmonic motion. You may want to use this as optional test of your code. You
will clearly have to add new methods to represent the gravitational field inside the Earth. At this
point it is quite likely you will start to see significant limitations of the Euler algorithm. You
should read ahead to the discussion of alternative algorithms as you are likely to want to use the
[Euler-Cromer](https://en.wikipedia.org/wiki/Semi-implicit_Euler_method) algorithm. Depending on how
much time you have, you may want to skip this simulation entirely and move on with your own project
plans, but either way you are likely going to want to replace the Euler algorithm with something
more robust.

## Orbiting Massive Particles (E.g, Planets)

Consider the case of $N$ massive particles moving under the influence of each others’ gravity. The
net acceleration of a particle with mass $m_i$ will be given by

$$
\vec{a}_i = \sum^{N}_{j\neq i}{\frac{-Gm_j}{|\vec{r}_{ij}|^2} \hat{r}_{ij}},
$$

where $\vec{r}_{ij}$ is the displacement vector from the $j^{\mathrm{th}}$ mass to the
$i^{\mathrm{th}}$ mass. In this case, to determine the field that is affecting a given particle we
need to know the locations of all the other particles in our simulation. Notice that the sum of all
forces acting on all particles should be zero at all times. This result is just due to Newton's
third law in the absence of an external field. Note that if we move one particle before calculating
the effect of that particle on all the other particles in our simulation then (unless great care is
taken) our code will violate Newton's third law. This is unlikely to be a good idea.

For a single dimension, e.g., in the $x$-dimension, the above equation would give:

$$
{a_x}_i = \sum^N_{j \neq i} \frac{-G m_j}{|\vec{r}_{ij}|^2}\frac{({r_x}_i - {r_x}_j)}{|\vec{r}_{ij}|}
$$

where, even for one dimension, $|\vec{r}_{ij}|$ is still the total magnitude of the difference in positions between two particles, given by:

$$
|\vec{r}_{ij}| = \left(({r_x}_i - {r_x}_j)^2 + ({r_y}_i - {r_y}_j)^2 + ({r_z}_i - {r_z}_j)^2\right)^{1/2}.
$$

Be careful to make sure the indices of the values in $({r_x}_i - {r_x}_j)$ are in the correct order,
so that the acceleration on object $i$ caused by object $j$ points towards object $j$.

## Different methods of simulating kinematics

Regardless of the details of your final project you are going to need to have a way of approximating
the motion of your system. We have assumed earlier that for a small interval of time $\Delta t$ that
the change in acceleration is small and that the resulting change in position and velocity is given
by 

$$
\begin{align}
  \vec{x}_{n+1} & \approx \vec{x}_n + \vec{v}_n \Delta{t} \\
  \vec{v}_{n+1} & \approx \vec{v}_n + \vec{a}_n \Delta{t},
\end{align}
$$

which we've already referred to as Euler's Method. As stated, this is based on a Taylor expansion of
the standard equations of motion to give

$$
\begin{align}
\vec{v}_{n+1} & = \vec{v}_n + a_n \Delta{t} + \mathcal{O}\left( \Delta t^2\right),\\
\vec{x}_{n+1} & = \vec{x}_n + \vec{v}_n \Delta{t} + \mathcal{O}\left( \Delta t^2\right),
\end{align}
$$

where $\mathcal{O}\left(\Delta t^2\right)$ signifies contributions of higher order.
If $\Delta t$ has a small enough value these higher-order contributions will be small and can be
safely ignored. This is the assumption made by Euler's Method. The error in any given step is given
by the truncation of the expansion and in this case is of order $\Delta t^2$. This error will
accumulate each time the iteration is applied and hence the error in a simulation of fixed duration
will be of order $\Delta t$ (the cumulative error will be of order $N \Delta t^2$, for $N$ time
steps, where a total timespan $T$ gives $N = T/\Delta t$, and hence errors $\propto \Delta t$). In
the following paragraphs other algorithms are introduced. The errors in each of these approximations
are not discussed but an investigation of this could form a part of your project.

As well as not being very accurate, for oscillatory systems the *Euler* method can be unstable. An
alternative method called the [*Euler-Cromer*
method](https://en.wikipedia.org/wiki/Semi-implicit_Euler_method) (or semi-implicit Euler method),
uses the velocity at the end of the step rather than the beginning of the step and should give more
stable results

$$
\begin{align}
\vec{v}_{n+1} & \approx \vec{v}_n + \vec{a}_n \Delta{t},\\
\vec{x}_{n+1} & \approx \vec{x}_n + \vec{v}_{n+1} \Delta{t}.
\end{align}
$$

It is also possible that it may be better to compute the velocity in the middle of the interval
$\Delta t$. This calculation is called the *Euler-Richardson* algorithm. This is particularly useful
for velocity-dependent forces. This algorithm requires use of the *Euler* method to calculate the
intermediate position $x_\text{mid}$ and velocity $v_\text{mid}$ at time $t_\text{mid} = t
+ \Delta t/2$. The force and acceleration are then computed for this mid-point.

$$
\begin{align}
  \vec{a}_n & = \vec{F}\left( \vec{x}_n, \vec{v}_n, t_n \right)/m \\
  \vec{v}_{\mathrm{mid}} & \approx \vec{v}_n + \frac{1}{2}\vec{a}_n \Delta{t}\\
  \vec{x}_{\mathrm{mid}} & \approx \vec{x}_n + \frac{1}{2}\vec{v}_n \Delta{t}\\
  \vec{a}_{\mathrm{mid}} & \approx \vec{F}\left(\vec{x}_{\mathrm mid}, \vec{v}_{\mathrm{mid}}, t+\frac{1}{2}\Delta{t} \right)/m,
\end{align}
$$

so that

$$
\begin{align}
    \vec{v}_{n+1} & \approx \vec{v}_n + \vec{a}_{\mathrm{mid}} \Delta{t},\\
    \vec{x}_{n+1} & \approx \vec{x}_n + \vec{v}_{\mathrm{mid}} \Delta{t}.
\end{align}
$$

Finally we can look at a simpler alternative known as the [*Verlet*
algorithm](https://en.wikipedia.org/wiki/Verlet_integration) that is similar to the familiar
equations of motion for constant acceleration. This uses the acceleration calculated at the end
position to calculate the updated velocity which helps smooth out any changes in the acceleration.
It is given by

$$
\begin{align}
\vec{x}_{n+1} & \approx \vec{x}_n + \vec{v}_n
\Delta{t} + \frac{1}{2}\vec{a}_n \Delta t^2,\\
  \vec{v}_{n+1} & \approx \vec{v}_n + \frac{1}{2} \left( \vec{a}_{n+1} + \vec{a}_n \right)  \Delta{t}.
\end{align}
$$

Clearly in this case we need some way of estimating $\vec{a}_{n+1}$. This can be achieved by using
any of the algorithms/methods mentioned above first and then applying Verlet.

Beyond these algorithms you can also consider higher-order algorithms such as the well-known
[Runge-Kutta](https://en.wikipedia.org/wiki/Runge%E2%80%93Kutta_methods) algorithms, which are very
widely used in physics simulations. The Runge-Kutta algorithms aren't discussed in detail here as it
can be troublesome to correctly turn them into code, but you are welcome to implement them if you
wish. The algorithms listed above are likely to be sufficiently accurate for most projects you are
likely to attempt in this module. In fact, you will probably get acceptable results by just using
the simple Euler-Cromer algorithm.

## Project description

To summarise the above description, the aim of this project is to produce a simulation of a physical
system that evolves with time. An interesting type of system to consider is the motion of multiple
massive bodies interacting under the influence of their gravitational fields, e.g., the Solar
System. This can be built up in stages of increasing complexity:

1. a single massive particle in a static field;
2. a pair of massive particles interacting with each other in one, two and three dimensions;
3. a set of three or more massive particles interacting in three dimensions;
4. supplying initial conditions to the simulation based on masses, positions and velocities of solar system bodies.

To evolve the motion of the particles in the simulation the Euler, Euler-Cromer or other numerical
approximation methods, as discussed above, should be used.

You are free to produce the simulation as you wish, but the two
pre-defined exercises (Final Project Parts 1 and 2 on Moodle) that
are part of the project provide a good starting point (e.g., the
`Particle` class) for expansion to a more fully formed simulation. You
can use results and experimentation with these exercises as part of
your final report.

The simulation you write should come with some tests that show that it works as expected, e.g.,
tests of parts of the code or simple systems against analytical calculations. Useful tests are
checking that the simulation conserves **total** linear momentum or angular momentum to an
acceptable level. The tests should ideally compare simulations produced using more than one
numerical approximation method, with quantitative evaluation of the differences.

The simulation can include additional physics or simulate systems other than the Solar System
provided that you can provide justifiable tests of its validity.

For more information and advice on the code and report, including guideline marking grids make sure
to read the [Marking criteria page](../markinggrid/index.html).

## Solar System ephemerides

If simulating the Solar System you may want to use accurate values to initialise the positions of
the Solar System bodies (known as an ephemeris). You can get these from the online JPL Horizons page
at [https://ssd.jpl.nasa.gov/horizons.cgi](https://ssd.jpl.nasa.gov/horizons.cgi). You will
initially see the following settings:

<div style="font-family:monospace;"}>
&nbsp;&nbsp;&nbsp;Ephemeris Type [change]: <b>OBSERVER</b></br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Target Body [change]: <b>Mars</b> [499]</br>
Observer Location [change]: 	<b>Geocentric</b> [500]</br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Time Span [change]: 	Start=<b>2020-10-28</b>, Stop=<b>2020-11-27</b>, Step=<b>1 d</b></br>
&nbsp;&nbsp;&nbsp;Table Settings [change]: defaults</br>
&nbsp;&nbsp;&nbsp;Display/Output [change]: default (formatted HTML)</br>
</div>

To get information to use for your Solar System body's initial conditions you should do the
following:

* For "Ephemeris Type" click "change" and select the "Vector Table" and click the "Use Selection
  Above" button.
* To change the "Target Body" click "change" and search for the body that you want. Note that you
  can treat the Earth-Moon system as one object by selecting "Earth-Moon Barycenter".
* For "Coordinate Origin" (which will appear when you switch to the "Vector Table" above) leave it
  as "**Solar System Barycenter** (**SSB**) [500@0]". This is the centre of mass of the entire Solar
  System.
* For "Time Span" you can leave it as it is, which will default to today, or click "change" to
  specify a start date, end date and time step between outputs. Make sure to use the same start time
  for all the bodies in your simulation.
* For "Table Settings" click "change", then in the "Select vector table output" drop down menu
  select "Type 2 (state vector {x,y,z,vx,vy,vz})". This means the ephemeris will return the 3d
  position and velocity coordinates of the selected body. In "Optional vector-table settings:"
  select the "output units" you require from the options: "km & km/s" is recommended.
* For "Display/Output" you can either leave this as the default, which will show the information on
  a formatted HTML webpage, or select to download it as a text file.

If you had selected Venus as the object you would get the following information on the webpage:

<table border="1" cellpadding="8" cellspacing="0" bgcolor="#EEEEEE">
<tr>
<td align="left" nowrap>
<pre> Revised: July 31, 2013                 Venus                           299 / 2
 
 PHYSICAL DATA (updated 2020-Oct-19):
  Vol. Mean Radius (km) =  6051.84+-0.01 Density (g/cm^3)      =  5.204
  Mass x10^23 (kg)      =    48.685      Volume (x10^10 km^3)  = 92.843
  Sidereal rot. period  =   243.018484 d Sid. Rot. Rate (rad/s)= -0.00000029924
  Mean solar day        =   116.7490 d   Equ. gravity  m/s^2   =  8.870
  Mom. of Inertia       =     0.33       Core radius (km)      = ~3200
  Geometric Albedo      =     0.65       Potential Love # k2   = ~0.25
  GM (km^3/s^2)         = 324858.592     Equatorial Radius, Re = 6051.893 km
  GM 1-sigma (km^3/s^2) =    +-0.006     Mass ratio (Sun/Venus)= 408523.72
  Atmos. pressure (bar) =  90            Max. angular diam.    =   60.2"
  Mean Temperature (K)  = 735            Visual mag. V(1,0)    =   -4.40
  Obliquity to orbit    = 177.3 deg      Hill's sphere rad.,Rp =  167.1
  Sidereal orb. per., y =   0.61519726   Orbit speed, km/s     =   35.021
  Sidereal orb. per., d = 224.70079922   Escape speed, km/s    =   10.361
                                 Perihelion  Aphelion    Mean
  Solar Constant (W/m^2)         2759         2614       2650
  Maximum Planetary IR (W/m^2)    153         153         153
  Minimum Planetary IR (W/m^2)    153         153         153
</pre>
</td></tr>
</table>

This provides you with the mass of the planet (note that the value of `GM`, which is the
gravitational constant multiplied by the mass, is known more accurately that the mass alone).

This will be followed by:

<table border="1" cellpadding="8" cellspacing="0" bgcolor="#EEEEEE">
<tr>
<td align="left" nowrap>
<pre> 
 
*******************************************************************************
Ephemeris / WWW_USER Wed Oct 28 03:36:54 2020 Pasadena, USA      / Horizons
*******************************************************************************
Target body name: Venus (299)                     {source: DE431mx}
Center body name: Solar System Barycenter (0)     {source: DE431mx}
Center-site name: BODY CENTER
*******************************************************************************
Start time      : A.D. 2020-Oct-28 00:00:00.0000 TDB
Stop  time      : A.D. 2020-Nov-27 00:00:00.0000 TDB
Step-size       : 1440 minutes
*******************************************************************************
Center geodetic : 0.00000000,0.00000000,0.0000000 {E-lon(deg),Lat(deg),Alt(km)}
Center cylindric: 0.00000000,0.00000000,0.0000000 {E-lon(deg),Dxy(km),Dz(km)}
Center radii    : (undefined)                                                  
Output units    : KM-S
Output type     : GEOMETRIC cartesian states
Output format   : 2 (position and velocity)
Reference frame : Ecliptic of J2000.0
*******************************************************************************
JDTDB
   X     Y     Z
   VX    VY    VZ
*******************************************************************************
$$SOE
2459150.500000000 = A.D. 2020-Oct-28 00:00:00.0000 TDB 
 X =-6.534481694069970E+07 Y = 8.684311014650232E+07 Z = 4.909705470917884E+06
 VX=-2.815084272627433E+01 VY=-2.121345485459670E+01 VZ= 1.333142304405859E+00
2459151.500000000 = A.D. 2020-Oct-29 00:00:00.0000 TDB 
 X =-6.775102432791176E+07 Y = 8.497624142281163E+07 Z = 5.022920220211159E+06
 VX=-2.754469579780248E+01 VY=-2.199823147018513E+01 VZ= 1.287394944661386E+00
...
</pre>
</table>

After the header information, each line gives a date and time, first as a [Julian
Date](https://en.wikipedia.org/wiki/Julian_day), then in more familiar format, followed by the X, Y,
and Z positions, and then the VX, VY, VZ velocity components.

You will need to do this for each object that you want in your simulation.

If referencing the JPL Horizons webpage in your report you can use the following citation:

> Giorgini, J. D., Yeomans, D. K., Chamberlin, A. B., Chodas, P. W., Jacobson, R. A., Keesey, M. S., Lieske, J. H.,
Ostro, S. J., Standish, E. M., Wimberly, R. N., "JPL's On-Line Solar System Data Service", Bulletin of the American
Astronomical Society, Vol 28, p. 1099, 1997.

or BibTeX entry:

```latex
@INPROCEEDINGS{1997BAAS...29.1099G,
       author = { {Giorgini}, J.~D. and {Yeomans}, D.~K. and {Chamberlin}, A.~B. and
         {Chodas}, P.~W. and {Jacobson}, R.~A. and {Keesey}, M.~S. and
         {Lieske}, J.~H. and {Ostro}, S.~J. and {Standish}, E.~M. and
         {Wimberly}, R.~N.},
        title = "{JPL's On-Line Solar System Ephemeris and Data Service}",
    booktitle = {Bulletin of the American Astronomical Society},
         year = 1997,
       volume = {28},
        month = sep,
        pages = {1099},
       adsurl = {https://ui.adsabs.harvard.edu/abs/1997BAAS...29.1099G},
      adsnote = {Provided by the SAO/NASA Astrophysics Data System}
}
```

### Solar System ephemeris using Python

There are Python packages that you can use to directly access JPL ephemerides of the Solar System
bodies rather than going through the [JPL Horizons](https://ssd.jpl.nasa.gov/horizons.cgi) website.

To do this you will first need to install several packages. If you are using Anaconda, the
[astropy](https://www.astropy.org/) package should be already install, but if not you can install it
via the _Anaconda Navigator_. After opening _Anaconda Navigator_, in the left-hand border panel
click on "Environments". In the panel containing the search box with "Search Environments" make sure
you are clicked on the "base (root)" environment (this is the environment that VS Code uses by
default). In the furthest right panel, click on the dropdown menu containing "Installed" and select
"All" to see available packages. Then in the "Search Packages" search box type "astropy".
[astropy](https://www.astropy.org/) should be listed as an installable package, so click the check
box next to it and click "Apply" in the bottom right-hand corner. This should install astropy (it
may take a minute or two).

The following additional packages are required, but are not available through the _Anaconda
Navigator_:

* [jplephem](https://github.com/brandon-rhodes/python-jplephem)
* [spiceypy](https://spiceypy.readthedocs.io/en/master/)
* [poliastro](https://docs.poliastro.space/en/stable/)

However, these can be installed within a terminal. Open the _Anaconda Powershell Prompt_ (either via
the _Anaconda Navigator_ or within _VS Code_) and type:

```bash
pip install jplephem spiceypy poliastro
```

First you need to set the time at which you want to generate the solar system body positions. You
need to use an
[`astropy.time.Time`](https://docs.astropy.org/en/stable/api/astropy.time.Time.html#astropy.time.Time)
object:

```python
from astropy.time import Time

# get the time at 5pm on 27th Nov 2019
t = Time("2019-11-27 17:00:00.0", scale="tdb")
```

To get the positions and velocities of a given solar system body you need to use the astropy
[`get_body_barycentric_posvel`](https://docs.astropy.org/en/stable/api/astropy.coordinates.get_body_barycentric_posvel.html#astropy.coordinates.get_body_barycentric_posvel)
function, passing it the time and the name of the body you want to use:

```python
from astropy.coordinates import get_body_barycentric_posvel

# get positions of velocities for the Sun
pos, vel = get_body_barycentric_posvel("sun", t, ephemeris="jpl")
```

Note: The first time you run this it will download an ephemeris file. Subsequently, the file will
not be re-downloaded as it should be locally cached. This file only contains the position of the Sun
and planets (including the Moon and Pluto), but not any other solar system bodies.

The valid body names that you can pass to `get_body_barycentric_posvel` are:

```python
print(solar_system_ephemeris.bodies)
('sun',
 'mercury',
 'venus',
 'earth-moon-barycenter',
 'earth',
 'moon',
 'mars',
 'jupiter',
 'saturn',
 'uranus',
 'neptune',
 'pluto')
```

The positions are velocities are by default output in [equatorial
coordinates](https://en.wikipedia.org/wiki/Equatorial_coordinate_system), but a more useful
representation (and that given by default in JPL Horizons) is in the [ecliptic
coordinate](https://en.wikipedia.org/wiki/Ecliptic_coordinate_system) frame. To convert to this
frame you can use functions from spiceypy:

```python
from spiceypy import sxform, mxvg

# make a "state vector" of positions and velocities (in metres and metres/second, respectively)
statevec = [
    pos.xyz[0].to("m").value,
    pos.xyz[1].to("m").value,
    pos.xyz[2].to("m").value,
    vel.xyz[0].to("m/s").value,
    vel.xyz[1].to("m/s").value,
    vel.xyz[2].to("m/s").value,
]

# get transformation matrix to the ecliptic (use time in Julian Days)
trans = sxform("J2000", "ECLIPJ2000", t.jd)

# transform state vector to ecliptic
statevececl = mxvg(trans, statevec, 6, 6)

# get positions and velocities
position = [statevececl[0], statevececl[1], statevececl[2]]
velocity = [statevececl[3], statevececl[4], statevececl[5]]
```

You can get planetary masses by using the poliastro package:

```python
from poliastro import constants
from astropy.constants import G  # Newton's gravitational constant

# Sun mass (converting to kg)
msun = (constants.GM_sun / G).value

# Earth mass
mearth = (constants.GM_earth / G).value 
```
You can use these to create a `Particle` (or equivalent) object.

If using astropy the appropriate citations for your report are given
[here](https://www.astropy.org/acknowledging.html#acknowledging-or-citing-astropy). For the
[jplephem](https://github.com/brandon-rhodes/python-jplephem),
[poliastro](https://docs.poliastro.space/en/stable/index.html) and
[spiceypy](https://spiceypy.readthedocs.io/en/master/index.html) packages you can cite their
associated webpages.

#### More advanced!

Say you wanted the positions of Jupiter's moons, you could download the appropriate ephemeris file
and get them:

```python
# URL of a file containing Jupiter ephemeris - this is a 1.2 Gb file!
JUPEPH = "https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/satellites/jup310.bsp"  

# get Io (see https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/satellites/aa_summaries.txt for kernel numbers)
body = [(0, 5), (5, 501)]  # kernel chain going from SSB->Jupiter barycentre then Jupiter barycentre -> Io

pos, vel = get_body_barycentric_posvel(body, t, ephemeris=JUPEPH)
```

You can search around for ephemeris files of other solar system bodies (comets, asteroids, moons of
the outer planets) at the webpage [here](https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/).

## Frequently asked questions

Here are a selection of common issues and potential things to check to resolve them:

> My simulation flies apart or objects rush together. Why?

There are a few things to check if your simulation is "exploding" or "imploding":

* check that your acceleration vectors are pointing in the correct direction (e.g., have you
  accidentally made gravity repulsive?)
* check that your initial conditions (position, velocity, mass) are in consistent units and also are
  consistent with the units of your value of the gravitational constant. E.g., if your velocities
  are in $\text{km}\,\text{hr}^{-1}$, but $G$ is in $\text{N}\,\text{m}^2\,\text{kg}^{-2}$ your system
  will not work.
* check all your initial conditions. Have you remembered to include the Sun!?

> My Sun is making cycloids (semi-circles). Why?

This is normal if you have initialised the Sun at the exact centre of your system. You may want to
work with coordinates referenced to the solar system barycentre.

> My simulation isn't very stable, and planets seem to wander. Why?

There are a few things to check in this case:

* check your initial conditions. Do you use consistent units for all planets? Have you made
  copy-paste errors for some planets?
* check your simulation time steps. For the inner planets if your time step is too large the
  numerical approximation will accumulate errors and the simulation may drift. You can study this as
  part of your project!
* think about whether your initial conditions are reasonable, e.g., don't start all the planets in a
  line!
* check that the simulation respects Newton's third law.

> My momentum doesn't appear to be conserved. Why?

Firstly, check that you are calculating the correct thing. You need to calculate the total linear
momentum of all objects, but you must sum their individual linear momentum **vectors** before taking
the magnitude rather than summing their individual magnitudes.

You will most likely find that you still have a large number for the total linear momentum rather
than zero. Check whether the values you get really are that large in a relative sense compared to
those for individual bodies. Your simulation will not be perfect (it uses numerical approximations
after all), and if there are features (e.g., sinusoidal periodicities) in your data you can think
about explanations and include that in your report.

> My simulation is broken. Why?

In addition to the checks above, there are a few further things that you can check:

* read through your code and make sure you understand what each line is suppose to be doing. This
  can help you spot bugs;
* check that accelerations of objects are being summed together correctly and that the acceleration
  is reinitialised to zero on each iteration (acceleration just depends on the current position and
  not any previous values);
* check the indices in any for loops are being applied to the correct object, e.g., if calculating
  the acceleration on object A caused by object B, make sure to use the mass for object B;
* make sure to not calculate the acceleration of an object caused by itself. The separation will be
  zero, so you may end up getting infinities!

A good way to find causes of why your simulation is broken is to simplify it until you can get it
working and then build it back up bit by bit. If it is not working for 3-bodies in 3d then check if
a two body system works or not.

> My simulation does not precisely match the JPL ephemerides. Why?

The JPL ephemerides will use numerical methods and computational resources beyond those mentioned in
this course. They also include all the Solar System bodies (all planets, minor planets, significant
asteroids) and general relativistic effects. Therefore, you should not expect to precisely match the
JPL ephemerides. However, studying the differences and discussing their potential causes may be
interesting material for your report.
