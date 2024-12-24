# Two-Story-Building-Free-Vibration-Simulation

This MATLAB code simulates the free vibration of a two-story building modeled with coupled second-order differential equations. It uses Euler’s Method (EM), Improved Euler’s Method (IEM), and an analytical solution to compute and compare the displacements of the building’s floors over time.

## Problem Statement

The behavior of the two-story building is governed by the following coupled second-order differential equations:


m1 x1'' = -k1 x1 - k2 (x1 - x2)

m2 x2'' = -k2 (x2 - x1)


### Parameters

The physical parameters of the system are:

- **Spring stiffness**: \( k1 = k2 = 4.66 \ kN/mm)
- **Mass of the first floor**: \( m1 = 0.0917 \)
- **Mass of the second floor**: \( m2 = 0.0765 \)

### Initial Conditions

-  x1(0) = 100 , x2(0) = 50 
-  x1'(0) = 0, x2'(0) = 0 

### Goal

Simulate the behavior of the system over the interval \( t in [0, 10] \) using the following approaches:

1. Analytical solution for the given parameters.
2. Numerical solutions using:
   - Euler's Method (EM)
   - Improved Euler's Method (IEM)

---

## State-Space Representation

The coupled second-order ODEs are converted into a system of first-order ODEs using the state vector \( Z \):

\[
Z = \begin{bmatrix}
x_1(t) \\
x_1'(t) \\
x_2(t) \\
x_2'(t)
\end{bmatrix}, \quad
Z' = AZ
\]

where the system matrix \( A \) is:

\[
A = \begin{bmatrix}
0 & 1 & 0 & 0 \\
-{k1}{m1} & 0 & \frac{k_2}{m_1} & 0 \\
0 & 0 & 0 & 1 \\
\frac{k_2}{m_2} & 0 & -\frac{k_2}{m_2} & 0
\end{bmatrix}
\]

---

## MATLAB Implementation

### Features

1. **Numerical Methods**:
   - Euler's Method (EM)
   - Improved Euler's Method (IEM)
2. **Comparison with Analytical Solution**.
3. **Plots**:
   - Solutions from EM, IEM, and analytical methods.
   - Different numbers of time steps (\( N = 45, 55, 75, 100, 250 \)).

### MATLAB Code

The repository includes:
1. `EMsolver`: Solves the system using Euler's Method.
2. `IEMsolver`: Solves the system using Improved Euler's Method.
3. `analytical`: Computes the analytical solution.

---

## How to Use

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/two-story-vibration.git

2. Open the MATLAB script in the repository.
3. Execute the script to:
   
	•	Compute the solutions using EM, IEM, and analytical approaches.

	•	Plot the results for different time step values.


