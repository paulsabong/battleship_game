function attemptUserShot()
%{
Update the grid, accounting for the user input coordinate and indicating, by print, whether input was a hit ‘X’ or miss ‘#’

1. 
    Call checkUserCoordinates function to request and return user input row validInputRow and column validInputCol.
2. 
    Check the coordinates position in the grid, to see if the shot was a hit or miss.
        a. If empty, replace grid position with '#'. Print message to indicate user that shot was a miss
        b. If hit ship, replace grid position with'X'. Increment number of ships destroyed variable numShipPrint message to indicate user that shot was a hit on ship
3. 
    Decrement shots remaining variable shotsRem by 1

%}

global grid
global numShipDestroyed 
global shotsRem 

[validInputRow, validInputCol] = checkUserCoordinates();

fprintf('\n==============================') % Print format

% If user input coordinates is empty '.' in grid, assign position to '#'
if grid{validInputRow,validInputCol} == '.'
    grid{validInputRow,validInputCol} = '#'; 
    fprintf('\nNo ship was hit. You missed.') % Print message that ship was hit
    fprintf('\n==============================') % Print format
% If user input coordinates hits a part of a ship in grid, assign position to 'X'
elseif grid{validInputRow,validInputCol} == 'O'
    grid{validInputRow,validInputCol} = 'X'; 
    [shipSunkConfirmed] = confirmShipSunk(validInputRow,validInputCol); % Call confirmShipSunk function to check if a ship was sunked after shot
    
    % If a ship was sunked after shot 
    if shipSunkConfirmed == true
        
        % Play battleship sunk sound effect
        [ySound,sampleFreq] = audioread('BattleShipSunkSoundEffect.wav');
        sound(ySound(287000:499900)*1.9, sampleFreq);

        fprintf('\nA ship was destroyed! Nice work!') % Print message that ship was destroyed
        fprintf('\n==============================') % Print format
        numShipDestroyed = numShipDestroyed + 1; 
        
    % Else (if the ship was not sunked after shot)
    else
        fprintf('\nA ship was hit! Bullseye!') % Print message that ship was hit
        fprintf('\n==============================') % Print format
    end
end

shotsRem = shotsRem - 1; % Decrement shots remaining variable shotsRem by 1

end
