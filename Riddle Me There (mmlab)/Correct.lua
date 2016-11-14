-- Correct.lua
local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()
local image
local returnPress = function ( self,event ) 
    
	local function networkListener( event )
				if ( event.isError ) then
	        		print( "Network error: ", event.response )
	    		else

	        		print ( "RESPONSE: " .. event.response )

	    		end
	end

	local headers = {}

	headers["Content-Type"] = "application/x-www-form-urlencoded"
	headers["Accept-Language"] = "en-US"
			
	local body = "id="..nameTable.riddleid.."&likeriddle=1"
			
	local params = {}
	params.headers = headers
	params.body = body

	network.request( "http://mmlab.lhu.edu.tw/likenumber.php", "POST", networkListener, params )
	composer.gotoScene( "Main menu", frad, 400 )

end
local returnPress2 = function ( self,event ) 
    
	local function networkListener2( event )
				if ( event.isError ) then
	        		print( "Network error: ", event.response )
	    		else

	        		print ( "RESPONSE: " .. event.response )

	    		end
	end

	local headers = {}

	headers["Content-Type"] = "application/x-www-form-urlencoded"
	headers["Accept-Language"] = "en-US"
			
	local body = "id="..nameTable.riddleid.."&likeriddle=2"

			
	local params = {}
	params.headers = headers
	params.body = body

	network.request( "http://mmlab.lhu.edu.tw/likenumber.php", "POST", networkListener2, params )
	composer.gotoScene( "Main menu", frad, 400 )

end
function scene:create( event )
	local sceneGroup = self.view
	display.setStatusBar( display.HiddenStatusBar )
	image = display.newImage( "muim/Background-14.png" )
	image.x = display.contentCenterX
	image.y = display.contentCenterY
	
	image1 = display.newImage( "muim/like button.png" )
	image1.x = display.contentWidth/2.8
	image1.y = display.contentHeight/1.8

	image2 = display.newImage( "muim/dislike button.png" )
	image2.x = display.contentWidth/1.7
	image2.y = display.contentHeight/2

	image3 = display.newImage( "muim/facebook button.png" )
	image3.x = display.contentWidth/2
	image3.y = display.contentHeight/1.15

	sceneGroup:insert( image )	
	sceneGroup:insert( image1 )		
	sceneGroup:insert( image2 )
	sceneGroup:insert( image3 )


	local function onComplete( event )
		if ( event.action == "clicked" ) then
					    	
			local i = event.index
					        
			if ( i == 1 ) then
			 -- Do nothing; dialog will simply dismiss
					            
								
			 elseif ( i == 2 ) then
					            -- Open URL if "Learn More" (second button) was clicked
					        	-- system.openURL( "http://www.coronalabs.com" )
			end
		 end
	end

	local alert = native.showAlert( "Riddle Me There", "答對謎語 獲得100point.", {"OK"}, onComplete )


	local returnPress = widget.newButton
 { 
	
	defaultFile = "muim/like button.png",
	overFile = "muim/like button.png",
	emboss = false,
	onPress = returnPress,
	--onRelease = button1Release,
 }
     sceneGroup:insert(returnPress)
    returnPress.x =display.contentWidth/2.8
	returnPress.y =display.contentHeight/1.8


	local returnPress2 = widget.newButton
 { 
	
	defaultFile = "muim/dislike button.png",
	overFile = "muim/dislike button.png",
	emboss = false,
	onPress = returnPress2,
	--onRelease = button1Release,
 }
     sceneGroup:insert(returnPress2)
    returnPress2.x =display.contentWidth/1.7
	returnPress2.y =display.contentHeight/2
end

function scene:show( event )
	local phase = event.phase
	--composer.removeScene( "Reply" , true )

	composer.removeHidden()
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


