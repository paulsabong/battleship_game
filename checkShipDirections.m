function [ConfirmShipDirection] = checkShipDirections(row, col, shipDirection, shipLength)
%{
Given the directions of where the computer wants to place a random ship,
check if direction is valid by determining if it's out of bounds. If so,
return function as false, else assign the ending position for the ship.

1. 
    If "left": 
    a. If ending position to the left is less than 1, return false, else
        assign a value to ending position col2
    If "right": 
    a. If ending position to the right is greater than size of grid, return false, else
        assign a value to ending position col2
    If "down": 
    a. If ending position to the bottom is greater than size of grid, return false, else
        assign a value to ending position row2
    If "up": 
    a. If ending position to the top of is less than 1, return false, else
        assign a value to ending position row2
%}

global grid

% Initialize col1, col2, row1, row2 Variables as the row and col arguments
row1 = row;
row2 = row;
col1 = col;
col2 = col;

isShipPlacementValid = true;
ConfirmShipDirection = false; % Initialize ConfirmShipDirection variable

% Check directions
if shipDirection == "left"
    if col - shipLength < 1 % If col2 (col - shipLength) is less than 1, set function to false
        isShipPlacementValid = false;
    else
        col2 = col - shipLength + 1; % Assing col2 with ending value (Offset)
    end
elseif shipDirection == "right" % If col2 (col + shipLength) is greater than size of grid, set function to false
    if col + shipLength > size(grid,2)
        isShipPlacementValid = false;
    else
        col2 = col + shipLength - 1; % Assign col2 with ending value (Offset)
    end
elseif shipDirection == "down"  % If row2 (row + shipLength) is greater than size of grid, set function to false
    if row + shipLength > size(grid,1)
        isShipPlacementValid = false;
    else
        row2 = row + shipLength -1; % Assign row2 with ending value (Offset)
    end
elseif shipDirection == "up" % If row2 (row - shipLength) is less than 1, set function to false
    if row - shipLength < 1
        isShipPlacementValid = false;
    else
        row2 = row - shipLength + 1; % Assing row2 with ending value (Offset)
    end
end

if isShipPlacementValid % If placement is valid, return checkShipPlacement function to check positions

    ConfirmShipPlacement = checkShipPlacement(row1, row2, col1, col2); % Call checkShipPlacement function with updated arguments row1, row2, col1, and col2

    if ConfirmShipPlacement == true % If ships positions are legal
        ConfirmShipDirection = true; % Validate that ship is legal to place considering it's position relative to other ships
    end

end

end






