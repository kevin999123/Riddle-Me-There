-- Create.lua
local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()
local defaultBox






local function onSceneTouch1( self, event )
		
		if event.phase == "began" then
			local function networkListener( event )
				if ( event.isError ) then
	        		
	    		else
	        	
	    	end
		end
		local function onComplete( event )
local photo = event.target
photo.x = 300	
photo.y = 210
photo.width=100
photo.height=100

--photo:scale( 0.5, 0.5 )
   print( "photo w,h = " .. photo.width .. "," .. photo.height )


   	
	--photo:setFillColor( 1, 0, 0 ) 
end

if media.hasSource( media.PhotoLibrary ) then
   media.selectPhoto( { mediaSource=media.PhotoLibrary, listener=onComplete } )
  
	else
   native.showAlert( "Corona", "This device does not have a photo library.", { "OK" } )
end



	end
end		        



function scene:create( event )
	local sceneGroup = self.view

	image = display.newImage( "muim/Background-5.png" )
	image.x = display.contentCenterX
	image.y = display.contentCenterY	
	
	image1 = display.newImage( "muim/title button.png" )
	image1.x = display.contentWidth/5.5
	image1.y = display.contentHeight/4.5

	image2 = display.newImage( "muim/riddle button.png" )
	image2.x = display.contentWidth/5
	image2.y = display.contentHeight/3

	image3 = display.newImage( "muim/genre button.png" )
	image3.x = display.contentWidth/5.1
	image3.y = display.contentHeight/2.2

	image4 = display.newImage( "muim/awnser button.png" )
	image4.x = display.contentWidth/4.6
	image4.y = display.contentHeight/1.75

	image5 = display.newImage( "muim/submit button.png" )
	image5.x = display.contentWidth/4.5
	image5.y = display.contentHeight/1.2

	image6 = display.newImage( "muim/arrow icon.png" )
	image6.x = display.contentWidth/2
	image6.y = display.contentHeight/1.5





	sceneGroup:insert( image )
	sceneGroup:insert( image1 )
	sceneGroup:insert( image2 )
	sceneGroup:insert( image3 )
	sceneGroup:insert( image4 )
	sceneGroup:insert( image5 )




local title = native.newTextField( display.contentWidth/1.87, 54, 180, 15 )
	  
	  title:setTextColor( 1,1,1  )
	  title.hasBackground = false

local riddle = native.newTextBox( 257, 90, 180, 45 )
	  riddle:setTextColor( 1,1,1  )
	  riddle.hasBackground = false
	  riddle.isEditable = true

local genre = native.newTextField( display.contentWidth/1.96,126, 155, 15 )
	  
	  genre:setTextColor( 1,1,1  )
	  genre.hasBackground = false


sceneGroup:insert(title)
sceneGroup:insert(riddle)
sceneGroup:insert(genre)

image6.touch = onSceneTouch1





---------------------------------------------------------------  
end

function scene:show( event )
	local phase = event.phase
		if "did" == phase then
		print( "1: show event, phase did" )
	local showMem = function()

	image6:addEventListener( "touch", image6 )
		end

		memTimer = timer.performWithDelay( 500, showMem, 1 )
	end	
end

function scene:hide( event )
	local phase = event.phase
	if "will" == phase then
		print( "1: hide event, phase will" )
	image6:addEventListener( "touch", image6 )

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


