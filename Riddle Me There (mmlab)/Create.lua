-- Create.lua
local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()
local defaultBox
local img
local latitude 
local longitudeText 
local photo
local picture
local title 
local riddle
local genre
local photoGroup
local uploadphoto

local returnPress = function ( self,event ) 
		if (photoGroup) then
			photoGroup:removeSelf()
		end
           composer.gotoScene( "Main menu", "fade", 400 )
end

local function onSceneTouch1( self, event )
		
		if event.phase == "began" then
			

			local function onComplete( event )
				photo = event.target

				--[[photo.x = 300	
				photo.y = 210
				photo.width=100
				photo.height=100
				
				--photo:scale( 0.5, 0.5 )
				   print( "photo w,h = " .. photo.width .. "," .. photo.height )
				for k, v in pairs(photo)do
				   print(k, v)
				end]]
				 photoGroup = display.newGroup()  
			    photoGroup:insert(photo)
			 	photo.x = 300	
				photo.y = 210
   				photo.width=100
				photo.height=100
			    local tmpDirectory = system.DocumentsDirectory
			    display.save(photoGroup, "image.jpg", tmpDirectory) 
 
				
				--photo:setFillColor( 1, 0, 0 ) 
			end
			
			
			local hasAccessToCamera, hasCamera = media.hasSource( media.Camera )

			if ( hasAccessToCamera == true ) then
			    -- There is access to the camera
			    media.capturePhoto( { listener = onComplete } )
			elseif ( hasCamera == true and native.canShowPopup( "requestAppPermission" ) ) then
			    -- A camera exists, but there is no access to it!
			    native.showPopup( "requestAppPermission", { appPermission="Camera" } )
			else
			    native.showAlert( "Corona", "This device does not have a camera.", { "OK" } )
			end



		end
end		        

local function onSceneTouch2( self, event )
		--composer.gotoScene( "Main menu", "slideLeft", 800  )
		--photoGroup:removeSelf()
		if event.phase == "began" then
		    --upload riddle
			local function networkListener( event )
				
				if ( event.isError ) then
	        		print( "Network error: ", event.response )
	    		else

	        		print ( "RESPONSE: " .. event.response )
	        		
	        		local function onComplete( event )
					    if ( event.action == "clicked" ) then
					    	
					        local i = event.index
					        
					        if ( i == 1 ) then
					            -- Do nothing; dialog will simply dismiss
								local function uploadListener( event )
								   if ( event.isError ) then
								      print( "Network Error." )

								      -- This is likely a time out or server being down. In other words,
								      -- It was unable to communicate with the web server. Now if the
								      -- connection to the web server worked, but the request is bad, this
								      -- will be false and you need to look at event.status and event.response
								      -- to see why the web server failed to do what you want.
								   else
								      if ( event.phase == "began" ) then
								         print( "Upload started" )
								      elseif ( event.phase == "progress" ) then
								         print( "Uploading... bytes transferred ", event.bytesTransferred )
								      elseif ( event.phase == "ended" ) then
								         print( "Upload ended..." )
								         print( "Status:", event.status )
								         print( "Response:", event.response )
								      end
								   end
								end
								 local filename2 = "image.jpg"
								
								local headers = {
									timeout = 60,
									process = true,
									bodyType = "binary",
									filename = filename2,
									title = title.text,
								}
								local params = {}
						        
						       
						        local baseDirectory = system.DocumentsDirectory
						        local contentType="image/jpeg"
						        local body 
						        params.headers = headers
						        params.body = body
								 network.upload( 
								    "http://mmlab.lhu.edu.tw/uploads.php", 
								    "PUT", 
								    uploadListener,
								    params, 
								    filename2, 
								    baseDirectory,
								    contentType
								    

								)
								 photoGroup:removeSelf()
								 composer.gotoScene( "Main menu", "slideLeft", 800  )
								
					        elseif ( i == 2 ) then
					            -- Open URL if "Learn More" (second button) was clicked
					        	-- system.openURL( "http://www.coronalabs.com" )
					        end
					    end
					end
					
					local alert = native.showAlert( "Riddle Me There", "創建謎語 獲得50point.", {"OK"}, onComplete )
	    			

	    		end
			end

			local headers = {}

			headers["Content-Type"] = "application/x-www-form-urlencoded"
			headers["Accept-Language"] = "en-US"
			
			local body = "title="..title.text.."&Riddle="..riddle.text.."&lat="..latitude.text.."&lon="..longitude.text.."&email="..nameTable.email
			
			local params = {}
			params.headers = headers
			params.body = body

			network.request( "http://mmlab.lhu.edu.tw/createriddle.php", "POST", networkListener, params )

			
			
			---------------------------------------------------------

			--upload photo
		elseif event.phase == "end" then

			

			
			
		end
