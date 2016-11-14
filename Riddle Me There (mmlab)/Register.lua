--Register.lua
local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()
local image
local Gender = "male"
local json = require ( "json" )
local network2

nameTable.country = 1
----------------------------------------------------------------------------------------------------
local returnPress = function ( self,event ) 
           composer.gotoScene( "Front cover", "fade", 400 )
end


local function onSceneTouch( self, event )
	if event.phase == "began" then
		nameTable.country = 1
		composer.gotoScene( "Country", "slideLeft", 950  )
		return true
	end
end





---------------------------------------------------------------------------------------------------

function scene:create( event )
	local sceneGroup = self.view
	local idtable 
	local decodedData ={}
	display.setStatusBar( display.HiddenStatusBar )


	
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
local email = native.newTextField( display.contentWidth/2.5, 80, 110, 16 )
	  
	  email:setTextColor(  1, 1, 1  )
	  email.hasBackground = false
	email:addEventListener( "userInput", fieldHandler( function() return email end ) )
	  

local password = native.newTextField( display.contentWidth/2.4, 127, 110, 16 )
	
	 password:setTextColor(  1, 1,1 )
	 password.hasBackground = false
	 password.isSecure = true
password:addEventListener( "userInput", fieldHandler( function() return password end ) )

local username = native.newTextField( display.contentWidth/2.4, 105, 110, 16 )
	  
	  username:setTextColor( 1,1 , 1 )
	  username.hasBackground = false
	  username:addEventListener( "userInput", fieldHandler( function() return username end ) )

local age = native.newTextField( display.contentWidth/2.5, 150 , 110, 16 )
	  
	  age:setTextColor(  1, 1, 1  )
	  age.hasBackground = false
	  age.inputType = "number"
	  age:addEventListener( "userInput", fieldHandler( function() return age end ) )

local Firstname = native.newTextField( display.contentWidth/1.8, 210, 85, 16 )
	  
	  Firstname:setTextColor(  1, 1, 1 )
	  Firstname.hasBackground = false
	  Firstname:addEventListener( "userInput", fieldHandler( function() return Firstname end ) )

local Lastname = native.newTextField( display.contentWidth/1.8, 240, 85, 16)
	  
	  Lastname:setTextColor(  1, 1, 1  )
	  Lastname.hasBackground = false
	  Lastname:addEventListener( "userInput", fieldHandler( function() return Lastname end ) )

    sceneGroup:insert(Lastname)
    sceneGroup:insert(Firstname)
	sceneGroup:insert(age)
	sceneGroup:insert(username)
	sceneGroup:insert(password)
	sceneGroup:insert(email)
-----------------------------------------------------------------------------------------
local function onSceneTouch1( self, event )
		

		if event.phase == "began" then
			local function networkListener( event )
				if ( event.isError ) then
	        		print( "Network error: ", event.response )
	    		else

	        		print ( "RESPONSE1: " .. event.response )

	        		idtable = event.response
		            decodedData=json.decode(idtable)    
		            
		            
					if(idtable  == "correct")then
--------------------------------------------------------------------------------------------
					--把country加到資料庫
						local function networkListener2( event )
							if ( event.isError ) then
				        		print( "Network error: ", event.response )
				    		else
				    			print ( "RESPONSE2: " .. event.response )
				    			local function networkListener3( event )
									if ( event.isError ) then
						        		print( "Network error: ", event.response )
						    		else
						    			print ( "RESPONSE3: " .. event.response )
						    			composer.gotoScene( "Login", "slideLeft", 800  )
						    		end
								end

								local headers = {}

								headers["Content-Type"] = "application/x-www-form-urlencoded"
								headers["Accept-Language"] = "en-US"
								
								local body = "email="..email.text
								
								local params = {}
								params.headers = headers
								params.body = body

								network.request( "http://mmlab.lhu.edu.tw/randomnumber.php", "POST", networkListener3, params )
				    			
				    		end
						end

						local headers = {}

						headers["Content-Type"] = "application/x-www-form-urlencoded"
						headers["Accept-Language"] = "en-US"
						
						local body2 = "email="..email.text.."&country="..session.."&firstname="..Firstname.text.."&lastname="..Lastname.text.."&gender="..Gender
						
						local params = {}
						params.headers = headers
						params.body = body2

						network.request( "http://mmlab.lhu.edu.tw/Register2.php", "POST", networkListener2, params )

