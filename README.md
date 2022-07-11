# nimRaylib_tests

The visual bug can be reproduced by hovering the mouse inside the border of the Blue box

----
The visualized numbers are labels (cstring as raylib requires) that should always remain the same during the execution of the program
Anyhow, once the mouse cursor is recognized inside the Box area, all the Labels (except for the first one labelArray[0]) have their value changed to "93"

----
Pressing the 'T' key before and after the mouse hovering into the Box, will show the curret data of the labelArray

----
That value come from within the procedure **exportFullMap()** that prints that string into a newly created file, into the dir **res/data/**
