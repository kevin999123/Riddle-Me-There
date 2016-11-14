  --wrong.lua
local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()
local returnPress = function ( self,event ) 
           composer.gotoScene( "Main menu", "fade", 400 )
end
function scene:create( event )
	local sceneGroup = self.view
	display.setStatusBar( display.HiddenStatusBar )	
	image = display.newImage( "muim/Background-11.png" )
	image.x = display.contentCenterX
	image.y = display.contentCenterY
	
	image1 = display.newImage( "muim/help button.png" )
	image1.x = display.contentWidth/1.7
	image1.y = display.contentHeight/2

	sceneGroup:insert( image )	
	sceneGroup:insert( image1 )		
	--image3.touch = onSceneTouch1
	local returnPress = widget.newButton
 { 
	defaultFile = "muim/menu button.png",
	overFile = "muim/menu button.png",
	emboss = true,
	onPress = returnPress,
	--onRelease = button1Release,
 }
     sceneGroup:insert(returnPress)
    returnPress.x =display.contentWidth/1.53
	returnPress.y =display.contentHeight/1.6

end

function scene:show( event )
	local phase = event.phase
	composer.removeScene( "Reply" )
	--composer.removeScene( "country" )
		if "did" == phase then
		print( "1: show event, phase did" )
		composer.removeScene("Login")
		composer.removeScene( "Reply" )
	local showMem = function()
		--image1:addEventListener( "touch", image1 )
		--image2:addEventListener( "touch", image2 )
		
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


