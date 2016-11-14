--local.lua


local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()
local json = require("json")
local myMap
local locationNumber = 1 -- a counter to display on location labels
local currentLocation, currentLatitude, currentLongitude
local decodedData
local myNewData
local longitudeText 
local latitudeText

-------------------------------------------------------
local returnPress = function ( self,event ) 
           composer.gotoScene( "Main menu", "fade", 400 )
end

local nextPress = function ( self,event ) 
           composer.gotoScene( "map", "fade", 400 )
end

local nextPress1 = function ( self,event ) 
           composer.gotoScene( "special", "fade", 400 )
end

local nextPress2 = function ( self,event ) 
           composer.gotoScene( "area", "fade", 400 )
end


---------------------------------------------------------

function scene:create( event )
	local sceneGroup = self.view
	local lattable = {}
	local lontable = {}
	local titletable = {}
	local riddletable = {}
	local idtable = {}
	local tableView
	local tableView2
	local tableView3
	local button1
	local button2
	local button3
-----------------------------------------------------------------
	local myMap = native.newMapView( 10, 10, 120, 100 )

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



	
-- myMap.anchorX = 0.0		-- TopLeft anchor
-- myMap.anchorY = 0.0		-- TopLeft anchor

if myMap then
	-- Display a normal map with vector drawings of the streets.
	-- Other mapType options are "satellite" and "hybrid".
	myMap.mapType = "normal"

	-- The MapView is just another Corona display object and can be moved, resized, etc.
	--地圖的座標位置
	myMap.x = display.contentWidth*0.16
	myMap.y = display.contentHeight*0.72
	myMap.rotation = 10
	--myMap:addMarker( 25.0182, 121.4020)
	-- Initialize map to a real location, since default location (0,0) is not very interesting
	--myMap:setCenter( 25.017416, 121.403869 )
	currentLocation = myMap:getUserLocation()
	if currentLocation.errorCode then
		if currentLocation.errorCode ~= 0 then -- errorCode 0 is: Pending User Authorization!
			currentLatitude = 0
			currentLongitude = 0
			
		end
	else
		-- Current location data was received.
		-- Move map so that current location is at the center.
		currentLatitude = currentLocation.latitude
		currentLongitude = currentLocation.longitude
		myMap:setRegion( currentLatitude, currentLongitude, 0.01, 0.01, true )
		
		
	end
	--myMap:setRegion( currentLatitude, currentLongitude,0.01,0.01,true )
	--建立圖標
	--myMap:addMarker( 25.017416, 121.403869)
	-- Add a new marker when a user taps the map.
	local function mapTapListener( event )
		print( "The tapped location is at: " .. event.latitude .. ", " .. event.longitude )
		local options = { 
			title = 'You tapped here!',
			subtitle = event.latitude .. ' , ' .. event.longitude, 
		}
		
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
		
	end
end
	-----------------------------------------------------

	image = display.newImage( "muim/Background-8.png" )
	image.x = display.contentCenterX
	image.y = display.contentCenterY

	image1 = display.newImage( "muim/reel-1.png" )
	image1.x = display.contentWidth/1.1
	image1.y = display.contentHeight/1.45

	image2 = display.newImage( "muim/local riddles.png" )
	image2.x = display.contentWidth/1.15
	image2.y = display.contentHeight/1.65

	

	sceneGroup:insert( image)	sceneGroup:insert( image1)	
	sceneGroup:insert( image2)	


local returnPress = widget.newButton
 { 
	
	defaultFile = "muim/returnPress.png",
	overFile = "muim/returnPress.png",
	emboss = true,
	onPress = returnPress,
	--onRelease = button1Release,
 }
     sceneGroup:insert(returnPress)
    returnPress.x =display.contentWidth/3.5
	returnPress.y =display.contentHeight/6.5	



local nextPress = widget.newButton
 { 
	
	defaultFile = "muim/map-1.png",
	overFile = "muim/map-1.png",
	emboss = true,
	onPress = nextPress,
	--onRelease = button1Release,
 }
     sceneGroup:insert(nextPress)
    nextPress.x =display.contentWidth/1.2
	nextPress.y =display.contentHeight/1.2

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
-------------------------------------------------------------------------------------------
	local button1onPress = function( self,event )
	-- Do not continue if a MapView has not been created.

	display.remove(tableView)
	 display.remove(tableView2)
	 display.remove(tableView3)
	 tableView = nil 
	 tableView2 = nil 
	 tableView3 = nil
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
		myMap:setRegion( currentLatitude, currentLongitude, 0.005, 0.005, true )
		
		-- Look up nearest address to this location (this is returned as a "mapAddress" event, handled above)
		myMap:nearestAddress( currentLatitude, currentLongitude, mapAddressHandler )
	end
	--------------------------------------------------------------------------
	--search riddle

	local function networkListener( event )
		if ( event.isError ) then
	        print( "Network error: ", event.response )
	    else
	    	myNewData = event.response
	        print ( "RESPONSE: " .. event.response )

	        decodedData = json.decode(event.response)
	       
		    for k,v in pairs(decodedData) do
		    	print(k,v)
		     end 

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
		    --[[]]
