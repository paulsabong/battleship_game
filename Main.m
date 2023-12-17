function Main(src,~)
%{
Based on user input via button click in main menu, call back user button to
indicate whether user starts or exits the game; executes game logic. 

1. 
    If user clicked on button 'Start', start game depending on game mode:
    'Easy Mode', 'Hard Mode', and 'Training Mode'. Then, execute game logic while the game is not over. 
2. 
    If user clicked on button 'How To Play', display figure with textbox
    containing the game instructions.
3. 
    If user clicked on button 'Exit Game', exit MATLAB program.
%}

global endGame
global numShip
global numShipDestroyed
global shotsRem
global trainingMode

if strcmp(src.String, 'Start') % Compare callback button with string 'Start' to check if button clicked is 'Start'

    % Play click sound effect
    [ySound,sampleFreq] = audioread('ClickSoundEffect.mp3');
    sound(ySound(5000:52000)*2, sampleFreq);

    close(gcf); % Close figure

    % Display How To Play Figure
    GameMode = figure('Units', 'normalized','Name', 'Game Mode', 'Position', [0.1, 0.1, 0.8, 0.8], 'Color', 'black', 'WindowState','fullscreen'); % Format figure position
    Heading = axes('Parent', GameMode,'Units', 'normalized','Position', [0.45, 0.8, 0.1, 0.1],'Color','black'); % Format figure heading
    axis off
    title(Heading, 'Select Game Mode','Color','#00db00','FontSize',20,'FontWeight','bold','FontName','Stencil') % Customize figure heading
    hold on

    %%% Game Mode Options

    % Easy Mode button
    EasyMode = uicontrol('Style', 'pushbutton', 'String', 'Easy Mode' , 'Units', 'normalized', ...
        'Position', [0.45,0.65,0.1,0.1], 'ForegroundColor','#00db00', 'BackgroundColor','#808080', 'FontName', 'Engravers MT');

    % Hard Mode button
    HardMode = uicontrol('Style', 'pushbutton', 'String', 'Hard Mode' , 'Units', 'normalized', ...
        'Position', [0.45,0.5,0.1,0.1], 'ForegroundColor','#00db00', 'BackgroundColor','#808080', 'FontName', 'Engravers MT');

    % Training Mode button
    TrainingMode = uicontrol('Style', 'pushbutton', 'String', 'Training Mode' , 'Units', 'normalized', ...
        'Position', [0.45,0.35,0.1,0.1], 'ForegroundColor','#00db00', 'BackgroundColor','#808080', 'FontName', 'Engravers MT');

    % Display button to return to Main Menu
    Back = uicontrol('Style', 'pushbutton', 'String', 'Back' , 'Units', 'normalized', ...
        'Position', [0.45,0.2,0.1,0.1], 'ForegroundColor','#00db00', 'BackgroundColor','#808080', 'FontName', 'Engravers MT');

    shg; % Display Figure in front of screen

    % Set Callback for EasyMode, HardMode, TraninngMode, and Back variable
    set(EasyMode, 'Callback', @(src, event) Main(src, event))
    set(HardMode, 'Callback', @(src, event) Main(src, event));
    set(TrainingMode, 'Callback', @(src, event) Main(src, event));
    set(Back, 'Callback', @(src, event) Main(src, event));

elseif strcmp(src.String, 'Easy Mode') % Compare callback button with string 'Easy Mode' to check if button clicked is 'Easy Mode'

    % Play click sound effect
    [ySound,sampleFreq] = audioread('ClickSoundEffect.mp3');
    sound(ySound(5000:52000)*2, sampleFreq);

    close(gcf); % Close figure

    %%% Execute Game Logic
    fprintf('______________________________________________________') % Print format
    fprintf('\nWelcome to BattleShipped Easy Mode!') % Print format welcome
    fprintf('\nYou have 50 shots to take down all 5 ships. Good luck!') % Print format game instruction
    fprintf('\n______________________________________________________') % Print format

    fprintf('\n\n====================') % Print format
    fprintf('\nGame has Started') % Print format to indicate game has started
    fprintf('\n====================\n\n') % Print format

    generateGridWithShips() % Call generateGridWithShips function to generate random ship positions

    % Loop until game is over
    while endGame == false
        createGridWithLabels() % Call createGridWithLabels function to create grid
        fprintf('\nThere are %0.0f ships left on the board.\n',(numShip-numShipDestroyed)) % Print message to user indicating the number of ships left
        fprintf('You have %0.0f shots left.', shotsRem) % Print message to user indicating the number of shots left
        attemptUserShot() % Call attemptUserShot function to check user input coordinate
        fprintf('\n') % Print new line
        checkEndGame() % Call checkEndGame function to check if the game is over
    end