end		

local locationHandler = function( event )
	lat = event.latitude
end


function scene:create( event )
	local sceneGroup = self.view
-----------------------------------------------------------------------------------------
	local function fieldHandler( textField )
	return function( event )
		if ( "began" == event.phase ) then
			-- This is the "keyboard has appeared" event
			-- In some cases you may want to adjust the interface when the keyboard appears.
		
		elseif ( "ended" == event.phase ) then
			-- This event is called when the user stops editing a field: for example, when they touch a different field
			
		elseif ( "editing" == event.phase ) then
		
		elseif ( "submitted" == event.phase ) then
			-- This event occurs when the user presses the "return" key (if available) on the onscreen keyboard
			--print( textField().text )
			
			-- Hide keyboard
			native.setKeyboardFocus( nil )
		end
	end
end
-------------------------------------------------------------------------------------
	 latitude = display.newText( "-", -100,-100, native.systemFont, 16 )
	 longitude = display.newText( "-", -100, -100, native.systemFont, 16 )
	local locationHandler = function( event )
		
         if ( event.errorCode ) then
	        
	        print( "Location error: " .. tostring( event.errorMessage ) )
    	else
	        latitudeText = string.format( '%.4f', event.latitude )
	        latitude.text = latitudeText

	        longitudeText = string.format( '%.4f', event.longitude )
       		longitude.text = longitudeText
	    end

	end
	
	image = display.newImage( "muim/Background-5.png" )
	image.x = display.contentCenterX
	image.y = display.contentCenterY	
	
	image1 = display.newImage( "muim/title button.png" )
	image1.x = display.contentWidth/5.5
	image1.y = display.contentHeight/4.5

	image2 = display.newImage( "muim/riddle button.png" )
	image2.x = display.contentWidth/5
	image2.y = display.contentHeight/3

	image3 = display.newImage( "muim/camera.png" )
	image3.x = display.contentWidth/1.6
	image3.y = display.contentHeight/1.5


	image4 = display.newImage( "muim/awnser button.png" )
	image4.x = display.contentWidth/4.6
	image4.y = display.contentHeight/2.2

	image5 = display.newImage( "muim/submit button.png" )
	image5.x = display.contentWidth/4.5
	image5.y = display.contentHeight/1.2

	





	sceneGroup:insert( image )
	sceneGroup:insert( image1 )
	sceneGroup:insert( image2 )
	sceneGroup:insert( image3 )
	sceneGroup:insert( image4 )
	sceneGroup:insert( image5 )




title = native.newTextField( display.contentWidth/1.87, 54, 180, 15 )
	  
	  title:setTextColor( 1,1,1  )
	  title.hasBackground = false
title:addEventListener( "userInput", fieldHandler( function() return title end ) ) 

 riddle = native.newTextBox( 257, 90, 180, 45 )
	  riddle:setTextColor( 1,1,1  )
	  riddle.hasBackground = false
	  riddle.isEditable = true
riddle:addEventListener( "userInput", fieldHandler( function() return riddle end ) ) 



sceneGroup:insert(title)
sceneGroup:insert(riddle)


image5.touch = onSceneTouch2
image3.touch = onSceneTouch1



Runtime:addEventListener("location",locationHandler)

---------------------------------------------------------------  


		local returnPress = widget.newButton
 { 
	
	defaultFile = "muim/returnPress.png",
	overFile = "muim/returnPress.png",
	emboss = true,
	onPress = returnPress,
	--onRelease = button1Release,
 }
     sceneGroup:insert(returnPress)
    returnPress.x =display.contentWidth/1.05
	returnPress.y =display.contentHeight/1.15


end

function scene:show( event )
	local phase = event.phase

		if "did" == phase then

		print( "1: show event, phase did" )
	local showMem = function()
	image5:addEventListener( "touch", image5 )
	image3:addEventListener( "touch", image3 )
		end

		memTimer = timer.performWithDelay( 500, showMem, 1 )
	end	
end

function scene:hide( event )
	local phase = event.phase
	if "will" == phase then
		print( "1: hide event, phase will" )
	image3:addEventListener( "touch", image3 )
	image5:addEventListener( "touch", image5 )
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


