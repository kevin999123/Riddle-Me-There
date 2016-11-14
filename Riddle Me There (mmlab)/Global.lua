--Global.lua

local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()
local json = require("json")
local imageselect
local decodedData
local myNewData
local nametable = {}
local grade = {}
local created = {}
local solved = {}
local button1,button2,button3
-------------------------------------------------------
local nextPress = function ( self,event )
		display.remove(imageselect)
	    imageselect = nil  
        composer.gotoScene( "countryscore", "fade", 400 )
end

local nextPress1 = function ( self,event ) 
		display.remove(imageselect)
	    imageselect = nil 
        composer.gotoScene( "Global", "fade", 400 )
end

local nextPress2 = function ( self,event )
		display.remove(imageselect)
	    imageselect = nil  
        composer.gotoScene( "personal", "fade", 400 )
end

local returnPress = function ( self,event ) 
		display.remove(imageselect)
	    imageselect = nil  
        composer.gotoScene( "Main menu", "fade", 400 )
end

local nextPress3 = function ( self,event )
		display.remove(imageselect)
	    imageselect = nil  
        composer.gotoScene( "Scores", "fade", 400 )
end
---------------------------------------------------------

function scene:create( event )
	local sceneGroup = self.view
	local tableView
	local name1 ="total"
	display.setStatusBar( display.HiddenStatusBar )
-----------------------------------------------------------------------------
--total button

local button1onPress = function( self,event )
	
		display.remove(imageselect)
	    imageselect = nil 
		imageselect = display.newImage( "muim/Select button icon.png" )
		imageselect.x = display.contentWidth/13
		imageselect.y = display.contentHeight/1.45

		display.remove(tableView)
	 	tableView = nil 
	 	print(button1.id)

	local function networkListener( event )
		if ( event.isError ) then
	        print( "Network error: ", event.response )
	    else
	    	myNewData = event.response
	        print ( "RESPONSE: " .. event.response )

	        decodedData = json.decode(event.response)
	       
		    
		    for i=1,#decodedData do
		    		for j=1,#decodedData[1] do
				     	nametable[j] = decodedData[1][j] 
				     	grade[j] = decodedData[2][j]
				     	
				     end
		     end
		     
--------------------------------------------------------------------------------------------------------

	--tableview
	 local function onRowRender( event )
                local row = event.row
                local rowIndex=row.index
                local groupContentHeight = row.contentHeight
                print(rowIndex)
                --印出每行資料
                local rowTitle = display.newText(row,nametable[rowIndex], 20, 0, nil, 14 )
                rowTitle.x = 30
                -- we also set the anchorX of the text to 0, so the object is x-anchored at the left
                rowTitle.anchorX = 0
                print("rowTitle.x:"..rowTitle.x)
                rowTitle.y = groupContentHeight * 0.55
                rowTitle:setFillColor(0/255,0/255,0/255)
                local rowTitle2 = display.newText(row,grade[rowIndex], 20, 0, nil, 14 )
                rowTitle2.x = 105
                -- we also set the anchorX of the text to 0, so the object is x-anchored at the left
                rowTitle2.anchorX = 0
                
                rowTitle2.y = groupContentHeight * 0.55
                rowTitle2:setFillColor(0/255,0/255,0/255)
                local rowText = display.newText("      " ..rowIndex,10,groupContentHeight*0.5,system.nativeFont,10  )
                rowText.fill = {0,0,0}
                row:insert(rowText)
                row:insert(rowTitle)
            end




    ---------------------------------------------------------------

   
    -- Create the widget
            tableView = widget.newTableView{
                left =display.contentHeight*0.5,
                top = 40,
                height = display.contentHeight*0.75,
                width = display.contentWidth*0.3,
                hideBackground = true,
                listener = tableViewListener,
                onRowRender = onRowRender,
                
                --listener = scrollListener
            }
            sceneGroup:insert(tableView)
           
    
            for i = 1, #nametable do
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
	    end
	    
	end

	local headers = {}

	headers["Content-Type"] = "application/x-www-form-urlencoded"
	headers["Accept-Language"] = "en-US"
			
	local body = "button="..button1.id
	
	local params = {}
	params.headers = headers
	params.body = body

	network.request( "http://mmlab.lhu.edu.tw/sortscore.php", "POST", networkListener, params )
		
	
end
-----------------------------------------------------------------------------

local button2onPress = function( self,event )
	
		display.remove(imageselect)
	    imageselect = nil 
		imageselect = display.newImage( "muim/Select button icon.png" )
		imageselect.x = display.contentWidth/22
		imageselect.y = display.contentHeight/1.3


		display.remove(tableView)
	 	tableView = nil 

	local function networkListener( event )
		if ( event.isError ) then
	        print( "Network error: ", event.response )
	    else
	    	myNewData = event.response
	        print ( "RESPONSE: " .. event.response )

	        decodedData = json.decode(event.response)
	       
		    
		    for i=1,#decodedData do
		    		for j=1,#decodedData[1] do
				     	nametable[j] = decodedData[1][j] 
				     	created[j] = decodedData[2][j]
				     	
				     end
		     end
		     
