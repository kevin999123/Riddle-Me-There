--Register.lua
local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()
local image
local Gender = "male"
local json = require ( "json" )
local network2
----------------------------------------------------------------------------------------------------
local returnPress = function ( self,event ) 
           composer.gotoScene( "Front cover", "fade", 400 )
end


local function onSceneTouch( self, event )
	if event.phase == "began" then
		composer.gotoScene( "Country", "slideLeft", 800  )
		return true
	end
end





---------------------------------------------------------------------------------------------------

function scene:create( event )
	local sceneGroup = self.view
	local idtable 
	local decodedData ={}

local email = native.newTextField( display.contentWidth/2.5, 80, 110, 15 )
	  
	  email:setTextColor(  0, 0, 0  )
	  email.hasBackground = false
	 
	  

local password = native.newTextField( display.contentWidth/2.4, 127, 110, 15 )
	 
	 password:setTextColor(  0, 0, 0  )
	 password.hasBackground = false
	  

local username = native.newTextField( display.contentWidth/2.4, 105, 110, 15 )
	  
	  username:setTextColor(  0, 0, 0 )
	  username.hasBackground = false
	 

local age = native.newTextField( display.contentWidth/2.5, 150 , 110, 15 )
	  
	  age:setTextColor(  0, 0, 0  )
	  age.hasBackground = false
	  

local FE = native.newTextField( display.contentWidth/2.7, 230, 150, 15 )
	  
	  FE:setTextColor(  0, 0, 0 )
	  FE.hasBackground = false
	  

--[[local country = native.newTextField( display.contentWidth/2.4, 126, 110, 15 )
	  
	  country:setTextColor(  1, 1, 1  )
	  country.hasBackground = false

    sceneGroup:insert(country)]]
    sceneGroup:insert(FE)
	sceneGroup:insert(age)
	sceneGroup:insert(username)
	sceneGroup:insert(password)
	sceneGroup:insert(email)
-----------------------------------------------------------------------------------------
local function onSceneTouch1( self, event )
		
		if event.phase == "began" then
			local function networkListener( event )
				if ( event.isError ) then
	        		--print( "Network error: ", event.response )
	    		else

	        		--print ( "RESPONSE: " .. event.response )
	    		end
			end

			local headers = {}

			headers["Content-Type"] = "application/x-www-form-urlencoded"
			headers["Accept-Language"] = "en-US"
			
			local body = "email="..email.text.."&password="..password.text.."&username="..username.text.."&age="..age.text.."&recommend="..FE.text.."&country="..session.."&gender="..Gender

			local params = {}
			params.headers = headers
			params.body = body

			network.request( "http://140.131.12.56/Register.php", "POST", networkListener, params )

		elseif ( event.phase == "ended" ) then

			local function networkListener2( event )
	    
	        	if ( event.isError ) then
	            	print( "Network error!" )
	        	else
				 	myNewData = event.response
		            print ( "From server: " .. myNewData)--印出json
		            decodedData = json.decode(myNewData)
		            if(decodedData == nil) then
		            	print("空")
		            else
		            	print("有")
		            end
		            
		            
		            idtable = decodedData["result"]
		                
		            print(idtable)
		            
					if(idtable  == "correct")then
						composer.gotoScene( "Login", "slideLeft", 800  )
					else

					end
				end
			end
		    network2 = network.request("http://140.131.12.56/RegisterSuccess.php", "GET", networkListener2) --從資料庫取得json
			--[[for i=1,2 do
				network.request("http://140.131.12.56/RegisterSuccess.php", "GET", networkListener2)
				memTimer = timer.performWithDelay( 500, networkListener2, 1 )
			end]]
		end
	end
------------------------------------------------------------------------------------------
	image = display.newImage( "muim/Background-1.png" )
	image.x = display.contentCenterX
	image.y = display.contentCenterY

	image0 = display.newImage( "muim/native.png" )
	image0.x = display.contentWidth/2.5
	image0.y = display.contentHeight/6
	
	image1 = display.newImage( "muim/Register buttom.png" )
	image1.x = display.contentWidth/1.2
	image1.y = display.contentHeight/1.1

	image2 = display.newImage( "muim/country.png" )
	image2.x = display.contentWidth/5
	image2.y = display.contentHeight/6

	image3 = display.newImage( "muim/email.png" )
	image3.x = display.contentWidth/4.8
	image3.y = display.contentHeight/4

	image4 = display.newImage( "muim/username.png" )
	image4.x = display.contentWidth/4.8
	image4.y = display.contentHeight/3

	image5 = display.newImage( "muim/password.png" )
	image5.x = display.contentWidth/4.8
	image5.y = display.contentHeight/2.5

	image6 = display.newImage( "muim/age.png" )
	image6.x = display.contentWidth/4.5
	image6.y = display.contentHeight/2.1

	image7 = display.newImage( "muim/Gender.png" )
	image7.x = display.contentWidth/3.8
	image7.y = display.contentHeight/1.8


	image8 = display.newImage( "muim/male.png" )
	image8.x = display.contentWidth/2.25
	image8.y = display.contentHeight/1.8

	image9 = display.newImage( "muim/FE.png" )
	image9.x = display.contentWidth/2.7
	image9.y = display.contentHeight/1.55

	image10 = display.newImage( "muim/female.png" )
	image10.x = display.contentWidth/1.7
	image10.y = display.contentHeight/1.8


	image11 = display.newImage( "muim/native.png" )
	image11.x = display.contentWidth/2.5
	image11.y = display.contentHeight/4

	image12 = display.newImage( "muim/native.png" )
	image12.x = display.contentWidth/2.4
	image12.y = display.contentHeight/3