elseif strcmp(src.String, 'Hard Mode') % Compare callback button with string 'Hard Mode' to check if button clicked is 'Hard Mode'

    numShip = 7; % Update numShip vargiable to 7 ships
    shotsRem = 60; % Update shotsRem to 100 shots remaining

    % Play click sound effect
    [ySound,sampleFreq] = audioread('ClickSoundEffect.mp3');
    sound(ySound(5000:52000)*2, sampleFreq);

    close(gcf); % Close figure

    %%% Execute Game Logic
    fprintf('______________________________________________________') % Print format
    fprintf('\nWelcome to BattleShipped Hard Mode!') % Print format welcome
    fprintf('\nYou have 60 shots to take down all 7 ships. Good luck!') % Print format game instruction
    fprintf('\n______________________________________________________') % Print format

    fprintf('\n\n====================') % Print format
    fprintf('\nGame has Started') % Print format to indicate game has started
    fprintf('\n====================\n\n') % Print format

    generateGridWithShips() % Call generateGridWithShips function to generate random ship positions

    % Loop until game is over
    while endGame == false
        createGridWithLabels() % Call createGridWithLabels function to create grid
        fprintf('\nThere are %0.0f ships left on the board.\n',(numShip-numShipDestroyed)) % Print message to user indicating the number of ships left
        fprintf('You have %0.0f shots left.', shotsRem) % Print message to user indicating the number of shots left
        attemptUserShot() % Call attemptUserShot function to check user input coordinate
        fprintf('\n') % Print new line
        checkEndGame() % Call checkEndGame function to check if the game is over
    end

elseif strcmp(src.String, 'Training Mode')

    trainingMode = true; % Update trainingMode variable to true
    numShip = 10; % Update numShip vargiable to 10 ships
    shotsRem = 1000; % Update shotsRem to 1000 shots remaining

    [ySound,sampleFreq] = audioread('ClickSoundEffect.mp3');
    sound(ySound(5000:52000)*2, sampleFreq);

    close(gcf); % Close figure

    %%% Execute Game Logic
    fprintf('______________________________________________________') % Print format
    fprintf('\nWelcome to BattleShipped Training Mode!') % Print format welcome
    fprintf('\nPractice your shooting skills against 10 ships!') % Print format game instruction
    fprintf('\n______________________________________________________') % Print format

    fprintf('\n\n====================') % Print format
    fprintf('\nGame has Started') % Print format to indicate game has started
    fprintf('\n====================\n\n') % Print format

    generateGridWithShips() % Call generateGridWithShips function to generate random ship positions

    % Loop until game is over
    while endGame == false
        createGridWithLabels() % Call createGridWithLabels function to create grid
        fprintf('\nThere are %0.0f ships left on the board.\n',(numShip-numShipDestroyed)) % Print message to user indicating the number of ships left
        fprintf('You have %0.0f shots left.', shotsRem) % Print message to user indicating the number of shots left
        attemptUserShot() % Call attemptUserShot function to check user input coordinate
        fprintf('\n') % Print new line
        checkEndGame() % Call checkEndGame function to check if the game is over
    end


