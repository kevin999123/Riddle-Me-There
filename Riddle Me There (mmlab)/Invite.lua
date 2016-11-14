--Invite.lua
local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()
local json = require ( "json" )
local image
local decodedData
local code
local Giftcode
local returnPress = function ( self,event ) 
           composer.gotoScene( "Extra", "fade", 400 )
end

local returnPress = function ( self,event ) 
           composer.gotoScene( "Main menu", "fade", 400 )
end

local modify = function ( self,event ) 
   		local function networkListener2( event )
		if ( event.isError ) then
			print( "Network error: ", event.response )
		else
			print ( "RESPONSE: " .. event.response )
			value = event.response
			decodedData=json.decode(value)
			local function onComplete( event )
					if ( event.action == "clicked" ) then
								    	
						local i = event.index
								        
						if ( i == 1 ) then
						 -- Do nothing; dialog will simply dismiss
							composer.gotoScene( "Extra", "fade", 400 )            
											
						 elseif ( i == 2 ) then
								            -- Open URL if "Learn More" (second button) was clicked
								        	-- system.openURL( "http://www.coronalabs.com" )
						end
					 end
				end
			if(value == "correct") then
				local alert = native.showAlert( "Riddle Me There", "獲得50point.", {"OK"}, onComplete )
			elseif(value == "reuse") then
				local alert = native.showAlert( "Riddle Me There", "已輸入過邀請碼.", {"OK"}, onComplete )
			else
				local alert = native.showAlert( "Riddle Me There", "邀請碼錯誤.", {"OK"}, onComplete )
			end
		end
	end

	local headers = {}

	headers["Content-Type"] = "application/x-www-form-urlencoded"
	headers["Accept-Language"] = "en-US"
							
	local body = "email="..nameTable.email.."&code="..Giftcode.text
								
	local params = {}
	params.headers = headers
	params.body = body

	network.request( "http://mmlab.lhu.edu.tw/friendcode.php", "POST", networkListener2, params )
end
function scene:create( event )
	local sceneGroup = self.view
	
	image = display.newImage( "muim/background-15.png" )
	image.x = display.contentCenterX
	image.y = display.contentCenterY
	
	image1 = display.newImage( "muim/inviteReward0.png" )
	image1.x = display.contentWidth/2
	image1.y = display.contentHeight/3

	image2 = display.newImage( "muim/native2.png" )
	image2.x = display.contentWidth/2.05
	image2.y = display.contentHeight/2.2

	 Giftcode = native.newTextField( display.contentWidth/2.05, 146, 224, 16)
	  
	  Giftcode:setTextColor(  1, 1, 1  )
	  Giftcode.hasBackground = false
	-- Gift:addEventListener( "userInput", fieldHandler( function() return Gift end ) )	
	sceneGroup:insert( Giftcode )	

	sceneGroup:insert( image )	
	sceneGroup:insert( image1 )		
	sceneGroup:insert( image2 )	



local modify = widget.newButton
 { 
	
	defaultFile = "muim/modify1.png",
	overFile = "muim/modify0.png",
	emboss = true,
	onPress = modify,
	--onRelease = button1Release,
 }
     sceneGroup:insert(modify)
    modify.x =display.contentWidth/2.4
	modify.y =display.contentHeight/1.15

	local returnPress = widget.newButton
 { 
	
	defaultFile = "muim/returnPress.png",
	overFile = "muim/returnPress.png",
	emboss = true,
	onPress = returnPress,
	--onRelease = button1Release,
 }
     sceneGroup:insert(returnPress)
    returnPress.x =display.contentWidth/13
	returnPress.y =display.contentHeight/1.06		

	local returnPress = widget.newButton
 { 
	
	defaultFile = "muim/returnPress.png",
	overFile = "muim/returnPress.png",
	emboss = true,
	onPress = returnPress,
	--onRelease = button1Release,
 }
     sceneGroup:insert(returnPress)
    returnPress.x =display.contentWidth/9
	returnPress.y =display.contentHeight/1.06


	local function networkListener( event )
		if ( event.isError ) then
			print( "Network error: ", event.response )
		else
			print ( "RESPONSE: " .. event.response )
			value = event.response

			
			code = display.newText(value,200,200,nil,30)
			code:setFillColor(255/255,128/255,0/255)
			sceneGroup:insert( code )	
		end
	end

	local headers = {}

	headers["Content-Type"] = "application/x-www-form-urlencoded"
	headers["Accept-Language"] = "en-US"
								
	local body = "email="..nameTable.email
								
	local params = {}
	params.headers = headers
	params.body = body

	network.request( "http://mmlab.lhu.edu.tw/codemysqlf.php", "POST", networkListener, params )



end

function scene:show( event )
	local phase = event.phase
	composer.removeScene( "Extra" )
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


