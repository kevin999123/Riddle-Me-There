--Solve.lua
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

	image11 = display.newImage( "muim/arrow icon.png" )
	image11.x = display.contentWidth/1.635
	image11.y = display.contentHeight/2.05

	image12 = display.newImage( "muim/arrow icon.png" )
	image12.x = display.contentWidth/1.635
	image12.y = display.contentHeight/2.6

	image13 = display.newImage( "muim/arrow icon.png" )
	image13.x = display.contentWidth/1.635
	image13.y = display.contentHeight/3.5

	image14 = display.newImage( "muim/arrow icon.png" )
	image14.x = display.contentWidth/1.635
	image14.y = display.contentHeight/5.5		

	image15 = display.newImage( "muim/sidebar.png" )
	image15.x = display.contentWidth/1.95
	image15.y = display.contentHeight/3.2	

	image16 = display.newImage( "muim/100m.png" )
	image16.x = display.contentWidth/7.5
	image16.y = display.contentHeight/2.6

	image17 = display.newImage( "muim/500m.png" )
	image17.x = display.contentWidth/7.5
	image17.y = display.contentHeight/2.0

	image18 = display.newImage( "muim/1km.png" )
	image18.x = display.contentWidth/8
	image18.y = display.contentHeight/1.6

	image19 = display.newImage( "muim/3km.png" )
	image19.x = display.contentWidth/8
	image19.y = display.contentHeight/1.35

	image20 = display.newImage( "muim/5km.png" )
	image20.x = display.contentWidth/8
	image20.y = display.contentHeight/1.15

	image21 = display.newImage( "muim/local riddles.png" )
	image21.x = display.contentWidth/1.15
	image21.y = display.contentHeight/1.7

	image22 = display.newImage( "muim/favorite.png" )
	image22.x = display.contentWidth/1.15
	image22.y = display.contentHeight/2.2

	sceneGroup:insert( image)	sceneGroup:insert( image1)	
	sceneGroup:insert( image2)	sceneGroup:insert( image3)	
	sceneGroup:insert( image4)	sceneGroup:insert( image5)
	sceneGroup:insert( image6)	sceneGroup:insert( image7)
	sceneGroup:insert( image8)	sceneGroup:insert( image9)
	sceneGroup:insert( image10)	sceneGroup:insert( image11)
	sceneGroup:insert( image12)	sceneGroup:insert( image13)
	sceneGroup:insert( image14)	sceneGroup:insert( image15)
	sceneGroup:insert( image16)	sceneGroup:insert( image17)
	sceneGroup:insert( image18)	sceneGroup:insert( image19)
	sceneGroup:insert( image20)	sceneGroup:insert( image21)
	sceneGroup:insert( image22)	
	
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


