# nimRaylib_tests
The visual bug can be reproduced by hovering the mouse inside the border of the Blue box
The visualized numbers are labels (cstring as raylib requires) that should always remain the same during the execution of the program
Anyhow, once the mouse cursor is recognized inside the Box area, all the Labels (except for the first one [0]) have their values
changed to "93"

That numer come from within the procedure exportFullMap()
