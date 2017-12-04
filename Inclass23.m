
%GB comments
1 100 
2 100
3 100 
4 100
overall 100


%In this directory, you will find a derivaitve function representing a
%three gene circuit in which each gene product represses the transcription of another
%gene in a cycle. This simple three gene circuit displays oscillations and was one
%of the first synthetic circuits ever constructed (see Elowitz & Leibler
%Nature 2000). 

% 1. Start with initial conditions x(1) = 1, x(2) = x(3) = 0. 
% Run the model for 200 time units and plot the result. verify that it
% does indeed oscillate. 

% Define initial condition
x0 = [1; 0; 0];

% Run for 200 time units
sol1 = ode23(@repressilator, [0 200], x0);

% Plot result
figure
plot(sol1.x, sol1.y(1,:), 'r-')
hold on
plot(sol1.x, sol1.y(2,:), 'k-')
hold on
plot(sol1.x, sol1.y(3,:), 'b-')
legend('Repressor 1', 'Repressor 2', 'Repressor 3', 'Location', 'Best')
title('Oscillation of Repressor Profiles')
ylabel('Repressor Gene')
xlabel('Time')

% 2. What happens if you start with initial conditions x(1) = x(2) = x(3) =
% 0.5? Why?

% Define initial condition
x0 = [0.5; 0.5; 0.5];

% Run for 200 time units
sol1 = ode23(@repressilator, [0 200], x0);

% Plot result
figure
plot(sol1.x, sol1.y(1,:), 'r-')
hold on
plot(sol1.x, sol1.y(2,:), 'k-')
hold on
plot(sol1.x, sol1.y(3,:), 'b-')
legend('Repressor 1', 'Repressor 2', 'Repressor 3', 'Location', 'Best')
title('Oscillation of Repressor Profiles')
ylabel('Repressor Gene')
xlabel('Time')

% All repressors have equal expression at any given time point, and each
% profile approaches a steady state value > 0, but < x0. This is because no
% one repressor starts any higher than another, so no repressors can be
% over-repressed. Each gene regulates its repressed gene in the same way.
% They all have the same slight oscillation around the steady state value
% due to the difficulty of landing directly on the steady state value by
% the ode23 solver.

% 3. The strength of the repression is governed by the constant k2 which is
% the same for all the genes. What happens when you make k2 larger or
% smaller? Find the approximate value of k2 for which the system no longer
% oscillates. 

% Increasing k2 brings the oscillation down to lower x values. The genes
% oscillate around a lower value, because they are further repressed by
% each other.
% Decreasing k2, conversely, brings the oscillation up to higher x values.
% The genes oscillate around higher values.

% When k2 is decreased down to 1, the system no longer oscillates, and
% reaches a steady state of about x(:) = 0.55.

% 4. What happens when you make k2 larger or smaller for only one of the
% genes? 

% Shifting only one k2 value will shift down the oscillation of the
% repressing gene and will shift up the oscillation of the gene repressed
% by the altered gene, if k2 is increased. The opposite will happen if k2
% is decreased.

% This is because if k2 is increased for one gene, the repressing gene can
% accomplish the same repression at lower expression, so it will trend
% towards a lower steady state. This causes the gene that represses the
% repressing gene to show higher expression in order to drive down the
% expression of the repressing gene.

% This is all a bit confusing wording. If x1 has a larger k2, less x3 is
% needed to repress x1 the same amount, so x3 will trend towards a lower
% steady state. If x3 is to be expressed less, more x2 will be needed to
% accomplish this repression. Therefore, x2 will oscillate higher than x1,
% which will oscillate higher than x3. Hopefully this wording is easier.

