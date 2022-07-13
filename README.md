# nimRaylib_tests

The visual bug can be reproduced by hovering the mouse inside the border of the Blue box

----
The visualized numbers are labels (cstring as raylib requires) that should always remain the same during the execution of the program
Anyhow, once the mouse cursor is recognized inside the Box area, all the Labels (except for the first one **labelArray[0]**) have their value changed to "93"

----
That value come from within the procedure **exportFullMap()** that creates a new File that contains that string. The newly created file uses the pathDir: **res/data/**

----
Pressing 'T' key will show the default data of **labelArray**, while pressing '1' will call the procedure that produces the bug.
Pressing 'T' again afterwards will show the data changes into **labelArray**
