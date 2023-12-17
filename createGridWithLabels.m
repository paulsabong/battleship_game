function createGridWithLabels()
%{
Print the grid with row labels A - J and column labels 1 to 10.

1. 
    Extract only the letters from alphabet in index 1 to length of grid. 
2. 
    For every row in the grid, 
    a. Print the respective alphabet, 
    b. For every column, 
        i. If position is occupied by ship 'O', print '.' or 'O' (if user select game mode 'Training Mode', 
            else print the current position.
3. 
    Print the number of each column up to length of grid as a string at the bottom of the grid.
%}

global grid 
global alphabet 
global trainingMode

alphabet = alphabet(1 : size(grid,1)); % Extract only letters in alphabet from index 1 to length of grid 

formatAlphabet = " %-2s|"; % Fix pre-format indent for alphabet
formatGridPos =  " %s"; % Add white space to empty space '.'

% For each row in the grid, print the alphabet letter
for r = 1:size(grid, 1)
    fprintf(formatAlphabet, alphabet(r))

    % For every column in the grid, if position is occupied by ship 'O', print
    % empty space '.' or 'O' (if trainingMode == true) in grid, else print the current position
    for c = 1:size(grid, 2)
        if grid{r, c} == 'O' && trainingMode == false % If user position is occupied by ship 'O' 
            fprintf(formatGridPos, '.') 
        elseif grid{r, c} == 'O' && trainingMode % If user select Game Mode 'Training Mode' , print 'O'         
            fprintf(formatGridPos, 'O')
        else
            fprintf(formatGridPos, grid{r, c}) % Print current position if not occupied by ship 
        end
    end
    fprintf("\n") % Print new line
end

% For each column in grid, print its respective number below grid 
fprintf("     ") % Add white space for format 
for i = 1:size(grid, 2)
    fprintf("%-1d ", i)
end

fprintf("\n") % Print new line

end