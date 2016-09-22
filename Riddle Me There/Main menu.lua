--Main menu.lua
local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()
local sc = 100

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
	print("abc")
	print(nameTable.email)
	print("qwe")
	sceneGroup:insert( image )	sceneGroup:insert( image4 )
	sceneGroup:insert( image1 ) sceneGroup:insert( image5 )
	sceneGroup:insert( image2 )	sceneGroup:insert( image6 )
	sceneGroup:insert( image3 )	sceneGroup:insert( image7 )

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

			network.request( "http://140.131.12.56/upload.php", "POST", networkListener, params )
		
        elseif ( i == 2 ) then
            -- Open URL if "Learn More" (second button) was clicked
        --    system.openURL( "http://www.coronalabs.com" )
        end
    end
end
local alert = native.showAlert( "Riddle Me There", "登陸獎勵.", {"OK"}, onComplete )

-- Show alert with two buttons
end

function scene:show( event )
	local phase = event.phase
		if "did" == phase then
		print( "1: show event, phase did" )
		composer.removeScene("Login")
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


