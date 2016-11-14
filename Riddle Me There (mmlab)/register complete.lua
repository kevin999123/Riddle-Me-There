--register complete.lua

local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()
---------------------------------------------------------------
local LoginPress = function ( self,event ) 
           composer.gotoScene( "Login", "fade", 400 )
end
--------------------------------------------------------------


function scene:create( event )
	local sceneGroup = self.view
	
	image = display.newImage( "muim/Background-6.png" )
	image.x = display.contentCenterX
	image.y = display.contentCenterY

	image1 = display.newImage( "muim/magnifier.png" )
	image1.x = display.contentWidth/1.2
	image1.y = display.contentHeight/1.6
	

	sceneGroup:insert( image )		
	sceneGroup:insert( image1)	



local LoginPress = widget.newButton
 { 
	
	defaultFile = "muim/Login buttom.png",
	overFile = "muim/Login buttom.png",
	emboss = true,
	onPress = LoginPress,
	--onRelease = button1Release,
 }
     sceneGroup:insert(LoginPress)
    LoginPress.x =display.contentWidth/1.5
	LoginPress.y =display.contentHeight/1.2
end

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


