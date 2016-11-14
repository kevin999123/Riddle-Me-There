--Friends
local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()
local image
local json = require("json")
local decodedData
local tableView
local nextPress = function ( self,event ) 
		
        composer.gotoScene( "Messages", "fade", 400 )
end

local nextPress1 = function ( self,event ) 
		
        composer.gotoScene( "invitefriends2", "fade", 400 )

end

local nextPress2 = function ( self,event ) 
		
        composer.gotoScene( "ConfirmFriends", "fade", 400 )
end

local returnPress = function ( self,event ) 
           composer.gotoScene( "Main menu", "fade", 400 )
end

function scene:create( event )
	local sceneGroup = self.view
	local friendsname = {}
image = display.newImage( "muim/background-18.png" )
image.x = display.contentCenterX
image.y = display.contentCenterY


image1 = display.newImage( "muim/friends.png" )
image1.x = display.contentWidth/1.13
image1.y = display.contentHeight/2.4


sceneGroup:insert( image )
sceneGroup:insert( image1 )



local function networkListener( event )
	if ( event.isError ) then
	    print( "Network error: ", event.response )
	else

	    print ( "RESPONSE: " .. event.response )
	    result = event.response
	        		
	    decodedData=json.decode(result)
	    for i=1,#decodedData do
			friendsname[i] = decodedData[i]
							
		end    		
	    local function onRowRender( event )
			local row = event.row
			local rowIndex=row.index
			local groupContentHeight = row.contentHeight
			               
			                
			local rowTitle = display.newText(row,friendsname[rowIndex], 20, 0, native.systemFontBold, 20)
			rowTitle.x = 15
			-- we also set the anchorX of the text to 0, so the object is x-anchored at the left
			rowTitle.anchorX = 0
			print("rowTitle.x:"..rowTitle.x)
			rowTitle.y = groupContentHeight * 0.55
			rowTitle:setFillColor(255/255,255/255,255/255)
			local rowimg =  display.newImage( "muim/native5.png" )
	        rowimg.x = row.contentWidth*0.5
	        rowimg.y = groupContentHeight*0.5
	        local rowimg2 =  display.newImage( "muim/arrow icon.png" )
	        rowimg2.x = row.contentWidth*0.85
	        rowimg2.y = groupContentHeight*0.5
	        
	        row:insert(rowimg)
	        row:insert(rowimg2)               
			row:insert(rowTitle)
		end

		local function onRowTouch( event )
			local phase = event.phase
			local row = event.row
			local rowIndex=row.index
			--nameTable.riddleid=idtable[row.index]
			if ( "release" == phase ) then
			                
			end

			
		end

			        
			            
---------------------------------------------------------------

		   
		    -- Create the widget
		tableView = widget.newTableView{
			left =display.contentHeight*0.45,
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

			           
			    
		for i = 1, #friendsname do
			local params={}
			local isCategory = false
			local rowHeight = 40
			local rowColor = {default={1,1,1,0}}--透明的顏色
			local lineColor = { 255/255, 215/255, 0/255 }
			 -- Insert a row into the tableView
			if (i % 2 == 0) then
			    params.isCategory= false
			    params.rowHeight = 40
			    params.rowColor = rowColor
			    params.lineColor = lineColor
			else 
			    params.isCategory= false
			    params.rowHeight = 40
			    params.rowColor = rowColor
			    params.lineColor = lineColor
			end
			tableView:insertRow(params)
			        
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

network.request( "http://mmlab.lhu.edu.tw/searchfriends.php", "POST", networkListener, params )

	local nextPress = widget.newButton
 { 
	
	defaultFile = "muim/Messages.png",
	overFile = "muim/Messages.png",
	emboss = true,
	onPress = nextPress,
	--onRelease = button1Release,
 }
     sceneGroup:insert(nextPress)
    nextPress.x =display.contentWidth/1.14
	nextPress.y =display.contentHeight/1.28

	local nextPress1 = widget.newButton
 { 
	
	defaultFile = "muim/invitefriends.png",
	overFile = "muim/invitefriends.png",
	emboss = true,
	onPress = nextPress1,
	--onRelease = button1Release,
 }
     sceneGroup:insert(nextPress1)
    nextPress1.x =display.contentWidth/1.21 
	nextPress1.y =display.contentHeight/1.8


	local nextPress2 = widget.newButton
 { 
	
	defaultFile = "muim/ConfirmFriends.png",
	overFile = "muim/ConfirmFriends.png",
	emboss = true,
	onPress = nextPress2,
	--onRelease = button1Release,
 }
     sceneGroup:insert(nextPress2)
    nextPress2.x =display.contentWidth/1.23
	nextPress2.y =display.contentHeight/1.48

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
--
end
function scene:show( event )
	local phase = event.phase
	composer.removeScene( "Main menu" )
	composer.removeScene( "ConfirmFriends" )
	composer.removeScene( "invitefriends2" )
	composer.removeScene( "Messages" )
	
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


