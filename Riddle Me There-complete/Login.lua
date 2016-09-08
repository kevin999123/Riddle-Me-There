--Login.lua
local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()
local image
local logintable 
local decodedData ={}
local auto = "Yes"
local email
local password
----------------------------------------------------------------
local returnPress = function ( self,event ) 
           composer.gotoScene( "Front cover", "fade", 400 )
end


local function onSceneTouch1( self, event )
		if event.phase == "began" then
			local function networkListener( event )
				if ( event.isError ) then
	        		print( "Network error: ", event.response )
	    		else

	        		print ( "RESPONSE: " .. event.response )

	        		if (event.response == "true") then
	        			composer.gotoScene("Register",fade,500)
	        		else
	        		end
	    		end
			end
			print(email.text);
			local headers = {}

			headers["Content-Type"] = "application/x-www-form-urlencoded"
			headers["Accept-Language"] = "en-US"

			local body = "email="..email.text.."&password="..password.text.."&auto="..auto

			local params = {}
			params.headers = headers
			params.body = body

			network.request( "http://140.131.12.57/login.php", "POST", networkListener, params )

			
			
		--[[	if()then
				composer.gotoScene( "Homepage", "slideLeft", 800  )
			else

			end]]

		end
	end

----------------------------------------------------------------

function scene:create( event )
	local sceneGroup = self.view
	image = display.newImage( "muim/background.png" )
	image.x = display.contentCenterX
	image.y = display.contentCenterY
	
	image1 = display.newImage( "muim/automatic login.png" )
	image1.x = display.contentWidth/2.8
	image1.y = display.contentHeight/1.8

	image2 = display.newImage( "muim/email.png" )
	image2.x = display.contentWidth/4
	image2.y = display.contentHeight/3

	image3 = display.newImage( "muim/password.png" )
	image3.x = display.contentWidth/4
	image3.y = display.contentHeight/2.3

	image4 = display.newImage( "muim/yes.png" )
	image4.x = display.contentWidth/2.4
	image4.y = display.contentHeight/1.45

	image5 = display.newImage( "muim/no.png" )
	image5.x = display.contentWidth/1.7
	image5.y = display.contentHeight/1.45


	image6 = display.newImage( "muim/native.png" )
	image6.x = display.contentWidth/2.2
	image6.y = display.contentHeight/3

	image7 = display.newImage( "muim/native.png" )
	image7.x = display.contentWidth/2.2
	image7.y = display.contentHeight/2.3

	image8 = display.newImage( "muim/Login buttom1.png" )
	image8.x = display.contentWidth/1.4
	image8 .y = display.contentHeight/1.125

	sceneGroup:insert( image )	sceneGroup:insert( image5 )
	sceneGroup:insert( image1 ) sceneGroup:insert( image6 )
	sceneGroup:insert( image2 )	sceneGroup:insert( image7 )
	sceneGroup:insert( image3 )	sceneGroup:insert( image8 )
	sceneGroup:insert( image4 )

	image8.touch = onSceneTouch1
-------------------------------------------------------------------
	 email = native.newTextField( display.contentWidth/2.2, 105, 110, 15 )
	  
	 email:setTextColor(  1, 1, 1  )
	 email.hasBackground = false

	 password = native.newTextField( display.contentWidth/2.2, 140, 110, 15 )
 	
 	 password:setTextColor(  1, 1, 1  )
	 password.hasBackground = false



    sceneGroup:insert(email)
    sceneGroup:insert(password)

-------------------------------------------------------------------
local function onSwitchPress( event )
    local switch = event.target

    print( "Switch with ID '"..switch.id.."' is on: "..tostring(switch.isOn) )
    auto = switch.id
end
-- Create two associated radio buttons (inserted into the same display group)
local radioButton1 = widget.newSwitch(
    {
        left = 150,
        top = 200,
        style = "radio",
        id = "Yes",
        initialSwitchState = true,
        onPress = onSwitchPress
    }
)
sceneGroup:insert( radioButton1 )

local radioButton2 = widget.newSwitch(
    {
        left = 230,
        top = 200,
        style = "radio",
        id = "No",
        onPress = onSwitchPress
    }
)
sceneGroup:insert( radioButton2 )





-----------------------------------------------------------------------------------	
local returnPress = widget.newButton
 { 
	
	defaultFile = "muim/return.png",
	overFile = "muim/return.png",
	emboss = true,
	onPress = returnPress,
	--onRelease = button1Release,
 }
     sceneGroup:insert(returnPress)
    returnPress.x =display.contentWidth/4.5
	returnPress.y =display.contentHeight/1.1

end
--------------------------------------------------------------------------------------
function scene:show( event )
	local phase = event.phase


		composer.removeScene( "Front cover" )


	if "did" == phase then
		print( "1: show event, phase did" )
		local showMem = function()
	image8:addEventListener( "touch", image8 )
		end
		memTimer = timer.performWithDelay( 500, showMem, 1 )
	end	
end

function scene:hide( event )
	local phase = event.phase
	if "will" == phase then
	image8:addEventListener( "touch", image8 )

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


