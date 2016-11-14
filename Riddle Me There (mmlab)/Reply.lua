--Reply.lua
local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()
local img
local latitude 
local longitudeText 
local latitudeText 
local result
local pic
local displayedPhoto = nil
local photoGroup
local returnPress = function ( self,event )
			if(photoGroup)then
	        	photoGroup:removeSelf()
	        end
           composer.gotoScene( "local", "fade", 400 )
end


local function onSceneTouch( self, event )
		if event.phase == "began" then
			
			local function onComplete( event )
				photo = event.target

				
				photoGroup = display.newGroup()  
			    photoGroup:insert(photo)
			 	photo.x = 230
				photo.y = 130
				photo.width=170
				photo.height=170
			    local tmpDirectory = system.DocumentsDirectory
			    display.save(photoGroup, "image2.jpg", tmpDirectory) 
 
				
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
	if event.phase == "began" then
			local function networkListener( event )
				if ( event.isError ) then
	        		print( "Network error: ", event.response )
	    		else

	        		print ( "RESPONSE: " .. event.response )
	        		result = event.response
	        		
	        		print(result)
	        		
	        		if(result == "correct")then
	        			if(photoGroup)then
	        				photoGroup:removeSelf()
	        			end
	        			composer.gotoScene( "Correct",frad)
	        		elseif(result == "wrong") then
	        			if(photoGroup)then
	        				photoGroup:removeSelf()
	        			end
	        			composer.gotoScene( "wrong",frad)
	        		end
	    		end
			end

			local headers = {}

			headers["Content-Type"] = "application/x-www-form-urlencoded"
			headers["Accept-Language"] = "en-US"
			
			local body = "riddle_id="..nameTable.riddleid.."&lat="..latitude.text.."&lon="..longitude.text.."&email="..nameTable.email
			--local body = "riddle_id=5&lat=25.0477&lon=121.5170"
			print(nameTable.riddleid)
			local params = {}
			params.headers = headers
			params.body = body

			network.request( "http://mmlab.lhu.edu.tw/solveriddle.php", "POST", networkListener, params )
	end
end
local function onSceneTouch3( self, event )
		--[[if media.hasSource( media.PhotoLibrary ) then
 --  media.selectPhoto( { mediaSource=media.PhotoLibrary, listener=onComplete } )--選擇照片
    	 media.capturePhoto( { listener=onComplete } )--拍照
     
	else
   native.showAlert( "Corona", "This device does not have a photo library.", { "OK" } )
end]]
	

end
function scene:create( event )
	local sceneGroup = self.view

	


display.setStatusBar( display.HiddenStatusBar )

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
	
	image = display.newImage( "muim/background-10.png" )
	image.x = display.contentCenterX
	image.y = display.contentCenterY
	
	image1 = display.newImage( "muim/retake button.png" )--重拍照片
	image1.x = display.contentWidth/5.2
	image1.y = display.contentHeight/1.3

	image2 = display.newImage( "muim/use button.png" )--使用照片
	image2.x = display.contentWidth/9
	image2.y = display.contentHeight/1.7

	image3 = display.newImage( "muim/camera.png" )
	image3.x = display.contentWidth/2.2
	image3.y = display.contentHeight/2.3
	
	sceneGroup:insert( image )	
	sceneGroup:insert( image1 )	
	sceneGroup:insert( image2 )	
	sceneGroup:insert( image3 )	
	image3.touch = onSceneTouch
	image2.touch = onSceneTouch2
	image1.touch = onSceneTouch3
	Runtime:addEventListener("location",locationHandler)



		local returnPress = widget.newButton
 { 
	
	defaultFile = "muim/returnPress.png",
	overFile = "muim/returnPress.png",
	emboss = true,
	onPress = returnPress,
	--onRelease = button1Release,
 }
     sceneGroup:insert(returnPress)
    returnPress.x =display.contentWidth/10
	returnPress.y =display.contentHeight/8.5
end

function scene:show( event )
	local phase = event.phase
		
		if "did" == phase then
		print( "1: show event, phase did" )
		composer.removeScene( "local" )
		
	local showMem = function()
		image1:addEventListener( "touch", image1 )
		image2:addEventListener( "touch", image2 )
		image3:addEventListener( "touch", image3 )
		end
		memTimer = timer.performWithDelay( 500, showMem, 1 )
	end	


end

function scene:hide( event )
	local phase = event.phase
	if "will" == phase then
		image1:addEventListener( "touch", image1 ) 
		image2:addEventListener( "touch", image2 )
		image3:addEventListener( "touch", image3 )
		print( "1: hide event, phase will" )
	end
end



function scene:destroy( event )
	print( "((destroying scene 1's view))" )
	print("destroy")
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene


