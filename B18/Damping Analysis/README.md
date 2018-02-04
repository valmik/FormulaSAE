These are the scripts I used for axle excitation analysis for B18. We needed to find whether the carbon axles we planned to use would react to engine shock loading better than the steel axles for which we had on-car test data. Therefore, we put steel and carbon axles on a static torque fixture and dropped weights on the other end to produce a torque shock. I analyzed the step response gained from strain gauge data to find the damping coefficients of both materials, and ultimately their percent overshoot to a step response.

DampingAnalysis.m was my exploration script. I tried using peak ratios, second order transient respnse equations, and nonlinear least squares to find the stiffness, damping, and inertial coefficients. I eventually realized that the initial conditions were very significant, so I calculated the transient equation with initial position and velocity equations (I wrote it down in LaplaceTransform.pdf for the junior members to understand). I finally used nonlinear regression on the transient equation with initial conditions.

DampingAnalysis_func.m, and get_cmk.m were functions that I called in DampingAnalysis_script.m to iterate through tests and plot everything I needed.