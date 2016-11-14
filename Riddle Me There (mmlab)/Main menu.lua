--Main menu.lua
local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()
local json = require("json")
local sc = 100
local image,image1,image2,image3,image4,image5,image6,image7,image8
local longitudeText 
local latitudeText
local value 
local function onSceneTouch1( self, event )
	if event.phase == "began" then
		composer.gotoScene( "Solve","fade", 400  )
		
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
		        		
		        		
		    		end
				end

				local headers = {}

				headers["Content-Type"] = "application/x-www-form-urlencoded"
				headers["Accept-Language"] = "en-US"
				print(latitude.text)
				print(longitude.text)
				local body = "lat="..latitude.text.."&lon="..longitude.text.."&email="..nameTable.email
				--local body = "riddle_id=5&lat=25.0477&lon=121.5170"
				
				local params = {}
				params.headers = headers
				params.body = body

				network.request( "http://mmlab.lhu.edu.tw/uploadCoordinates.php", "POST", networkListener, params )
				composer.gotoScene( "Create", "fade", 400  )
	end
end

local function onSceneTouch3( self, event )
	if event.phase == "began" then
		composer.gotoScene( "area", "fade", 400  )
		
	end
end

local function onSceneTouch4( self, event )
	if event.phase == "began" then
		composer.gotoScene( "Friends","fade", 400  )

		
	end
end

local function onSceneTouch5( self, event )
	if event.phase == "began" then
		composer.gotoScene( "Profile","fade", 400  )
		
	end
end

local function onSceneTouch6( self, event )
	if event.phase == "began" then
		composer.gotoScene( "Scores", "fade", 400  )
		
	end
end

local function onSceneTouch7( self, event )
	if event.phase == "began" then
		composer.gotoScene( "Extra", "fade", 400  )
		
	end
end



function scene:create( event )
	local sceneGroup = self.view
	local alert
	--local backgroundMusic = audio.loadStream("music1.mp3")
	--local backgroundMusicChannel = audio.play( backgroundMusic, { channel=1, loops=-1 } )
	--audio.setVolume( 0.2, { channel=1 } )

	display.setStatusBar( display.HiddenStatusBar )




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


	image1.touch = onSceneTouch1
	image2.touch = onSceneTouch2 
	image3.touch = onSceneTouch3 
	image4.touch = onSceneTouch4 
	image5.touch = onSceneTouch5 
	image6.touch = onSceneTouch6  
	image7.touch = onSceneTouch7 

	--彈跳視窗
local function onComplete( event )
    if ( event.action == "clicked" ) then
    	
        local i = event.index
        
        if ( i == 1 ) then
            -- Do nothing; dialog will simply dismiss
			local function networkListener( event )
				if ( event.isError ) then
	        		print("Network error!")
	    		else
	        		myNewData = event.response
					print ( "From server: " .. myNewData)--印出json
	    		end
			end

			local headers = {}

			headers["Content-Type"] = "application/x-www-form-urlencoded"
			headers["Accept-Language"] = "en-US"
			
			local body = "Score="..sc.."&name="..nameTable.name.."&email="..nameTable.email
			
			local params = {}
			params.headers = headers
			params.body = body

			network.request( "http://mmlab.lhu.edu.tw/uploadscore.php", "POST", networkListener, params )
		
        elseif ( i == 2 ) then
            -- Open URL if "Learn More" (second button) was clicked
        --    system.openURL( "http://www.coronalabs.com" )
        end
    end
end

			local function networkListener2( event )
				
				if ( event.isError ) then
	        		print( "Network error: ", event.response )
	    		else

	        		print ( "RESPONSE: " .. event.response )
	        		value = event.response
	        		 decodedData=json.decode(value)
	        		--print("112")
	        		print(value)
	        		if (decodedData == nil) then
	        	   		local path = system.pathForFile("automatic login.txt",system.DocumentsDirectory)
						local file = io.open(path,"r")
						local content
						if (file) then
							content = file:read("*a")
							io.close(file)
						end
						if(content) then

						else
	        	   			alert = native.showAlert( "Riddle Me There", "登陸獎勵.", {"OK"}, onComplete )
	        	   		end
	        	   	else

	        	   	end	
	    		end
			end

			local headers = {}

			headers["Content-Type"] = "application/x-www-form-urlencoded"
			headers["Accept-Language"] = "en-US"
			
			local body = "email="..nameTable.email
			
			local params = {}
			params.headers = headers
			params.body = body
			print("123")
			network.request( "http://mmlab.lhu.edu.tw/scorecheck.php", "POST", networkListener2, params )
			print("456")

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
       		print(longitudeText)
	    end

	end



	Runtime:addEventListener("location",locationHandler) 




-- Show alert with two buttons
end

function scene:show( event )
	local phase = event.phase
		composer.removeScene("Solve")
		composer.removeScene("Login")
		composer.removeScene("Correct")
		composer.removeScene( "wrong" )
		composer.removeScene( "Create" )
		composer.removeScene( "local" )
		composer.removeScene( "Profile" )
		composer.removeScene( "map" )
		composer.removeScene( "personal" )
		composer.removeScene( "Score" )
		composer.removeScene( "Global" )
		composer.removeScene( "countryscore" )
		composer.removeScene( "Friends" )

		if "did" == phase then
		print( "1: show event, phase did" )
		
	local showMem = function()
		image1:addEventListener( "touch", image1 )
		image2:addEventListener( "touch", image2 )
		image3:addEventListener( "touch", image3 )
		image4:addEventListener( "touch", image4 )
		image5:addEventListener( "touch", image5 )
		image6:addEventListener( "touch", image6 )
		image7:addEventListener( "touch", image7 )
		
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
		image3:removeEventListener( "touch", image3 )
		image4:removeEventListener( "touch", image4 )
		image5:removeEventListener( "touch", image5 )
		image6:removeEventListener( "touch", image6 )
		image7:removeEventListener( "touch", image7 )
		

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


