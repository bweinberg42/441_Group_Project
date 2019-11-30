% Script to initialize global parameters/formatting for ENAE 404
% Inludes things like fundamental constants, planetary radii, etc.

% Formatting
format long g
clc
clear all 

% Fundamental Constants
c = 3e5; % km/s

% Gravitational Parameters
mu_earth = 3.986e5; % km^3 / s^2
mu_mars = 4.305e4; % km^3/s^2
mu_saturn = 3.7931187e7; % km^3/s^2
mu_moon = 0.00490e6; % km^3/s^2 (nssdc.gsfc.nasa.gov/planetary/factsheet/moonfact.html)
mu_jupiter = 126.687e6; % km^2/s^2 (nssdc.gsfc.nasa.gov/planetary/factsheet/jupiterfact.html)
mu_mercury = 0.022032e6; % km^2/s^2 (https://nssdc.gsfc.nasa.gov/planetary/factsheet/mercuryfact.html)
mu_sun = 132712e6; % km^2/s^2 (https://nssdc.gsfc.nasa.gov/planetary/factsheet/sunfact.html)

% Radii
r_earth = 6378; % km
r_moon = 1738.1; % km (nssdc.gsfc.nasa.gov/planetary/factsheet/moonfact.html)
r_jupiter = 71492; % km (nssdc.gsfc.nasa.gov/planetary/factsheet/jupiterfact.html)
r_mercury = 2439.7; % km (https://nssdc.gsfc.nasa.gov/planetary/factsheet/mercuryfact.html)
r_mars = 3396.2; % km (https://nssdc.gsfc.nasa.gov/planetary/factsheet/marsfact.html)
r_geo = 42164; % km

% Semi-major axes
a_mercury = 57.91e6; % km (https://nssdc.gsfc.nasa.gov/planetary/factsheet/mercuryfact.html)
a_earth = 149.6e6; % km (https://nssdc.gsfc.nasa.gov/planetary/factsheet/earthfact.html)
a_jupiter = 778.57e6; % km (nssdc.gsfc.nasa.gov/planetary/factsheet/jupiterfact.html)

% Mass
m_mercury = 0.33011e24;% kg (https://nssdc.gsfc.nasa.gov/planetary/factsheet/mercuryfact.html)
m_jupiter = 1898.19e24; % kg (nssdc.gsfc.nasa.gov/planetary/factsheet/jupiterfact.html)
m_sun = 1988500e24; % kg (nssdc.gsfc.nasa.gov/planetary/factsheet/sunfact.html)

% Gravitational Parameters
g_earth = 9.798e-3; % km/s (https://nssdc.gsfc.nasa.gov/planetary/factsheet/earthfact.html)