## Battleship Game 
### About
This game was designed using MATLAB software. The rules are the same as Battleship, but instead of you playing against an opponent, you are playing against the computer.
  
### How to Play 
* A 10 x 10 grid will contain a specific number of ships
* You get a limited amount of shots to take down all the ships
* You can enter a coordinate, for example, B7, to shoot
* Your shot will display on the grid. A symbol (view Legend) will be represented to indicate a hit or miss
* If all ships are down before or after your last shot, you win!
* You can play up to three different game modes:
  * Easy Mode: You have 50 shots to destroy 5 ships
  * Hard Mode: You have 60 shots to destroy 7 ships
  * Training Mode: You have 1000 shots to destroy 10 ships. Ship locations will be revealed
* **Legend**
  * '' . '' = 'water'
  * '' # ''  = 'missed shot'
  * '' X ''  = 'part of the ship was hit'
  * '' O ''  = 'part of the ship's location [Training Mode]'

### Demo 
https://github.com/paulsabong/battleship_game/assets/150301713/3b3ced1e-94f7-48b3-8aa8-eaf11b8f5f3d

### How to install and run the game
* Ensure you have MATLAB and Git installed to your computer
* Run your Terminal and type the following code:
* Ensure that you are in the Desktop file directory 
```
ls 
cd ~/Desktop
```
* Download Battleship folder from Github
```
git clone https://github.com/paulsabong/battleship_game.git
```
* Open Matlab -> Click Open file (Ctrl + O) -> Click Battleship folder -> Click and Open RunHere.m file
* Click Run (Ctrl + Enter)
  * If the game is not running properly, it may be because you are not in the same directory. If so, you need to right click RunHere.m and click on 'Change Current Folder to ...'
  * Click Run again (Ctrl + Enter)
  
