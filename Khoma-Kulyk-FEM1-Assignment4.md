---
title: FEM1 Assignment 4, Resonance frequency
author:
    - Paul Kulyk
    - Oleksiy Khoma
date: April 10, 2017
---

\maketitle

#Theoretical resonance frequency

According to the assignment, we had to define first resonance frequency for our beam. Thus, we had to consider coefficient $\alpha_0=1.875.$
And according to the formula for a resonance frequency we calculated:
$$\frac{1}{2\pi\sqrt{12}}\alpha_0^2\sqrt{\frac{E}{\rho}}\frac{h}{L^2}\approx21.4507...$$

#Frequency mode

For our frequency mode simulation we created three models with different size of meshes:

![Robust mesh, approximal size of seed 0.005](\fem1_assignment4\Results\quad_full_robust_mesh.png)

![Medium mesh, approximal size of seed 0.001](\fem1_assignment4\Results\quad_full_medium_mesh.png)

![Medium mesh, approximal size of seed 0.001](\fem1_assignment4\Results\quad_full_medium_mesh.png)

Also, for this mode we tried different types of integration: linear full and reduced, as well as quadratic full and reduced.
By this we wanted to see the influence of mesh AND type of integration.
For this mode, our results could be organised like this:

|Type of integration:|Linear reduced|Linear full|Quadratic reduced|Quadratic full|
|----|----|----|----|----|
|Size of mesh:| | | | |
|Robsut| - | - |21.463|21.472|
|Medium| - |22.361|21.455|21.455|
|Fine|21.020|21.661|21.453|21.453|

From this, it can clearly be seen that generaly, we get quite close results. For this mode, making the size of mesh smaller, does not really influence the final result.
However, the method of integration definitely changes it. Nevertheless, we would choose quatratic method without doubt and reduced integration to reduce time needed for simulation.


#Impulse based analysis

To  have a clear comparison of different modes, we decided to use the same three meshes as for frequency mode.
The obvious disadvantage of this method which we expectedly faced, is the time of simulation.
For the fine mesh, simulation takes approximately 5 minutes, which is absolutely unexeptable for this type of problems.

![Robust mesh, approximal size of seed 0.005](\fem1_assignment4\Results\explicit_linear_robust_mesh.png) ![Spectrum for robust mesh](\fem1_assignment4\Results\explicit_linear_robust.jpg)

![Medium mesh, approximal size of seed 0.001](\fem1_assignment4\Results\explicit_medium_mesh.png) ![Spectrum for medium mesh](\fem1_assignment4\Results\explicit_linear_medium.jpg)

![Medium mesh, approximal size of seed 0.001](\fem1_assignment4\Results\explicit_medium_mesh.png) ![Spectrum for fine mesh](\fem1_assignment4\Results\explicit_linear_fine.jpg)


|Size of mesh:|Robsut|Medium|Fine|
|----|----|----|----|
| |19|19|21|

The other disadvantage is that we get quite unprecise results.
This conclusion could be explained by two effects, which basicaly are connected with each other. 
First of all, we use quite a finite time step, for our simulation, which creates step like oscilation graph. 
The other thing is that we are using MATLAB function fft() which represents Fast Fourier Transform. 
One can find that this is very efficient type to compute discrete fourier transform. 
However, this type of fourier transform of course produces rounding errors, which also influences results heavily.


#Conclusions

For finding the eigenfrequncy of simple beams, we can clearly say, that Abaqus frequency mode is definitely prefered.
It is faster, it gives better results, and it is not so mesh depended as explicit method.
To achieve results as close as possible to theoretically calculated, of course finer meshes are prefered.
However, in case of problems which might consume more time with fine meshes, more robust could be used.