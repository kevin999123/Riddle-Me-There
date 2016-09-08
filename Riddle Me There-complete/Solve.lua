--Solve
local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()




function scene:create( event )
	local sceneGroup = self.view
	--首頁貼圖
	image = display.newImage( "muim/Background-4.png" )
	image.x = display.contentCenterX
	image.y = display.contentCenterY
	
	image1 = display.newImage( "muim/like dislike icon.png" )
	image1.x = display.contentWidth/1.75
	image1.y = display.contentHeight/5.5

	image2 = display.newImage( "muim/like dislike icon.png" )
	image2.x = display.contentWidth/1.75
	image2.y = display.contentHeight/3.5

	image3 = display.newImage( "muim/like dislike icon.png" )
	image3.x = display.contentWidth/1.75
	image3.y = display.contentHeight/2.6

	image4 = display.newImage( "muim/like dislike icon.png" )
	image4.x = display.contentWidth/1.75
	image4.y = display.contentHeight/2.05

	image5 = display.newImage( "muim/like dislike icon.png" )
	image5.x = display.contentWidth/1.75
	image5.y = display.contentHeight/1.7

	image6 = display.newImage( "muim/like dislike icon.png" )
	image6.x = display.contentWidth/1.75
	image6.y = display.contentHeight/1.44

	image7 = display.newImage( "muim/like dislike icon.png" )
	image7.x = display.contentWidth/1.75
	image7.y = display.contentHeight/1.25

	image8 = display.newImage( "muim/arrow icon.png" )
	image8.x = display.contentWidth/1.635
	image8.y = display.contentHeight/1.25

	image9 = display.newImage( "muim/arrow icon.png" )
	image9.x = display.contentWidth/1.635
	image9.y = display.contentHeight/1.44

	image10 = display.newImage( "muim/arrow icon.png" )
	image10.x = display.contentWidth/1.635
	image10.y = display.contentHeight/1.7

	image9 = display.newImage( "muim/arrow icon.png" )
	image9.x = display.contentWidth/1.635
	image9.y = display.contentHeight/2.05

	image9 = display.newImage( "muim/arrow icon.png" )
	image9.x = display.contentWidth/1.635
	image9.y = display.contentHeight/2.6

	image9 = display.newImage( "muim/arrow icon.png" )
	image9.x = display.contentWidth/1.635
	image9.y = display.contentHeight/3.5

	image9 = display.newImage( "muim/arrow icon.png" )
	image9.x = display.contentWidth/1.635
	image9.y = display.contentHeight/5.5



	sceneGroup:insert( image )
	sceneGroup:insert( image1 )
	

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


