function generateGridWithShips()
%{
Create a grid that generates random positions for each ship of random lengths to place on the grid at different directions. 

1. 

    Store grid size as numRow and numCol. This will be used as parameters when generating the ships within the boundaries of the grid.

2. 

    For each row on every column, place “.” on the grid to indicate empty or water. 

3. 

    While the number of ships in the grid is less than the number of ships generated: 
        a. generate random position for row and col
        b. generate a random direction from left, right, down, up for shipDirection
        c. and generate a ship length shipLength.
        d. Keep track of the number of ships placed numShip by adding 1 to
        counter numShipOnGrid
        e. Call ConfirmShipDirection to determine if the ship is out of bounds or not. 
            i. If the ship is not out of bounds, that is, if ConfirmShipDirection returns true, 
               add 1 to the numShip counter to indicate that a ship has been placed. 
%}

global grid
global gridSize
global numShip
global shipPos

grid = {}; % Initialize as empty grid cell array
shipPos = []; % Initialize as empty shipPos array

% Store grid size as numRow and numCol
numRow = gridSize;
numCol = gridSize;

% Generate empty grid with water indication "."
for r = 1 : numRow
    for c = 1 : numCol
        grid{r,c} = '.';
    end
end

numShipOnGrid = 0; % Initialize number of ships on grid to 0
direction = ["left", "right", "down", "up"];

rng('shuffle'); % Generate random seed for every run.

% Loop until all ships are placed on grid
while numShipOnGrid < numShip
    row = randi([1, numRow]); % Generate random row number from 1 to number of rows
    col = randi([1, numCol]); % Generate random column number from 1 to number of columns
    shipDirectionIndex = randi([1, numel(direction)]); % Assign a random index in the direction array to shipDirectionIndex
    shipDirection = direction(shipDirectionIndex); % Extract the direction based on the random index from shipDirectionIndex
    shipLength = randi([2, 5]); % Generate a random length of ship from 2 to 5

    % Call checkShipDirections function to confirm if the ship is bounded
    % inside the grid. If the ship is bounded, place the ship on the grid.
    ConfirmShipDirection = checkShipDirections(row, col, shipDirection, shipLength);

    if ConfirmShipDirection == true % Check if ConfirmShipDirection function is true
        numShipOnGrid = numShipOnGrid + 1; % Add 1 to counter numShipOnGrid to indicate that a ship has been placed on the grid
    end
end

end