--13 country
	image13 = display.newImage( "muim/native.png" )
	image13.x = display.contentWidth/2.4
	image13.y = display.contentHeight/2.5

	image14 = display.newImage( "muim/native.png" )
	image14.x = display.contentWidth/2.5
	image14.y = display.contentHeight/2.1

	image15 = display.newImage( "muim/native1.png" )
	image15.x = display.contentWidth/2.7
	image15.y = display.contentHeight/1.4

	image16 = display.newImage( "muim/quill.png" )
	image16.x = display.contentWidth/1.2
	image16.y = display.contentHeight/1.7

	image17 = display.newImage( "muim/more.png" )
	image17.x = display.contentWidth/1.8
	image17.y = display.contentHeight/6



-------------------------------------------------------------------------

	sceneGroup:insert( image ) sceneGroup:insert( image10)  sceneGroup:insert( image11)  
	sceneGroup:insert( image0) sceneGroup:insert( image5)	sceneGroup:insert( image12)
	sceneGroup:insert( image1) sceneGroup:insert( image6)	sceneGroup:insert( image13)
	sceneGroup:insert( image2) sceneGroup:insert( image7)	sceneGroup:insert( image14)
	sceneGroup:insert( image3) sceneGroup:insert( image8)	sceneGroup:insert( image15)
	sceneGroup:insert( image4) sceneGroup:insert( image9)	sceneGroup:insert( image16)
	sceneGroup:insert( image17)
-------------------------------------------------------------------------	

	image1.touch = onSceneTouch1
	image17.touch = onSceneTouch
	
-------------------------------------------------------------------------

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
--------------------------------------------------------------------------
-- Handle press events for the buttons
local function onSwitchPress( event )

    local switch = event.target
    print( "Switch with ID '"..switch.id.."' is on: "..tostring(switch.isOn) )
    Gender = switch.id
    print(Gender)
end
-- Create two associated radio buttons (inserted into the same display group)
local radioButton1 = widget.newSwitch(
    {
        left = 170,
        top = 165,
        style = "radio",
        id = "male",
        initialSwitchState = true,
        onPress = onSwitchPress
    }
)
sceneGroup:insert( radioButton1 )

local radioButton2 = widget.newSwitch(
    {
        left = 230,
        top = 165,
        style = "radio",
        id = "female",
        onPress = onSwitchPress
    }
)
sceneGroup:insert( radioButton2 )
------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
 print("session[Register.lua]) = ".. session)

if session == 0 then
	
	local myText1 = display.newText("Select...", display.contentWidth/2.5,display.contentHeight/6, native.systemFontBold,16)
    myText1:setTextColor(1, 1, 1) 
    sceneGroup:insert(myText1)
    
else	
   
   local myText1 = display.newText(session, display.contentWidth/2.5,display.contentHeight/6, native.systemFontBold,16)
    myText1:setTextColor(1, 1, 1) 

 sceneGroup:insert(myText1)
 
 end

---------------------------------------------------------------------------------------------------

local function onRowTouch( event )
        local phase = event.phase
        local row = event.row
        local rowIndex=row.index
        if ( "release" == phase ) then
          composer.gotoScene( "country", "fade", 400 )

        end
    end


end


---------------------------------------------------------------------------------------------------
function scene:show( event )
	local phase = event.phase
	composer.removeScene( "Front cover" )
	composer.removeScene( "country" )

	if "did" == phase then
		print( "1: show event, phase did" )
local showMem = function()
	image1:addEventListener( "touch", image1 )
	image17:addEventListener( "touch", image17 )
	
	end
		memTimer = timer.performWithDelay( 500, showMem, 1 )
	end	
end

function scene:hide( event )
	local phase = event.phase
	if "will" == phase then
		print( "1: hide event, phase will" )
	image1:removeEventListener( "touch", image1 )
	image17:removeEventListener( "touch", image17 )
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


