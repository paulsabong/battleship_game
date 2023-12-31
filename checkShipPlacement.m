function [ConfirmShipPlacement] = checkShipPlacement(row1, row2, col1, col2)
%{
Check if the ship can be placed in the positions generated and requested by
the computer. Arguments obtained from checkShipDirections.

1. 
    Initialize the ship placement to 'true'. We set the assumption that the
    placement is true unless we verify that it isn't using the following
    logic. The logical value will be used to indicate whether the ship 
    generated is bounded within the grid, which will help with
    generateGridWithShips function.
2. 
    In each requested position of the grid, check from row1 to row2  if the position is empty, ".". 
    Then check from col1 to col2 if the position is empty, ".". 
3. 
    If all positions are empty:
        b. store the positions to shipPos to update the tracker of ship positions 
        c. replace "." for each position with "O". 
    Else if the position is filled with a part of the ship, return ship placement to 'false'. 
%}

global grid
global shipPos

shipPlacementLegal = [];

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

% Check each position generated by computer to check if it is empty.
for a = row1 : rowIncrement: row2 
    for b = col1 :colIncrement: col2
        if grid{a,b} ~= '.'
            shipPlacementLegal = [shipPlacementLegal,false]; % Assign false if position in not empty
            break; % break for loop
        end
    end
end

if ~any(shipPlacementLegal == false) % If ship placement is legal, store positions row1, row2, col1, and col2
    shipPos = [shipPos; [row1,row2,col1,col2]]; % Append positions if they are empty in grid
    for a = row1 : rowIncrement: row2 
        for b = col1 : colIncrement: col2
            grid{a,b} = 'O';
        end
    end
end

if any(shipPlacementLegal == false) % If any of the logical values in shipPlacementLegal are 'false'
    ConfirmShipPlacement = false;  % return shipPlacementLegal logical value 'false'
else
    ConfirmShipPlacement = true;  % return shipPlacementLegal logical value 'true'
end

end
