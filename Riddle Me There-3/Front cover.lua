--Front cover
local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()
local image

local function onSceneTouch( self, event )
	if event.phase == "began" then
		composer.gotoScene( "Register", "slideLeft", 800  )
		return true
	end
end
local function onSceneTouch2( self, event )
	if event.phase == "began" then
		composer.gotoScene( "Login", "slideLeft", 800  )
		return true
	end
end


function scene:create( event )
	local sceneGroup = self.view
	--首頁貼圖
	image = display.newImage( "muim/Background-2.png" )
	image.x = display.contentCenterX
	image.y = display.contentCenterY
	
	image1 = display.newImage( "muim/Register buttom1.png" )
	image1.x = display.contentWidth/1.62
	image1.y = display.contentHeight*0.55

	image2 = display.newImage( "muim/Login buttom1.png" )
	image2.x = display.contentWidth/1.5
	image2.y = display.contentHeight*0.75
	
	image3 = display.newImage( "muim/map.png" )
	image3.x = display.contentWidth/3
	image3.y = display.contentHeight/2

	image1.touch = onSceneTouch
	image2.touch = onSceneTouch2

	sceneGroup:insert( image )
	sceneGroup:insert( image1 )
	sceneGroup:insert( image2 )
	sceneGroup:insert( image3 )

end

function scene:show( event )
	local phase = event.phase
	composer.removeScene( "Register" )
	composer.removeScene( "Login" )

	
	if "did" == phase then
		print( "1: show event, phase did" )
		local showMem = function()
			image1:addEventListener( "touch", image1 )
			image2:addEventListener( "touch", image2 )
		end
		memTimer = timer.performWithDelay( 500, showMem, 1 )
	end	
end

function scene:hide( event )
	local phase = event.phase
	if "will" == phase then
		print( "1: hide event, phase will" )
		image1:removeEventListener( "touch", image1 )
		image2:removeEventListener( "touch", image2 )
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


