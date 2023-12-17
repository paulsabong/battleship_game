function checkEndGame()
%{
Check if the game is over based on the following results:
1. 
    If user sinks all ships at the last shot, the game is over and the user
    wins. 
1. 
    If the user sinks all ships, the game is over and the user wins. 
2. 
    If all bullets are used, the game is over and the user loses. 
%}

global endGame
global numShip
global numShipDestroyed
global shotsRem 
global trainingMode

if (numShipDestroyed == numShip) && (shotsRem == 0) % If user destroyed all ships at the last shot, print message that game is over and user won. 
    fprintf('\nYou took down all the ships at your last shot! You Win! Thank you for playing!\n')
    endGame = true;
elseif (numShipDestroyed == numShip) && trainingMode == false % If user destroyed all the ships, print message that game is over and user won.
    fprintf('\nYou took down all the ships! You Win! Thank you for playing!\n')
    endGame = true;
elseif (numShipDestroyed == numShip) && trainingMode == true % If user destroyed all the ships in game mode 'Traning Mode' print message to indicate that game is over
    fprintf('\nYou took down all the ships and improved your shooting skills! Thank you for training!\n')
    endGame = true;
elseif shotsRem == 0 % If user ran of our shots, print message that game is over and user lost. 
    fprintf('\nYou ran out of shots. You only sank %0.0f out of %0.0f ships.\nGame Over. Thank you for playing!\n', numShipDestroyed,numShip)
    endGame = true;
end
