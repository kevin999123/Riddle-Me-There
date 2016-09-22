--local.lua


local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()
-------------------------------------------------------
local nextPress = function ( self,event ) 
           composer.gotoScene( "map", "fade", 400 )
end

local nextPress1 = function ( self,event ) 
           composer.gotoScene( "special", "fade", 400 )
end

local nextPress2 = function ( self,event ) 
           composer.gotoScene( "area", "fade", 400 )
end
---------------------------------------------------------

function scene:create( event )
	local sceneGroup = self.view
	image = display.newImage( "muim/Background-8.png" )
	image.x = display.contentCenterX
	image.y = display.contentCenterY

	image1 = display.newImage( "muim/reel-1.png" )
	image1.x = display.contentWidth/1.1
	image1.y = display.contentHeight/1.45

	image2 = display.newImage( "muim/local riddles.png" )
	image2.x = display.contentWidth/1.15
	image2.y = display.contentHeight/1.65

	sceneGroup:insert( image)	sceneGroup:insert( image1)	
	sceneGroup:insert( image2)		
	

local nextPress = widget.newButton
 { 
	
	defaultFile = "muim/map-1.png",
	overFile = "muim/map-1.png",
	emboss = true,
	onPress = nextPress,
	--onRelease = button1Release,
 }
     sceneGroup:insert(nextPress)
    nextPress.x =display.contentWidth/1.2
	nextPress.y =display.contentHeight/1.2

local nextPress1 = widget.newButton
 { 
	
	defaultFile = "muim/special riddles.png",
	overFile = "muim/special riddles.png",
	emboss = true,
	onPress = nextPress1,
	--onRelease = button1Release,
 }
     sceneGroup:insert(nextPress1)
    nextPress1.x =display.contentWidth/1.2
	nextPress1.y =display.contentHeight/1.4

local nextPress2 = widget.newButton
 { 
	
	defaultFile = "muim/created riddles.png",
	overFile = "muim/created riddles.png",
	emboss = true,
	onPress = nextPress2,
	--onRelease = button1Release,
 }
     sceneGroup:insert(nextPress2)
    nextPress2.x =display.contentWidth/1.1
	nextPress2.y =display.contentHeight/2


		
	
end
----------------------------------------------------------------------------------------------------------
function scene:show( event )
	local phase = event.phase

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