---------------------------------------------------------------------------------------------------------
	--tableview
	 local function onRowRender( event )
                local row = event.row
                local rowIndex=row.index
                local groupContentHeight = row.contentHeight
                print(rowIndex)
                --印出每行資料
                local rowTitle = display.newText(row,"title:"..titletable[rowIndex].."  ".."\n".. " Riddle→ "..riddletable[rowIndex], 20, 0, nil, 14 )
                rowTitle.x = 30
                -- we also set the anchorX of the text to 0, so the object is x-anchored at the left
                rowTitle.anchorX = 0
                print("rowTitle.x:"..rowTitle.x)
                rowTitle.y = groupContentHeight * 0.55
                rowTitle:setFillColor(255/255,250/255,205/255)
                local rowText = display.newText("   # " ..rowIndex,10,groupContentHeight*0.5,system.nativeFont,10  )
                rowText.fill = {255/255,165/255,79/255}
                row:insert(rowText)
                row:insert(rowTitle)
            end




    ---------------------------------------------------------------
    --換到解謎
            local function onRowTouch( event )
                local phase = event.phase
                local row = event.row
                local rowIndex=row.index
                nameTable.riddleid=idtable[row.index]
                if ( "release" == phase ) then

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
				
				local body = "lat="..latitude.text.."&lon="..longitude.text.."&email="..nameTable.email
				--local body = "riddle_id=5&lat=25.0477&lon=121.5170"
				
				local params = {}
				params.headers = headers
				params.body = body

				network.request( "http://mmlab.lhu.edu.tw/uploadCoordinates.php", "POST", networkListener, params )
	             composer.gotoScene( "Reply", "fade", 400 )

                end

        
            end

    -------------------------------------------------------------
   
    -- Create the widget
            tableView = widget.newTableView{
                left =display.contentHeight*0.5,
                top = 40,
                height = display.contentHeight*0.75,
                width = display.contentWidth*0.35,
                hideBackground = true,
                listener = tableViewListener,
                onRowRender = onRowRender,
                onRowTouch = onRowTouch,
                --listener = scrollListener
            }
            sceneGroup:insert(tableView)
           
    
            for i = 1, #lattable do
                local params={}
                local isCategory = false
                local rowHeight = 40
                local rowColor = {default={1,1,1,0}}--透明的顏色
                local lineColor = { 0.5, 0.5, 0.5 }
                -- Insert a row into the tableView
                if (i % 2 == 0) then
                    params.isCategory= false
                    params.rowHeight = 40
                    params.rowColor = rowColor
                else 
                    params.isCategory= false
                    params.rowHeight = 40
                    params.rowColor = rowColor
                end
                tableView:insertRow(params)
        
            end
             if myMap then
		     	
			    for k=1,#lattable do
			     	myMap:addMarker( lattable[k], lontable[k])
				end
			end
	    end
	    
	end

	local headers = {}

	headers["Content-Type"] = "application/x-www-form-urlencoded"
	headers["Accept-Language"] = "en-US"
			
	local body = "lat="..currentLatitude.."&lon="..currentLongitude.."&range="..button1.id.."&email="..nameTable.email
	print(button1.id)
	local params = {}
	params.headers = headers
	params.body = body

	network.request( "http://mmlab.lhu.edu.tw/searchriddle.php", "POST", networkListener, params )

	----------------------------------------------------------------------------------------------------
	--add marker




end


 button1 = widget.newButton
 { 
	
	defaultFile = "muim/S.png",
	overFile = "muim/S.png",
	id = "small",
	emboss = true,
	onPress = button1onPress,
	--onRelease = button1Release,
 }
     sceneGroup:insert(button1)
    button1.x =display.contentWidth*0.08
	button1.y =display.contentHeight*0.48

