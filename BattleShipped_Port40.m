clc; clear all; close all; 

%{
==============
BATTLESHIPPED
<Sink or Swim>
==============
%}

% Global Variable Declaration

global alphabet; alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'; % Variable for alphabet
global shotsRem; shotsRem = 50; % Variable for shots remaining
global endGame; endGame= false; % % Variable for ending game
global grid; grid = {}; % Variable for grid
global gridSize; gridSize = 10; % Variable for grid size
global numShip; numShip = 5; % Variable for number of ships to place
global numShipDestroyed; numShipDestroyed = 0; % Variable for number of ships destroyed
global shipPos; shipPos = []; % Variable for ship positions
global trainingMode; trainingMode = false; % Variable for training mode to reveal ship positions


%%%%%%%%
% MENU %
%%%%%%%%

% Display Figure
topFigure = figure('Units', 'normalized','Name', 'Battleshipped', 'Position', [0.1, 0.1, 0.8, 0.8], 'Color', 'black', 'WindowState','fullscreen'); % Format figure position
Heading = axes('Parent',topFigure,'Units', 'normalized','Position', [0.45, 0.8, 0.1, 0.1],'Color','black'); % Format figure heading
axis off % Remove axis
title(Heading, 'BATTLESHIPPED','Color','#00db00','FontSize',20,'FontWeight','bold','FontName','Stencil') % Customize figure heading
hold on


%%% Menu Options %%%

% Start button
Start = uicontrol('Style', 'pushbutton', 'String', 'Start' , 'Units', 'normalized', ...
    'Position', [0.45,0.65,0.1,0.1], 'ForegroundColor','#00db00', 'BackgroundColor','#808080', 'FontName', 'Engravers MT');

% How To Play button
HowToPlay = uicontrol('Style', 'pushbutton', 'String', 'How To Play' , 'Units', 'normalized', ...
    'Position', [0.45,0.5,0.1,0.1], 'ForegroundColor','#00db00', 'BackgroundColor','#808080', 'FontName', 'Engravers MT');

% Exit button
Exit = uicontrol('Style', 'pushbutton', 'String', 'Exit Game' , 'Units', 'normalized', ...
    'Position', [0.45,0.35,0.1,0.1], 'ForegroundColor','#00db00', 'BackgroundColor','#808080', 'FontName', 'Engravers MT');

shg; % Display Figure in front of screen

% Set Callback for Start, HowToPlay and Exit variable
set(Start, 'Callback', @(src, event) Main(src, event))
set(HowToPlay, 'Callback', @(src, event) Main(src, event));
set(Exit, 'Callback', @(src, event) Main(src, event));









