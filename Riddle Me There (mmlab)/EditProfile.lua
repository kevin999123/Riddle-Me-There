--EditProfile.LUA

local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()
local json = require("json")
local decodedData
local namevalue
local countryvalue = nil
local agevalue,sexvalue
local password,email,username,countryl,myText1
nameTable.country = 2
-------------------------------------------------------
local function onSceneTouch1( self, event )
	if event.phase == "began" then
		composer.gotoScene( "Profile", "slideLeft", 800  )
		
	end
end
local function onSceneTouch( self, event )
	if event.phase == "began" then
		nameTable.country = 2
		composer.gotoScene( "Country", "slideLeft", 800  )
		return true
	end
end


print(nameTable.country2)

function scene:create( event )
	local sceneGroup = self.view


	display.setStatusBar( display.HiddenStatusBar )
	image = display.newImage( "muim/background-17.png" )
	image.x = display.contentCenterX
	image.y = display.contentCenterY
	
	image1 = display.newImage( "muim/Profile.png" )
	image1.x = display.contentWidth/1.1
	image1.y = display.contentHeight/2.3


	image2 = display.newImage( "muim/EditProfile.png" )
	image2.x = display.contentWidth/1.17
	image2.y = display.contentHeight/1.75

	image3 = display.newImage( "muim/email button.png" )
	image3.x = display.contentWidth/2.2
	image3.y = display.contentHeight/7

	image4 = display.newImage( "muim/password button.png" )
	image4.x = display.contentWidth/2.3
	image4.y = display.contentHeight/4.3

	image5 = display.newImage( "muim/username button.png" )
	image5.x = display.contentWidth/2.35
	image5.y = display.contentHeight/3

	image6 = display.newImage( "muim/country.png" )
	image6.x = display.contentWidth/3.6
	image6.y = display.contentHeight/2

	image7 = display.newImage( "muim/native.png" )
	image7.x = display.contentWidth/2.1
	image7.y = display.contentHeight/2

	image8 = display.newImage( "muim/more.png" )
	image8.x = display.contentWidth/1.6
	image8.y = display.contentHeight/2

	image9 = display.newImage( "muim/FE.png" )
	image9.x = display.contentWidth/2.7
	image9.y = display.contentHeight/1.65

	image10 = display.newImage( "muim/native1.png" )
	image10.x = display.contentWidth/2.2
	image10.y = display.contentHeight/1.45


	sceneGroup:insert( image)	
	sceneGroup:insert( image1)	
	sceneGroup:insert( image2)	
	sceneGroup:insert( image3)
	sceneGroup:insert( image4)
	sceneGroup:insert( image5)
	sceneGroup:insert( image6)
	sceneGroup:insert( image7)
	sceneGroup:insert( image8)
	sceneGroup:insert( image9)
	sceneGroup:insert( image10)



	image1.touch = onSceneTouch1
	image8.touch = onSceneTouch

