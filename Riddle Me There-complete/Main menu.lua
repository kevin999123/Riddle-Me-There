--Main menu
local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	--首頁貼圖
	image = display.newImage( "muim/Background-3.png" )
	image.x = display.contentCenterX
	image.y = display.contentCenterY
	
	image1 = display.newImage( "muim/Solve button.png" )
	image1.x = display.contentWidth/1.8
	image1.y = display.contentHeight/9

	image2 = display.newImage( "muim/Create button.png" )
	image2.x = display.contentWidth/2.5
	image2.y = display.contentHeight/3.5

	image3 = display.newImage( "muim/Area button.png" )
	image3.x = display.contentWidth/1.65
	image3.y = display.contentHeight/2.7

	image4 = display.newImage( "muim/Friends button.png" )
	image4.x = display.contentWidth/2.5
	image4.y = display.contentHeight/1.85

	image5 = display.newImage( "muim/Profile button.png" )
	image5.x = display.contentWidth/1.65
	image5.y = display.contentHeight/1.6

	image6 = display.newImage( "muim/Score button.png" )
	image6.x = display.contentWidth/2.5
	image6.y = display.contentHeight/1.25

	image7 = display.newImage( "muim/Extra button.png" )
	image7.x = display.contentWidth/1.6
	image7.y = display.contentHeight/1.15



	sceneGroup:insert( image )	sceneGroup:insert( image4 )
	sceneGroup:insert( image1 ) sceneGroup:insert( image5 )
	sceneGroup:insert( image2 )	sceneGroup:insert( image6 )
	sceneGroup:insert( image3 )	sceneGroup:insert( image7 )

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


