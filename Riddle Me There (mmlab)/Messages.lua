--Messages.lua
local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()
local image
local json = require("json")


local nextPress = function ( self,event ) 
		
        composer.gotoScene( "Friends", "fade", 400 )
end

local nextPress1 = function ( self,event ) 
		
        composer.gotoScene( "invitefriends2", "fade", 400 )
end

local nextPress2 = function ( self,event ) 
		
        composer.gotoScene( "ConfirmFriends", "fade", 400 )
end

local returnPress = function ( self,event ) 
           composer.gotoScene( "Main menu", "fade", 400 )
end


function scene:create( event )
	local sceneGroup = self.view
	
image = display.newImage( "muim/background-18.png" )
image.x = display.contentCenterX
image.y = display.contentCenterY


image1 = display.newImage( "muim/Messages.png" )
image1.x = display.contentWidth/1.14
image1.y = display.contentHeight/1.28


sceneGroup:insert( image )
sceneGroup:insert( image1 )


	local nextPress = widget.newButton
 { 
	
	defaultFile = "muim/friends.png",
	overFile = "muim/friends.png",
	emboss = true,
	onPress = nextPress,
	--onRelease = button1Release,
 }
     sceneGroup:insert(nextPress)
    nextPress.x =display.contentWidth/1.13
	nextPress.y =display.contentHeight/2.4

	local nextPress1 = widget.newButton
 { 
	
	defaultFile = "muim/invitefriends.png",
	overFile = "muim/invitefriends.png",
	emboss = true,
	onPress = nextPress1,
	--onRelease = button1Release,
 }
     sceneGroup:insert(nextPress1)
    nextPress1.x =display.contentWidth/1.21 
	nextPress1.y =display.contentHeight/1.8


	local nextPress2 = widget.newButton
 { 
	
	defaultFile = "muim/ConfirmFriends.png",
	overFile = "muim/ConfirmFriends.png",
	emboss = true,
	onPress = nextPress2,
	--onRelease = button1Release,
 }
     sceneGroup:insert(nextPress2)
    nextPress2.x =display.contentWidth/1.23
	nextPress2.y =display.contentHeight/1.48

	local returnPress = widget.newButton
 { 
	
	defaultFile = "muim/returnPress.png",
	overFile = "muim/returnPress.png",
	emboss = true,
	onPress = returnPress,
	--onRelease = button1Release,
 }
     sceneGroup:insert(returnPress)
    returnPress.x =display.contentWidth/9
	returnPress.y =display.contentHeight/1.06
--
end
function scene:show( event )
	local phase = event.phase
	composer.removeScene( "Front cover" )
	composer.removeScene( "ConfirmFriends" )
	composer.removeScene( "invitefriends" )
	composer.removeScene( "Friends" )
	
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