--------------------------------------------------------------------------------------------
						
					else
					--error
						--把錯誤的值插入到errormessage
						local errormessage = {}
						local j = 1
						for i=1,5 do
							if(decodedData[i] == nil) then
							
							else
								table.insert(errormessage,j,decodedData[i])
								j= j+1
							end
						end
						
						local function onComplete( event )
						    if ( event.action == "clicked" ) then
						    	
						        local i = event.index
						        
						        if ( i == 1 ) then
						            -- Do nothing; dialog will simply dismiss
									for j=#decodedData,1,-1 do
										table.remove(errormessage,j)
									end
								
						        elseif ( i == 2 ) then
						            -- Open URL if "Learn More" (second button) was clicked
						        --    system.openURL( "http://www.coronalabs.com" )
						        end
						    end
						end
						
						print(#errormessage)
						--顯示回傳錯誤訊息
						if(#errormessage == 5) then
						
							alert = native.showAlert( "Riddle Me There", errormessage[1].."\n"..errormessage[2].."\n"..errormessage[3].."\n"..errormessage[4].."\n"..errormessage[5], {"OK"}, onComplete )
						elseif(#errormessage == 4) then
							alert = native.showAlert( "Riddle Me There", errormessage[1].."\n"..errormessage[2].."\n"..errormessage[3].."\n"..errormessage[4], {"OK"}, onComplete )
						elseif(#errormessage == 3) then
							alert = native.showAlert( "Riddle Me There", errormessage[1].."\n"..errormessage[2].."\n"..errormessage[3], {"OK"}, onComplete )
						elseif(#errormessage == 2) then
							alert = native.showAlert( "Riddle Me There", errormessage[1].."\n"..errormessage[2], {"OK"}, onComplete )
						elseif(#errormessage == 1) then
							alert = native.showAlert( "Riddle Me There", errormessage[1], {"OK"}, onComplete )
						end
					end
	    		end
			end

			local headers = {}

			headers["Content-Type"] = "application/x-www-form-urlencoded"
			headers["Accept-Language"] = "en-US"
			
			local body = "email="..email.text.."&password="..password.text.."&username="..username.text.."&age="..age.text.."&country="..session.."&gender="..Gender.."&firstname="..Firstname.text.."&lastname="..Lastname.text
			
			local params = {}
			params.headers = headers
			params.body = body

			network.request( "http://mmlab.lhu.edu.tw/Register.php", "POST", networkListener, params )

		


			
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

	image9 = display.newImage( "muim/Firstname.png" )
	image9.x = display.contentWidth/3.2
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

	image15 = display.newImage( "muim/native3.png" )
	image15.x = display.contentWidth/1.8
	image15.y = display.contentHeight/1.53

	image16 = display.newImage( "muim/quill.png" )
	image16.x = display.contentWidth/1.2
	image16.y = display.contentHeight/1.7

	image17 = display.newImage( "muim/more.png" )
	image17.x = display.contentWidth/1.8
	image17.y = display.contentHeight/6

	image18 = display.newImage( "muim/Lastname.png" )
	image18.x = display.contentWidth/3.1
	image18.y = display.contentHeight/1.35

	image19 = display.newImage( "muim/native3.png" )
	image19.x = display.contentWidth/1.8
	image19.y = display.contentHeight/1.33

-------------------------------------------------------------------------

	sceneGroup:insert( image )  sceneGroup:insert( image10)  sceneGroup:insert( image11)  
	sceneGroup:insert( image0)  sceneGroup:insert( image5)	sceneGroup:insert( image12)
	sceneGroup:insert( image1)  sceneGroup:insert( image6)	sceneGroup:insert( image13)
	sceneGroup:insert( image2)  sceneGroup:insert( image7)	sceneGroup:insert( image14)
	sceneGroup:insert( image3)  sceneGroup:insert( image8)	sceneGroup:insert( image15)
	sceneGroup:insert( image4)  sceneGroup:insert( image9)	sceneGroup:insert( image16)
	sceneGroup:insert( image17) sceneGroup:insert( image18)	sceneGroup:insert( image19)
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
        id = "Male",
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
        id = "Female",
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


