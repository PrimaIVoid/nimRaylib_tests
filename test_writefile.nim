import nimraylib_now

type
    Mouse = object
        globX: cint
        globY: cint
        x: cint
        y: cint
        cell: cint

func drawLabelArray(txtrArray: openArray[Texture2D], label: openarray[cstring], font: Font) =
    var counter = 0 # Keep track of every Digit of a single Row
    var row = 0.cfloat
    for i in 0..<txtrArray.len: # Iterate over correct number of Labels (two Digit), based on current Array Length -1 for Empty first Texture
        if counter == 10: # A row contain 10 Labels, from 0..9
            counter = 0 # Reaching the last Label, it reset back to 0
            row += 1
        drawTextEx(font, label[i], Vector2(x: cfloat(198+(45*counter)), y: 85+(62*row)), font.baseSize.float*1, 2, Raywhite)
        counter += 1

proc exportFullMap(fileName: string, terrainLayer: array[14400, cint], objectLayer: array[14400, cint], entityLayer: array[14400, cint]) =
    var s: string
    var counter: cint = 0
    for i, k in terrainLayer:
            if counter < 120:
                s = "93"
    writeFile("res/data/" & fileName & ".txt", s)

func makeLabelArray(size: cint): seq[cstring] =
    for i in 0..<size:
        if i == 0: # Starting String-Value should not be '00', but instead '01'
            result.add("01".cstring)
        elif i < 9: # Check for numbers 1..8 to add +1 and propend extra '0' to become double Digit
            result.add(("0" & ($(i+1))).cstring)
        else: result.add(($(i+1)).cstring)

initWindow(800, 600, "Test Leak")

let txtrTerrain: array[4, Texture2D] = [
    loadTexture("res/graphics/terrains/empty.png"),
    loadTexture("res/graphics/terrains/bg_lightgreen.png"),
    loadTexture("res/graphics/terrains/bg_darkgreen.png"),
    loadTexture("res/graphics/terrains/t0.png")
]

var mouse: Mouse
let font4 = loadFont("res/fonts/setback.png")
let myRect = Rectangle(x: 240, y: 120, width: 60, height: 60)

const labelArray = makeLabelArray(40)

var terrainLayer: array[14400, cint]
for i, k in terrainLayer:
    terrainLayer[i] = 9
var objectLayer: array[14400, cint]
for i, k in objectLayer:
    objectLayer[i] = 9
var entityLayer: array[14400, cint]
for i, k in entityLayer:
    entityLayer[i] = 9

setTargetFPS(60)

while not windowShouldClose():
    mouse.x = getMouseX()
    mouse.y = getMouseY()
    if isKeyPressed(T):
        echo "labelArray: ", labelArray
    if isKeyPressed(One):
        exportFullMap("fullMap" & $(1), terrainLayer, objectLayer, entityLayer) # BUG is likely on this proc call

    ## DRAWING - 60/s
    beginDrawing()
    clearBackground(Black)
    drawLabelArray(txtrTerrain, labelArray, font4)
    drawRectangleRec(myRect, Blue)
    endDrawing()

## TEXTURE UNLOADING
for i, k in txtrTerrain:
  unloadTexture(k)
unloadFont(font4)
closeWindow()