--button2
local button2onPress = function( self,event )
	-- Do not continue if a MapView has not been created.

	 display.remove(tableView)
	 display.remove(tableView2)
	 display.remove(tableView3)
	 tableView = nil 
	 tableView2 = nil 
	 tableView3 = nil
	print("1")
	if myMap == nil then
		print("2")
		return
	end

	-- Fetch the user's current location
	-- Note: in Xcode Simulator, the current location defaults to Apple headquarters in Cupertino, CA
	currentLocation = myMap:getUserLocation()
	if currentLocation.errorCode then
		print("3")
		if currentLocation.errorCode ~= 0 then -- errorCode 0 is: Pending User Authorization!
			print("4")
			currentLatitude = 0
			currentLongitude = 0
			native.showAlert( "Error", currentLocation.errorMessage, { "OK" } )
		end
	else
		-- Current location data was received.
		-- Move map so that current location is at the center.
		print("5")
		currentLatitude = currentLocation.latitude
		currentLongitude = currentLocation.longitude
		myMap:setRegion( currentLatitude, currentLongitude, 0.01, 0.01, true )
		
		-- Look up nearest address to this location (this is returned as a "mapAddress" event, handled above)
		myMap:nearestAddress( currentLatitude, currentLongitude, mapAddressHandler )
	end

	----------------------------------------------------------------------------------------
	local function networkListener( event )
		if ( event.isError ) then
	        print( "Network error: ", event.response )
	    else
	    	myNewData = event.response
	        print ( "RESPONSE: " .. event.response )

	        decodedData = json.decode(event.response)
	       
		    for k,v in pairs(decodedData) do
		    	print(k,v)
		     end 
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
		     
---------------------------------------------------------------------------------------------------------
	--tableview
	 local function onRowRender( event )
                local row = event.row
                local rowIndex=row.index
                local groupContentHeight = row.contentHeight
                print(rowIndex)
                --印出每行資料
                local rowTitle = display.newText(row,"title:"..titletable[rowIndex].."  ".."\n".. " Riddle→ "..riddletable[rowIndex], 20, 0, nil, 14 )
                rowTitle.x = 30
                -- we also set the anchorX of the text to 0, so the object is x-anchored at the left
                rowTitle.anchorX = 0
                print("rowTitle.x:"..rowTitle.x)
                rowTitle.y = groupContentHeight * 0.55
                rowTitle:setFillColor(0/255,0/255,0/255)
                local rowText = display.newText("   # " ..rowIndex,10,groupContentHeight*0.5,system.nativeFont,10  )
                rowText.fill = {0,0,0}
                row:insert(rowText)
                row:insert(rowTitle)
            end




    ---------------------------------------------------------------
    --換到解謎
            local function onRowTouch( event )
                local phase = event.phase
                local row = event.row
                local rowIndex=row.index
                nameTable.riddleid=idtable[row.index]
                if ( "release" == phase ) then

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
				
				local body = "lat="..latitude.text.."&lon="..longitude.text.."&email="..nameTable.email
				--local body = "riddle_id=5&lat=25.0477&lon=121.5170"
				
				local params = {}
				params.headers = headers
				params.body = body

				network.request( "http://mmlab.lhu.edu.tw/uploadCoordinates.php", "POST", networkListener, params )
	             composer.gotoScene( "Reply", "fade", 400 )

                end

        
            end

    -------------------------------------------------------------
   
    -- Create the widget
            tableView2 = widget.newTableView{
                left =display.contentHeight*0.5,
                top = 40,
                height = display.contentHeight*0.75,
                width = display.contentWidth*0.35,
                hideBackground = true,
                listener = tableViewListener,
                onRowRender = onRowRender,
                onRowTouch = onRowTouch,
                --listener = scrollListener
            }
            sceneGroup:insert(tableView2)
           
    
            for i = 1, #lattable do
                local params={}
                local isCategory = false
                local rowHeight = 40
                local rowColor = {default={1,1,1,0}}--透明的顏色
                local lineColor = { 0.5, 0.5, 0.5 }
                -- Insert a row into the tableView
                if (i % 2 == 0) then
                    params.isCategory= false
                    params.rowHeight = 40
                    params.rowColor = rowColor
                else 
                    params.isCategory= false
                    params.rowHeight = 40
                    params.rowColor = rowColor
                end
                tableView2:insertRow(params)
        
            end
            if myMap then
		     	
				for k=1,#lattable do
					myMap:addMarker( lattable[k], lontable[k])
				end
			end
	    end
	    
	end

	local headers = {}

	headers["Content-Type"] = "application/x-www-form-urlencoded"
	headers["Accept-Language"] = "en-US"
			
	local body = "lat="..currentLatitude.."&lon="..currentLongitude.."&range="..button2.id.."&email="..nameTable.email
	
	local params = {}
	params.headers = headers
	params.body = body

	network.request( "http://mmlab.lhu.edu.tw/searchriddle.php", "POST", networkListener, params )
	