--------------------------------------------------------------------------------------------------------

	--tableview
	 local function onRowRender( event )
                local row = event.row
                local rowIndex=row.index
                local groupContentHeight = row.contentHeight
                print(rowIndex)
                --印出每行資料
                local rowTitle = display.newText(row,nametable[rowIndex], 20, 0, nil, 14 )
                rowTitle.x = 30
                -- we also set the anchorX of the text to 0, so the object is x-anchored at the left
                rowTitle.anchorX = 0
                print("rowTitle.x:"..rowTitle.x)
                rowTitle.y = groupContentHeight * 0.55
                rowTitle:setFillColor(0/255,0/255,0/255)
                local rowTitle2 = display.newText(row,created[rowIndex], 20, 0, nil, 14 )
                rowTitle2.x = 105
                -- we also set the anchorX of the text to 0, so the object is x-anchored at the left
                rowTitle2.anchorX = 0
                
                rowTitle2.y = groupContentHeight * 0.55
                rowTitle2:setFillColor(0/255,0/255,0/255)
                local rowText = display.newText("      " ..rowIndex,10,groupContentHeight*0.5,system.nativeFont,10  )
                rowText.fill = {0,0,0}
                row:insert(rowText)
                row:insert(rowTitle)
            end




    ---------------------------------------------------------------

   
    -- Create the widget
            tableView = widget.newTableView{
                left =display.contentHeight*0.5,
                top = 40,
                height = display.contentHeight*0.75,
                width = display.contentWidth*0.3,
                hideBackground = true,
                listener = tableViewListener,
                onRowRender = onRowRender,
                
                --listener = scrollListener
            }
            sceneGroup:insert(tableView)
           
    
            for i = 1, #nametable do
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
	    end
	    
	end

	local headers = {}

	headers["Content-Type"] = "application/x-www-form-urlencoded"
	headers["Accept-Language"] = "en-US"
			
	local body = "button="..button2.id
	
	local params = {}
	params.headers = headers
	params.body = body

	network.request( "http://mmlab.lhu.edu.tw/sortscore.php", "POST", networkListener, params )		
	
end


----------------------------------------------------------------------------

local button3onPress = function( self,event )
	
		display.remove(imageselect)
	    imageselect = nil 
		imageselect = display.newImage( "muim/Select button icon.png" )
		imageselect.x = display.contentWidth/28
		imageselect.y = display.contentHeight/1.17



		display.remove(tableView)
	 	tableView = nil 
	local function networkListener( event )
		if ( event.isError ) then
	        print( "Network error: ", event.response )
	    else
	    	myNewData = event.response
	        print ( "RESPONSE: " .. event.response )

	        decodedData = json.decode(event.response)
	       
		    
		    for i=1,#decodedData do
		    		for j=1,#decodedData[1] do
				     	nametable[j] = decodedData[1][j] 
				     	solved[j] = decodedData[2][j]
				     	
				     end
		     end
		     
--------------------------------------------------------------------------------------------------------

	--tableview
	 local function onRowRender( event )
                local row = event.row
                local rowIndex=row.index
                local groupContentHeight = row.contentHeight
                print(rowIndex)
                --印出每行資料
                local rowTitle = display.newText(row,nametable[rowIndex], 20, 0, nil, 14 )
                rowTitle.x = 30
                -- we also set the anchorX of the text to 0, so the object is x-anchored at the left
                rowTitle.anchorX = 0
                print("rowTitle.x:"..rowTitle.x)
                rowTitle.y = groupContentHeight * 0.55
                rowTitle:setFillColor(0/255,0/255,0/255)
                local rowTitle2 = display.newText(row,solved[rowIndex], 20, 0, nil, 14 )
                rowTitle2.x = 105
                -- we also set the anchorX of the text to 0, so the object is x-anchored at the left
                rowTitle2.anchorX = 0
                
                rowTitle2.y = groupContentHeight * 0.55
                rowTitle2:setFillColor(0/255,0/255,0/255)
                local rowText = display.newText("      " ..rowIndex,10,groupContentHeight*0.5,system.nativeFont,10  )
                rowText.fill = {0,0,0}
                row:insert(rowText)
                row:insert(rowTitle)
            end




    ---------------------------------------------------------------

   
    -- Create the widget
            tableView = widget.newTableView{
                left =display.contentHeight*0.5,
                top = 40,
                height = display.contentHeight*0.75,
                width = display.contentWidth*0.3,
                hideBackground = true,
                listener = tableViewListener,
                onRowRender = onRowRender,
                
                --listener = scrollListener
            }
            sceneGroup:insert(tableView)
           
    
            for i = 1, #nametable do
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
	    end
	    
	end

	local headers = {}

	headers["Content-Type"] = "application/x-www-form-urlencoded"
	headers["Accept-Language"] = "en-US"
			
	local body = "button="..button3.id
	
	local params = {}
	params.headers = headers
	params.body = body

	network.request( "http://mmlab.lhu.edu.tw/sortscore.php", "POST", networkListener, params )		
	