------------------------------------------------------------------------------------------------------------
	local function networkListener( event )
		if ( event.isError ) then
		   print( "Network error: ", event.response )
		else

		    print ( "RESPONSE: " .. event.response )
		    decodedData = json.decode(event.response)

		     
		    	
				namevalue = decodedData[1]
				countryvalue = decodedData[2]
				agevalue = decodedData[3]
				sexvalue = decodedData[4]

		    	nameTable.country2 = countryvalue
		    	
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
		     email = display.newText(nameTable.email, display.contentWidth/1.89, 45,nil , 10 )
	  
			  email:setTextColor(  1, 1, 1  )
			  email.hasBackground = false
			  sceneGroup:insert( email)
			 password = native.newTextField( display.contentWidth/1.9, 75, 123, 16 )
				
				 password:setTextColor(  1, 1,1 )
				 password.hasBackground = false
				 password.isSecure = true
			   	 password:addEventListener( "userInput", fieldHandler( function() return password end ) )
				 sceneGroup:insert( password)
			 username = native.newTextField( display.contentWidth/1.93, 107, 115, 16 )
				  
				  username:setTextColor( 1,1 , 1 )
				  username.hasBackground = false
				  username:addEventListener( "userInput", fieldHandler( function() return username end ) )
				  username.text = namevalue
				  sceneGroup:insert( username)

			 
			
			if session == 0 then
	
				myText1 = display.newText(countryvalue,display.contentWidth/2.1,158, native.systemFontBold,16)
			    myText1:setTextColor(1, 1, 1) 
			    sceneGroup:insert(myText1)
    
			else	
   
			   myText1 = display.newText(session,display.contentWidth/2.1,158, native.systemFontBold,16)
			    myText1:setTextColor(1, 1, 1) 

			 	sceneGroup:insert(myText1)
 			print(password.text)
			
	 		end
			local returnPress = function ( self,event ) 
				local function onComplete( event )
				    if ( event.action == "clicked" ) then
				    	
				        local i = event.index
				        
				        if ( i == 1 ) then
				           	local function networkListener( event )
								if ( event.isError ) then
								   print( "Network error: ", event.response )
								else

								    print ( "RESPONSE: " .. event.response )
								    decodedData = json.decode(event.response)
								    local function onComplete2( event )
									    if ( event.action == "clicked" ) then
									    	
									        local i = event.index
									        
									        if ( i == 1 ) then
									            -- Do nothing; dialog will simply dismiss
												
												composer.gotoScene( "Main menu","fade", 400  )
									        elseif ( i == 2 ) then
									            -- Open URL if "Learn More" (second button) was clicked
									        --    system.openURL( "http://www.coronalabs.com" )
									        end
									    end
									end
								    local alert2 = native.showAlert( "Riddle Me There", "修改成功", { "確認" }, onComplete2 )

								end
							end

							local headers = {}

							headers["Content-Type"] = "application/x-www-form-urlencoded"
							headers["Accept-Language"] = "en-US"

							local body = "email="..nameTable.email.."&password="..password.text.."&username="..username.text.."&country="..session
							
										
							local params = {}
							params.headers = headers
							params.body = body

							network.request( "http://mmlab.lhu.edu.tw/editprofile.php", "POST", networkListener, params )
						
				        elseif ( i == 2 ) then
				            -- Open URL if "Learn More" (second button) was clicked
				        --    system.openURL( "http://www.coronalabs.com" )
				        end
				    end
				end
				local alert = native.showAlert( "Riddle Me There", "確認是否修改資料?", { "確認", "取消" }, onComplete )
			   
			end

			local returnPress = widget.newButton
			 { 
				
				defaultFile = "muim/modify1.png",
				overFile = "muim/modify0.png",
				emboss = true,
				onPress = returnPress,
				--onRelease = button1Release,
			 }
			sceneGroup:insert(returnPress)
			returnPress.x =display.contentWidth/2.4
			returnPress.y =display.contentHeight/1.15	
		end
	end

	local headers = {}

	headers["Content-Type"] = "application/x-www-form-urlencoded"
	headers["Accept-Language"] = "en-US"
	
	local body = "email="..nameTable.email
	
				
	local params = {}
	params.headers = headers
	params.body = body

	network.request( "http://mmlab.lhu.edu.tw/searcheditprofile.php", "POST", networkListener, params )






end
----------------------------------------------------------------------------------------------------------
function scene:show( event )
	local phase = event.phase
	composer.removeScene("Profile")
	composer.removeScene("Country")
	if "did" == phase then
		print( "1: show event, phase did" )

local showMem = function()	
		image1:addEventListener( "touch", image1 )
		image8:addEventListener( "touch", image8 )

	end
		memTimer = timer.performWithDelay( 500, showMem, 1 )
	end	
end

function scene:hide( event )
	local phase = event.phase
	if "will" == phase then
		image1:removeEventListener( "touch", image1 )
		image8:removeEventListener( "touch", image8 )
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