end


 button2 = widget.newButton
 { 
	
	defaultFile = "muim/M.png",
	overFile = "muim/M.png",
	id = "medium",
	emboss = true,
	onPress = button2onPress,
	--onRelease = button1Release,
 }
     sceneGroup:insert(button2)
    button2.x =display.contentWidth*0.18
	button2.y =display.contentHeight*0.5


	--button3	
	local button3onPress = function( self,event )
	-- Do not continue if a MapView has not been created.
	 display.remove(tableView)
	 display.remove(tableView2)
	  display.remove(tableView3)
	 tableView = nil 
	 tableView2 = nil
	 tableView3 = nil
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

	------------------------------------------------------------------------------------------------------------
		local function networkListener( event )
		if ( event.isError ) then
	        print( "Network error: ", event.response )
	    else
	    	myNewData = event.response
	        print ( "RESPONSE: " .. event.response )

	        decodedData = json.decode(event.response)
	       
		    for k,v in pairs(decodedData) do
		    	print(k,v)
		     end 
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
			
---------------------------------------------------------------------------------------------------------
	--tableview
	 local function onRowRender( event )
                local row = event.row
                local rowIndex=row.index
                local groupContentHeight = row.contentHeight
                print(rowIndex)
                --印出每行資料
                local rowTitle = display.newText(row,"title:"..titletable[rowIndex].."  ".."\n".. " Riddle→ "..riddletable[rowIndex], 20, 0, nil, 14 )
                rowTitle.x = 30
                -- we also set the anchorX of the text to 0, so the object is x-anchored at the left
                rowTitle.anchorX = 0
                print("rowTitle.x:"..rowTitle.x)
                rowTitle.y = groupContentHeight * 0.55
                rowTitle:setFillColor(0/255,0/255,0/255)
                local rowText = display.newText("   # " ..rowIndex,10,groupContentHeight*0.5,system.nativeFont,10  )
                rowText.fill = {0,0,0}
                row:insert(rowText)
                row:insert(rowTitle)
            end




    ---------------------------------------------------------------
    --換到解謎
            local function onRowTouch( event )
                local phase = event.phase
                local row = event.row
                local rowIndex=row.index
                nameTable.riddleid=idtable[row.index]
                if ( "release" == phase ) then

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
				
				local body = "lat="..latitude.text.."&lon="..longitude.text.."&email="..nameTable.email
				--local body = "riddle_id=5&lat=25.0477&lon=121.5170"
				
				local params = {}
				params.headers = headers
				params.body = body

				network.request( "http://mmlab.lhu.edu.tw/uploadCoordinates.php", "POST", networkListener, params )
	             composer.gotoScene( "Reply", "fade", 400 )

                end

        
            end

    -------------------------------------------------------------
   
    -- Create the widget
            tableView3 = widget.newTableView{
                left =display.contentHeight*0.5,
                top = 40,
                height = display.contentHeight*0.75,
                width = display.contentWidth*0.35,
                hideBackground = true,
                listener = tableViewListener,
                onRowRender = onRowRender,
                onRowTouch = onRowTouch,
                --listener = scrollListener
            }
            sceneGroup:insert(tableView3)
           
    
            for i = 1, #lattable do
                local params={}
                local isCategory = false
                local rowHeight = 40
                local rowColor = {default={1,1,1,0}}--透明的顏色
                local lineColor = { 0.5, 0.5, 0.5 }
                -- Insert a row into the tableView
                if (i % 2 == 0) then
                    params.isCategory= false
                    params.rowHeight = 40
                    params.rowColor = rowColor
                else 
                    params.isCategory= false
                    params.rowHeight = 40
                    params.rowColor = rowColor
                end
                tableView3:insertRow(params)
        
            end
            -- add map marker
		     if myMap then
		     	
			     for k=1,#lattable do
			     	
					myMap:addMarker( lattable[k], lontable[k])
				end
			end
	    end
	    
	end

	local headers = {}

	headers["Content-Type"] = "application/x-www-form-urlencoded"
	headers["Accept-Language"] = "en-US"
			
	local body = "lat="..currentLatitude.."&lon="..currentLongitude.."&range="..button3.id.."&email="..nameTable.email
	
	local params = {}
	params.headers = headers
	params.body = body

	network.request( "http://mmlab.lhu.edu.tw/searchriddle.php", "POST", networkListener, params )

end
	sceneGroup:insert(myMap)

button3 = widget.newButton
 { 
	
	defaultFile = "muim/L.png",
	overFile = "muim/L.png",
	id = "large",
	emboss = true,
	onPress = button3onPress,
	--onRelease = button1Release,
 }
     sceneGroup:insert(button3)
    button3.x =display.contentWidth*0.28
	button3.y =display.contentHeight*0.51	



------------------------------------------------------------------------------------------------------------
Runtime:addEventListener("location",locationHandler) 

end
----------------------------------------------------------------------------------------------------------
function scene:show( event )
	local phase = event.phase
	composer.removeScene( "map" )
	composer.removeScene( "area" )
	composer.removeScene( "Reply" )
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