--Country.lua

local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()
local image

function scene:create( event )
	local sceneGroup = self.view
image = display.newImage( "muim/Background-1.png" )
image.x = display.contentCenterX
image.y = display.contentCenterY

image1 = display.newImage( "muim/native.png" )
image1.x = display.contentWidth/2
image1.y = display.contentHeight/1.21

sceneGroup:insert( image )
sceneGroup:insert( image1 )

------------------------------------------------------------------------------------

	
	-- Status text
local statusText = display.newText(  "country", 80, 350, 200, 0, native.systemFont, 25 )
	statusText:setFillColor(1,1,1 )
	statusText.anchorX = 0
	statusText.x = 200
	statusText.y =30
	sceneGroup:insert( statusText )


local columnData = 
{
    -- Months
    { 
        align = "right",
        width =160 ,
        startIndex = 1,
        labels = { "Australia", "China", "Cuba", "Japan", "Korea", "Germany", "Philippines", "Russia", "United Kingdom", "United States", "Taiwan", "Vietnam" }
    },
   
   
}

-- Image sheet options and declaration
local options = {
    frames = 
    {
        { x=0, y=0, width=320, height=222 },
        { x=320, y=0, width=320, height=222 },
        { x=640, y=0, width=8, height=222 }
    },
    sheetContentWidth = 648,
    sheetContentHeight = 100
}

-- Create the widget
local pickerWheel2 = widget.newPickerWheel
{
    top = display.contentHeight - 300,
    columns = columnData,
    sheet = pickerWheelSheet,
    overlayFrame = 1,
    overlayFrameWidth = 320,
    overlayFrameHeight = 222,
    backgroundFrame = 2,
    backgroundFrameWidth = 320,
    backgroundFrameHeight = 222,
    separatorFrame = 3,
    separatorFrameWidth = 8,
    separatorFrameHeight = 222,
    columnColor = { 1, 1, 1,0},
    fontColor = { 1, 1, 1, 1 },
 --   fontColorSelected = { 0.2, 0.6, 0.4 }
}

-- Get the table of current values for all columns
-- This can be performed on a button tap, timer execution, or other event

local values = pickerWheel2:getValues()

-- Get the value for each column in the wheel (by column index)
local currentMonth = values[1].value

print( currentMonth )
sceneGroup:insert( pickerWheel2 )


local function showValues( event )
		-- Retrieve the current values from the picker
		
		local values = pickerWheel2:getValues()
		
		-- Update the status box text
statusText.text = "" .. values[1].value 
--------------------------------------------------------------------------------	
local currentsession = statusText.text
print("currentsession valus is =".. currentsession)

session= currentsession                            
print("session= "..session)   
composer.gotoScene( "Register", "fade", 400 )
-------------------------------------------------------------------------------   
	
		
		return true
	end



local getValuesButton = widget.newButton {
	left = 0,
	top = 250,
	width = 0,
	height = 0,
	id = "getValues",
	label = "confirm",
	onRelease = showValues,
}
sceneGroup:insert( getValuesButton )
getValuesButton.x = display.contentCenterX







	end


	---------------------------------------------------------------------------------------------------
function scene:show( event )
	local phase = event.phase
	composer.removeScene( "Register" )
	
	if "did" == phase then
		print( "1: show event, phase did" )
		local showMem = function()
			
		end
		memTimer = timer.performWithDelay( 500, showMem, 1 )
	end	
end

function scene:hide( event )
	local phase = event.phase
	if "will" == phase then
		print( "1: hide event, phase will" )

	end
end



function scene:destroy( event )
	print( "((destroying scene 1's view))" )
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene


