--map.lua

local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()
local json = require("json")
local locationNumber = 1 -- a counter to display on location labels
local currentLocation, currentLatitude, currentLongitude
local decodedData
local myNewData
-------------------------------------------------------
local nextPress = function ( self,event ) 
           composer.gotoScene( "local", "fade", 400 )
end

local nextPress1 = function ( self,event ) 
           composer.gotoScene( "special", "fade", 400 )
end

local nextPress2 = function ( self,event ) 
           composer.gotoScene( "area", "fade", 400 )
end

local returnPress = function ( self,event ) 
           composer.gotoScene( "Main menu", "fade", 400 )
end


---------------------------------------------------------

function scene:create( event )
	local sceneGroup = self.view



local myMap = native.newMapView( 10, 10, 280, 150 )
-- myMap.anchorX = 0.0		-- TopLeft anchor
-- myMap.anchorY = 0.0		-- TopLeft anchor

if myMap then
	-- Display a normal map with vector drawings of the streets.
	-- Other mapType options are "satellite" and "hybrid".
	myMap.mapType = "normal"

	-- The MapView is just another Corona display object and can be moved, resized, etc.
	--地圖的座標位置
	myMap.x = display.contentWidth / 2 -70
	myMap.y = 170

	-- Initialize map to a real location, since default location (0,0) is not very interesting
	--myMap:setCenter( 25.017416, 121.403869 )
	myMap:setCenter( currentLatitude, currentLongitude )
	--建立圖標
	--myMap:addMarker( 25.017416, 121.403869)
	-- Add a new marker when a user taps the map.

	local function networkListener( event )
		if ( event.isError ) then
	        print( "Network error: ", event.response )
	    else
	    	myNewData = event.response
	        print ( "RESPONSE: " .. event.response )

	        decodedData = json.decode(event.response)
	       
		    
		    for i=1,#decodedData do
		    		for j=1,#decodedData[1] do
				     	lattable[j] = decodedData[1][j] 
				     	lontable[j] = decodedData[2][j]
				     	titletable[j] = decodedData[3][j]
				     	riddletable[j] = decodedData[4][j]
				     	idtable[j] = decodedData[5][j]
				     end
		     end
		     --myMap:addMarker( 25.0182, 121.4020)
--------------------------------------------------------------------------------------------------------
			-- add map marker
		     if myMap then
		     	
			     for k=1,#lattable do
			     	
					myMap:addMarker( lattable[k], lontable[k])
				end
			end
---------------------------------------------------------------------------------------------------------

	    end
	    
	end

	local headers = {}

	headers["Content-Type"] = "application/x-www-form-urlencoded"
	headers["Accept-Language"] = "en-US"
			
	local body 
	local params = {}
	params.headers = headers
	params.body = body

	network.request( "http://mmlab.lhu.edu.tw/searchriddle.php", "POST", networkListener, params )
	local function mapTapListener( event )
		print( "The tapped location is at: " .. event.latitude .. ", " .. event.longitude )
		local options = { 
			title = 'You tapped here!',
			subtitle = event.latitude .. ' , ' .. event.longitude, 
		}
		myMap:addMarker( event.latitude, event.longitude, options )
	end
	myMap:addEventListener( "mapLocation", mapTapListener )
end

-- A handler for the native keyboard


-- A native text input field (requires Xcode Simulator build or device build)
display.setDefault( "anchorX", 0 )
display.setDefault( "anchorY", 0 )

display.setDefault( "anchorX", 0.5 )
display.setDefault( "anchorY", 0.5 )

-- A function to handle the "mapAddress" event (also known as "reverse geocoding", ie: coordinates -> string).
local mapAddressHandler = function( event )
	if event.isError then
		-- Failed to receive location information.
		native.showAlert( "Error", event.errorMessage, { "OK" } )
	else
		-- Location information received. Display it.
		local locationText =
				"Latitude: " .. currentLatitude .. 
				", Longitude: " .. currentLongitude ..
				", Address: " .. ( event.streetDetail or "" ) ..
				" " .. ( event.street or "" ) ..
				", " .. ( event.city or "" ) ..
				", " .. ( event.region or "" ) ..
				", " .. ( event.country or "" ) ..
				", " .. ( event.postalCode or "" )
		
	end
end

-- A function to handle the "mapLocation" event (also known as "forward geocoding", ie: string -> coordinates).
local mapLocationHandler = function( event )
	if event.isError then
		-- Location name not found.
		native.showAlert( "Error", event.errorMessage, { "OK" } )
	else
		-- Move map so this location is at the center
		-- (The final parameter toggles map animation, which may not be visible if moving a large distance)
		myMap:setCenter( event.latitude, event.longitude, true )

		-- Add a pin to the map at the new location
		markerTitle = "Location " .. locationNumber
		locationNumber = locationNumber + 1
		myMap:addMarker( event.latitude, event.longitude, { title=markerTitle, subtitle=inputField.text } )
	end
end




	----------------------------------------------------
	image = display.newImage( "muim/Background map.png" )
	image.x = display.contentCenterX
	image.y = display.contentCenterY

	image1 = display.newImage( "muim/reel-1.png" )
	image1.x = display.contentWidth/1.1
	image1.y = display.contentHeight/1.45

	image2 = display.newImage( "muim/map-1.png" )
	image2.x = display.contentWidth/1.16
	image2.y = display.contentHeight/1.2

	sceneGroup:insert( image)	sceneGroup:insert( image1)	
	sceneGroup:insert( image2)		
	

	local button2 = function( self,event )
	-- Do not continue if a MapView has not been created.
	
	if myMap == nil then
		
		return
	end

	-- Fetch the user's current location
	-- Note: in Xcode Simulator, the current location defaults to Apple headquarters in Cupertino, CA
	currentLocation = myMap:getUserLocation()
	if currentLocation.errorCode then
		
		if currentLocation.errorCode ~= 0 then -- errorCode 0 is: Pending User Authorization!
			
			currentLatitude = 0
			currentLongitude = 0
			native.showAlert( "Error", currentLocation.errorMessage, { "OK" } )
		end
	else
		-- Current location data was received.
		-- Move map so that current location is at the center.
		
		currentLatitude = currentLocation.latitude
		currentLongitude = currentLocation.longitude
		myMap:setRegion( currentLatitude, currentLongitude, 0.1, 0.1, true )
		
		-- Look up nearest address to this location (this is returned as a "mapAddress" event, handled above)
		myMap:nearestAddress( currentLatitude, currentLongitude, mapAddressHandler )
	end
end




local returnPress = widget.newButton
 { 
	
	defaultFile = "muim/returnPress.png",
	overFile = "muim/returnPress.png",
	emboss = true,
	onPress = returnPress,
	--onRelease = button1Release,
 }
     sceneGroup:insert(returnPress)
    returnPress.x =display.contentWidth/7.1
	returnPress.y =display.contentHeight/1.1

local nextPress = widget.newButton
 { 
	
	defaultFile = "muim/local riddles.png",
	overFile = "muim/local riddles.png",
	emboss = true,
	onPress = nextPress,
	--onRelease = button1Release,
 }
     sceneGroup:insert(nextPress)
    nextPress.x =display.contentWidth/1.15
	nextPress.y =display.contentHeight/1.65

local nextPress1 = widget.newButton
 { 
	
	defaultFile = "muim/special riddles.png",
	overFile = "muim/special riddles.png",
	emboss = true,
	onPress = nextPress1,
	--onRelease = button1Release,
 }
     sceneGroup:insert(nextPress1)
    nextPress1.x =display.contentWidth/1.2
	nextPress1.y =display.contentHeight/1.4

local nextPress2 = widget.newButton
 { 
	
	defaultFile = "muim/created riddles.png",
	overFile = "muim/created riddles.png",
	emboss = true,
	onPress = nextPress2,
	--onRelease = button1Release,
 }
     sceneGroup:insert(nextPress2)
    nextPress2.x =display.contentWidth/1.1
	nextPress2.y =display.contentHeight/2

	local button2 = widget.newButton
{
	defaultFile = "muim/map-1.png",
	overFile = "muim/map-1.png",
	emboss = true,
	onPress = button2,
}
	sceneGroup:insert(button2)
	button2.x = display.contentWidth/1.16
	button2.y = display.contentHeight/1.2

	sceneGroup:insert(myMap)	
	
end
----------------------------------------------------------------------------------------------------------
function scene:show( event )
	local phase = event.phase
	composer.removeScene( "local" )
	if "did" == phase then
		print( "1: show event, phase did" )

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