end
-----------------------------------------------------------------------------
	image = display.newImage( "muim/background-9.png" )
	image.x = display.contentCenterX
	image.y = display.contentCenterY

	image1 = display.newImage( "muim/reel-1.png" )
	image1.x = display.contentWidth/1.1
	image1.y = display.contentHeight/1.45



	image3 = display.newImage( "muim/VIEW.png" )
	image3.x = display.contentWidth/5.5
	image3.y = display.contentHeight/1.7
	

	image4 = display.newImage( "muim/total.png" )
	image4.x = display.contentWidth/6
	image4.y = display.contentHeight/1.45


	image5 = display.newImage( "muim/created.png" )
	image5.x = display.contentWidth/7
	image5.y = display.contentHeight/1.3

	image6 = display.newImage( "muim/solved.png" )
	image6.x = display.contentWidth/7.5
	image6.y = display.contentHeight/1.17


	sceneGroup:insert( image)	
	sceneGroup:insert( image1)
	sceneGroup:insert( image3)
	sceneGroup:insert( image4)	
	sceneGroup:insert( image5)	
	sceneGroup:insert( image6)	
	


 button1 = widget.newButton
 { 
	
	defaultFile = "muim/total.png",
	overFile = "muim/total.png",
	id = "1",
	emboss = true,
	onPress = button1onPress,
	--onRelease = button1Release,
 }
     sceneGroup:insert(button1)
    button1.x =display.contentWidth/6
	button1.y =display.contentHeight/1.45

	 button2 = widget.newButton
 { 
	
	defaultFile = "muim/created.png",
	overFile = "muim/created.png",
	id = "2",
	emboss = true,
	onPress = button2onPress,
	--onRelease = button1Release,
 }
     sceneGroup:insert(button2)
    button2.x =display.contentWidth/7
	button2.y =display.contentHeight/1.3

	 button3 = widget.newButton
 { 
	
	defaultFile = "muim/solved.png",
	overFile = "muim/solved.png",
	id = "3",
	emboss = true,
	onPress = button3onPress,
	--onRelease = button1Release,
 }
     sceneGroup:insert(button3)
    button3.x =display.contentWidth/7.5
	button3.y =display.contentHeight/1.17

		local returnPress = widget.newButton
 { 
	
	defaultFile = "muim/returnPress.png",
	overFile = "muim/returnPress.png",
	emboss = true,
	onPress = returnPress,
	--onRelease = button1Release,
 }
     sceneGroup:insert(returnPress)
    returnPress.x =display.contentWidth/12
	returnPress.y =display.contentHeight/10


local nextPress = widget.newButton
 { 
	
	defaultFile = "muim/country1.png",
	overFile = "muim/country1.png",
	emboss = true,
	onPress = nextPress,
	--onRelease = button1Release,
 }
     sceneGroup:insert(nextPress)
    nextPress.x =display.contentWidth/1.2
	nextPress.y =display.contentHeight/1.69

local nextPress1 = widget.newButton
 { 
	
	defaultFile = "muim/global.png",
	overFile = "muim/global.png",
	emboss = true,
	onPress = nextPress1,
	--onRelease = button1Release,
 }
     sceneGroup:insert(nextPress1)
    nextPress1.x =display.contentWidth/1.23
	nextPress1.y =display.contentHeight/1.37

local nextPress2 = widget.newButton
 { 
	defaultFile = "muim/personal.png",
	overFile = "muim/personal.png",
	emboss = true,
	onPress = nextPress2,
	--onRelease = button1Release,
 }
     sceneGroup:insert(nextPress2)
    nextPress2.x =display.contentWidth/1.15
	nextPress2.y =display.contentHeight/1.2


local nextPress3 = widget.newButton
 { 
	defaultFile = "muim/friends.png",
	overFile = "muim/friends.png",
	emboss = true,
	onPress = nextPress3,
	--onRelease = button1Release,
 }
     sceneGroup:insert(nextPress3)
    nextPress3.x =display.contentWidth/1.13
	nextPress3.y =display.contentHeight/2.05

end
----------------------------------------------------------------------------------------------------------
function scene:show( event )
	local phase = event.phase

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