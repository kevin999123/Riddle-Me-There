--Extra.lua
local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()
local image
local returnPress = function ( self,event ) 
           composer.gotoScene( "Main menu", "fade", 400 )
end


local function onSceneTouch( self, event )
	if event.phase == "began" then
		 composer.gotoScene( "Invite", "slideLeft" )  
		
	end
end

local function onSceneTouch4( self, event )
	if event.phase == "began" then
		
		--composer.gotoScene( "AAME", 800  )
		system.openURL("https://www.youtube.com/")
		
	end
end

local function onSceneTouch8( self, event )
	if event.phase == "began" then
		local path = system.pathForFile("automatic login.txt",system.DocumentsDirectory)
		os.remove(path)
		composer.gotoScene( "Login", "fade", 800  )
		
	end
end

function scene:create( event )
	local sceneGroup = self.view
	
	image = display.newImage( "muim/background-15.png" )
	image.x = display.contentCenterX
	image.y = display.contentCenterY
	
	image1 = display.newImage( "muim/gift button.png" )
	image1.x = display.contentWidth/2
	image1.y = display.contentHeight/4

	image2 = display.newImage( "muim/system status button.png" )
	image2.x = display.contentWidth/1.93
	image2.y = display.contentHeight/2.7

	image3 = display.newImage( "muim/help button.png" )
	image3.x = display.contentWidth/2.23
	image3.y = display.contentHeight/2.1

	image4 = display.newImage( "muim/AAME button.png" )
	image4.x = display.contentWidth/1.73
	image4.y = display.contentHeight/1.7

	--[[image5 = display.newImage( "muim/credits button.png" )
	image5.x = display.contentWidth/2.15
	image5.y = display.contentHeight/1.43]]

	image8 = display.newImage( "muim/log out.png" )
	image8.x = display.contentWidth/1.05
	image8.y = display.contentHeight/1.07

	sceneGroup:insert( image )	
	sceneGroup:insert( image1 )		
	sceneGroup:insert( image2 )
	sceneGroup:insert( image3 )
	sceneGroup:insert( image4 )
	--sceneGroup:insert( image5 )
	sceneGroup:insert( image8 )

	image1.touch = onSceneTouch
	image4.touch = onSceneTouch4
	image8.touch = onSceneTouch8

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

end

function scene:show( event )
	local phase = event.phase
	composer.removeScene( "Main menu" )
	composer.removeScene( "Invite" )
	if "did" == phase then
		print( "1: show event, phase did" )
		composer.removeScene("Login")
		
	local showMem = function()
		image1:addEventListener( "touch", image1 )
		image8:addEventListener( "touch", image8 )
		image4:addEventListener( "touch", image4 )
		end
		memTimer = timer.performWithDelay( 500, showMem, 1 )
	end	
end

function scene:hide( event )
	local phase = event.phase
	if "will" == phase then
		image4:removeEventListener( "touch", image4 )
		image1:removeEventListener( "touch", image1 )
		image8:removeEventListener( "touch", image8 )
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


