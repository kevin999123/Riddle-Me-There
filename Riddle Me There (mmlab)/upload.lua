 --upload.lua
local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	display.setStatusBar( display.HiddenStatusBar )
	image = display.newImage( "muim/Background-13.png" )
	image.x = display.contentCenterX
	image.y = display.contentCenterY
	
--     這頁也一張背景圖＝＝ 也先放著好了........

	sceneGroup:insert( image )	
	
end

function scene:show( event )
	local phase = event.phase
	--composer.removeScene( "Front cover" )
	--composer.removeScene( "country" )
		if "did" == phase then
		print( "1: show event, phase did" )
		composer.removeScene("Login")
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


