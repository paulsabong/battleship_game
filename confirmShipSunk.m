function [shipSunkConfirmed] = confirmShipSunk(validInputRow,validInputCol)
%{
Based on the coordinates chosen by the user, check if the shot sank the entire ship. 

1. 
    Check each position stored in shipPos
        a. In each indiviual row, assign the parameters from shipPos to row1, row2, col1, col2 respectively. 
        b. For every position, if the row is between row1 and row2, 
           and col is between col1 and col2, 
           check each position in row1 to row2  if a shot to a ship, 'X', is present. 
        c. Return isShipSunk to shinkSunkConfirmed. 
%}

global grid
global shipPos

% Initialize variable isShipSunk to logical 'true' to check coordinates around user's coordinate input
isShipSunk = true; 

% Loop from 1 to size of row in shipPos
for x = 1 : size(shipPos,1)
    % Check each row and extract shipPos to row1, row2,
    % col1, and col2
    row1 = shipPos(x,1);
    row2 = shipPos(x,2);
    col1 = shipPos(x,3);
    col2 = shipPos(x,4);

    % Adjust increment/decrement based on range from row1 to row2, and col1 to col2
    if row2 >= row1
        rowIncrement = 1;
    end
    if col2 >= col1
        colIncrement = 1;
    end
    if row1 > row2
        rowIncrement = -1;
    end
    if col1 > col2
        colIncrement = -1;
    end

    % Determine which value in row1 and row2 is smallest and largest. 
    maxRow = max(row1,row2);
    minRow = min(row1,row2);
    
    % Determine which value in row1 and row2 is smallest and largest. 
    maxCol = max(col1,col2);
    minCol = min(col1,col2);

    % Check if user input row validInputRow is in between row1 and row2, and
    % if user input col validInput col is in between col1 and col2
    if (validInputRow >= minRow && validInputRow <= maxRow)...
            && (validInputCol >= minCol && validInputCol <= maxCol)

        % If so, check each position between user input coordinate if part of the ship ship has been hit
        for y = row1 : rowIncrement: row2
            for z = col1 : colIncrement: col2
                % If position 
                if grid{y,z} ~= 'X'
                    isShipSunk = false;
                end
            end
        end
    end
end


% Return logical value isShipSunk to shipSunkConfirmed
shipSunkConfirmed = isShipSunk;

end


