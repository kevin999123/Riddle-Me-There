--Solve.lua
local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()
local json = require("json")
local decodedData
local myNewData
local image

local returnPress = function ( self,event ) 
           composer.gotoScene( "Main menu", "fade", 400 )
end

function scene:create( event )
	local sceneGroup = self.view
	local tableView
	local titletable = {}
	local riddletable = {}
	local idtable = {}
	local riddlelike = {}
	local riddledislike = {}
------------------------------------------------------------------------------
	display.setStatusBar( display.HiddenStatusBar )

		local deviceID = system.getInfo("deviceID")
	local deviceIDText = display.newText(deviceID,300,300,nil,24)
	sceneGroup:insert( deviceIDText)
	--首頁貼圖
	image = display.newImage( "muim/Background-4.png" )
	image.x = display.contentCenterX
	image.y = display.contentCenterY
	
	sceneGroup:insert( image)
   

	local returnPress = widget.newButton
 { 
	
	defaultFile = "muim/returnPress.png",
	overFile = "muim/returnPress.png",
	emboss = true,
	onPress = returnPress,
	--onRelease = button1Release,
 }
     sceneGroup:insert(returnPress)
    returnPress.x =display.contentWidth/7
	returnPress.y =display.contentHeight/1.15
------------------------------------------------------------------------------------------------
	--select create riddle 
	local function networkListener( event )
			if ( event.isError ) then
		        print( "Network error: ", event.response )
		    else
		    	myNewData = event.response
		        print ( "RESPONSE: " .. event.response )

		        decodedData = json.decode(event.response)
		        
			     
			    for i=1,#decodedData do
			    		for j=1,#decodedData[1] do
					     	idtable[j] 		 = decodedData[1][j]
					     	titletable[j]    = decodedData[2][j]
					     	riddletable[j]   = decodedData[3][j]
					     	riddlelike[j]    = decodedData[4][j]
					     	riddledislike[j] = decodedData[5][j]
 					    end
			     end

			    local function onRowRender( event )
	                local row = event.row
	                local rowIndex=row.index
	                local groupContentHeight = row.contentHeight
	                print(rowIndex)
	                --印出每行資料
	                local rowTitle = display.newText(row,"title:"..titletable[rowIndex].."  ".."\n".. " Riddle→ "..riddletable[rowIndex], 20, 0, nil, 14 )
	                rowTitle.x = 25
	                -- we also set the anchorX of the text to 0, so the object is x-anchored at the left
	                rowTitle.anchorX = 0
	                print("rowTitle.x:"..rowTitle.x)
	                rowTitle.y = groupContentHeight * 0.5
	                rowTitle:setFillColor(0/255,0/255,0/255)
	                local rowText = display.newText("   # " ..rowIndex,10,groupContentHeight*0.5,system.nativeFont,10  )
	                rowText.fill = {0,0,0}

	                local rowText1 = display.newText(row,riddlelike[rowIndex], 175,  groupContentHeight*0.25, nil, 10   )
	               -- rowText.fill = {0,0,0}
					rowText1:setFillColor(0/255,0/255,0/255)

					local rowText2 = display.newText(row,riddledislike[rowIndex], 175, groupContentHeight*0.75, nil, 10   )
	              --rowText.fill = {0,0,0}
					rowText2:setFillColor(0/255,0/255,0/255)
	            --------------------------------------------------------------------------------
	            --row img   
	                local rowimg =  display.newImage( "muim/like dislike icon.png" )
	                rowimg.x = row.contentWidth-42
	                rowimg.y = groupContentHeight * 0.5
	               
	            -------------------------------------------------------------------------------	
	                row:insert(rowimg)
	                row:insert(rowText)
	                row:insert(rowTitle)
	                row:insert(rowText1)
	                row:insert(rowText2)

            	---------------------------------------------------------------------------------

            	end
    -- Create the widget
	            tableView = widget.newTableView{
	                left =display.contentHeight*0.38,
	                top = 40,
	                height = display.contentHeight*0.75,
	                width = display.contentWidth*0.45,
	                hideBackground = true,
	                listener = tableViewListener,
	                onRowRender = onRowRender,
	            --    onRowTouch = onRowTouch,
	                --listener = scrollListener
	            }
            	sceneGroup:insert(tableView)
           
    
            for i = 1, #titletable do
                local params={}
                local isCategory = false
                local rowHeight = 36
                local rowColor = {default={1,1,1,0}}
                local lineColor = { 0.5, 0.5, 0.5 }
                
                if (i % 2 == 0) then
                    params.isCategory= false
                    params.rowHeight = 36
                    params.rowColor = rowColor
                else 
                    params.isCategory= false
                    params.rowHeight = 36
                    params.rowColor = rowColor
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

	network.request( "http://mmlab.lhu.edu.tw/searchsolveriddle.php", "POST", networkListener, params )------------------------------------------------------------------------------------------------
		--tableview
	 
	
end

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