elseif strcmp(src.String, 'How To Play') % Compare callback button with string 'How To Play' to check if button clicked is 'How To Play'

    % Play click sound effect
    [ySound,sampleFreq] = audioread('ClickSoundEffect.mp3');
    sound(ySound(5000:52000)*2, sampleFreq);

    close(gcf); % Close figure

    % Display How To Play Figure
    HowToPlay = figure('Units', 'normalized','Name', 'How To Play', 'Position', [0.1, 0.1, 0.8, 0.8], 'Color', 'black', 'WindowState','fullscreen'); % Format figure position
    Heading = axes('Parent', HowToPlay,'Units', 'normalized','Position', [0.45, 0.8, 0.1, 0.1],'Color','black'); % Format figure heading
    axis off
    title(Heading, 'How To Play','Color','#00db00','FontSize',20,'FontWeight','bold','FontName','Stencil') % Customize figure heading
    hold on

    % Display and set callback for button to return to Main Menu
    Back = uicontrol('Style', 'pushbutton', 'String', 'Back' , 'Units', 'normalized', ...
        'Position', [0.45,0.05,0.1,0.1], 'ForegroundColor','#00db00', 'BackgroundColor','#808080', 'FontName', 'Engravers MT');
    set(Back, 'Callback', @(src, event) Main(src, event));

    % Create the instructions
    instructionsText = sprintf(['A 10 x 10 grid will contain a specific number of ships.' ...
        '\n\nYou get a limited amount of shots to take down all the ships.' ...
        '\n\nYou can enter a coordinate, for example, B7, to shoot.' ...
        '\n\nYour shot will display on the grid. A symbol (view Legend) will be represented to indicate a hit or miss.' ...
        '\n\nIf all ships are down before or after your last shot, you win!' ...
        '\n\nYou can play up to three different game modes:' ...
        '\nEasy Mode: You have 50 shots to destroy 5 ships.' ...
        '\nHard Mode: You have 60 shots to destroy 7 ships.' ...
        '\nTraining Mode: You have 1000 shots to destroy 10 ships. Ship locations will be revealed.' ...
        '\n\nLegend' ...
        '\n~~~~' ...
        '\n'' . ''    =  water' ...
        '\n'' # ''  =  missed shot' ...
        '\n'' X ''  =  part of the ship was hit' ...
        '\n'' O ''  =  part of the ship''s location [Training Mode]']);

    % Create textbox to display the instructions
    annotation('textbox', [0.1, 0.05, 0.8, 0.8], 'String', instructionsText, 'Color','#00db00', ...
        'FontSize', 15, 'FontName','Centaur', 'HorizontalAlignment', 'left', 'LineStyle', 'none');

    shg; % Display Figure in front of screen

elseif strcmp(src.String, 'Back') % Compare callback button with string 'Back' to check if button clicked is 'Back'

    % Play click sound effect
    [ySound,sampleFreq] = audioread('ClickSoundEffect.mp3');
    sound(ySound(5000:52000)*2, sampleFreq);

    close(gcf); % Close figure

    %%% Return to Main Menu

    % Display Figure
    topFigure = figure('Units', 'normalized','Name', 'Battleshipped', 'Position', [0.1, 0.1, 0.8, 0.8], 'Color', 'black', 'WindowState','fullscreen'); % Format figure position
    Heading = axes('Parent',topFigure,'Units', 'normalized','Position', [0.45, 0.8, 0.1, 0.1],'Color','black'); % Format figure heading
    axis off
    title(Heading, 'BATTLESHIPPED','Color','#00db00','FontSize',20,'FontWeight','bold','FontName','Stencil') % Customize figure heading
    hold on

    %%% Menu Options

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

    % Set Callback for Start, How To Play and Exit button
    set(Start, 'Callback', @(src, event) Main(src, event));
    set(HowToPlay, 'Callback', @(src, event) Main(src, event));
    set(Exit, 'Callback', @(src, event) Main(src, event));

elseif strcmp(src.String, 'Exit Game') % Compare callback button with string 'Exit Game' to check if button clicked is 'Exit Game'

    % Play click sound effect
    [ySound,sampleFreq] = audioread('ClickSoundEffect.mp3');
    sound(ySound(5000:52000)*2, sampleFreq);

    close(gcf); % Close figure

    exit; % Exit MATLAB program
end

end