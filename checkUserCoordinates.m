function [validInputRow, validInputCol] = checkUserCoordinates()
%{
Check if user input for coordinates are valid. If so, return the user input as userRow and userCol. 

1. 
    Ask user to enter coordinates userInput as string

2. 
    Initialize userInputVerify to ‘false’

3. 
    While user input is false, keep asking for user input
        --------------
        Error Handling
        --------------
        a. If the char string is only 1 character or greater than 3
        characters, ask user to input again, else set input to char
        array, parse the row and col position, and set col to double
        b. If the row and col of the coordinates is not alphabetical or a numerical whole number respectively, print error message, continue and reiterate 
        c. If userCol is less than 1 or greater than the size of grid, print error, continue and reiterate.
        d. If at userRow and userCol position on grid is '#' or  'X' (to indicate a shot has occurred), print error, continue, and reiterate
        e. If at userRow and userCol position on grid is '.' or 'O' (to indicate position has not been shot), assign userInputVerify to 'true'
        f. Return userRowIndex (must evaluate position as numeric) and userCol 
%}

global alphabet
global grid

userInput = input('\nEnter coordinates (for example: B10):\n=> ', 's'); % Ask user input

userInputVerify = false; % Initialize variable that varifies user input to false

% Loop until user enters legal coordinate
while userInputVerify == false % Loop while userInputVerify variable is false 

    % Error if user enters less than two characters or more than 3 characters
    if numel(userInput) < 2 || numel(userInput) > 3
        userInput = input('\nError: Please re-enter the right coordinates (for example, B10):\n=> ', 's'); % Ask user input
        continue; % Skip the rest of code and reiterate while loop
    else
        userInput = upper(char(userInput)); % Convert userInput to char array with uppercase elements 
        userRow = userInput(1); % Extract row position from user input

        % Extract col position from user input and convert it to a double. 
        % Displays NaN if char element is not numerical. 
        userCol = str2double(userInput(2:end)); 

    end

    % Error if user entered a row value that is not alphabet within the
    % range of the grid, or if user entered a col value that is not
    % numerical and is not a whole number
    if ismember(userRow,alphabet) == 0 || (isnan(userCol) && ~(userCol == floor(userCol)))
        userInput = input('\nError: Please re-enter the right coordinates (for example, B10) within the grid:\n=> ','s'); %Ask user input
        continue;  % Skip the rest of code and reiterate while loop
    end

    % Error if col value is less than one or greater than the size of grid
    if userCol < 1 || userCol > size(grid,2)
        userInput = input('\nError: Coordinates must be within grid. Please re-enter the right coordinates (for example, B10):\n=> ','s'); % Ask user input
        continue;  % Skip the rest of code and reiteration while loop
    end

    userRowIndex = find(alphabet == userRow); % Find index value of userRow from alphabet

    % Error if the coordinate in the grid has been inputed prior; a shot
    % has been detected
    if grid{userRowIndex,userCol} == '#' ||  grid{userRowIndex,userCol} == 'X'
        userInput = input('\nError: A shot has occured there before. Please re-enter the right coordinates (for example, B10):\n=> ','s'); % Ask user input
        continue;  % Skip the rest of code and reiterate while loop
    end

    % Indicate user entered a legal coordinate if coordinate in the
    % grid has not been requested prior; a shot was not detected
    if grid{userRowIndex,userCol} == '.' ||  grid{userRowIndex,userCol} == 'O'
        userInputVerify = true; % Assign logical value 'true' to userInputVerify
        clc; % Clear command window

        % Play shot sound effect
        [ySound,sampleFreq] = audioread('ShotSoundEffect.wav');
        sound(ySound(99900:179000)*1.2, sampleFreq);
    end
end

% Return userRowIndex and userCol
validInputRow = userRowIndex;
validInputCol = userCol;

end








