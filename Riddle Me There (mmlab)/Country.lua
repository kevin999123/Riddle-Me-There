--Country.lua

local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()
local image
local json = require("json")
local decodedData

local returnPress = function ( self,event ) 
print("abc")
		print(nameTable.country)
	print("cdf")
		if(nameTable.country == 1) then
        	composer.gotoScene( "Register", "fade", 400 )
        elseif(nameTable.country == 2) then 
        	composer.gotoScene( "EditProfile", "fade", 400 )
        end
end


function scene:create( event )
	local sceneGroup = self.view
	local namevalue = {}
	local value
image = display.newImage( "muim/Background-1.png" )
image.x = display.contentCenterX
image.y = display.contentCenterY

--image1 = display.newImage( "muim/native.png" )
--image1.x = display.contentWidth/2
--image1.y = display.contentHeight/1.21

sceneGroup:insert( image )
--sceneGroup:insert( image1 )

------------------------------------------------------------------------------------

	print(nameTable.country)
	-- Status text


	local function networkListener( event )
		if ( event.isError ) then
	        print( "Network error: ", event.response )
	    else
	    	myNewData = event.response
	        print ( "RESPONSE: " .. event.response )

	        decodedData = json.decode(event.response)
	       
		    
		    for i=1,#decodedData do
		    	
				namevalue[i] = decodedData[i]
				
		    end
		    
--------------------------------------------------------------------------------------------------------

	--tableview
	 local function onRowRender( event )
                local row = event.row
                local rowIndex=row.index
                local groupContentHeight = row.contentHeight
                print(rowIndex)
                --印出每行資料
                local rowTitle = display.newText(row,namevalue[rowIndex], 20, 0, nil, 14 )
                rowTitle.x = 30
                -- we also set the anchorX of the text to 0, so the object is x-anchored at the left
                rowTitle.anchorX = 0
                print("rowTitle.x:"..rowTitle.x)
                rowTitle.y = groupContentHeight * 0.55
                rowTitle:setFillColor(0/255,0/255,0/255)
               
                local rowText = display.newText("      " ..rowIndex,10,groupContentHeight*0.5,system.nativeFont,10  )
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
                session = namevalue[rowIndex]




	local function networkListener( event )
		if ( event.isError ) then
	        print( "Network error: ", event.response )
	    else
	    	myNewData = event.response
	        print ( "RESPONSE: " .. event.response )

	        decodedData = json.decode(event.response)
	       
	      
		    	
				value = decodedData
				print(value)
		   
		    session = value
		    if(nameTable.country == 1) then
	        	composer.gotoScene( "Register", "fade", 400 )
	        elseif(nameTable.country == 2) then 
	        	composer.gotoScene( "EditProfile", "fade", 400 )
	        end
		end    
	    
	end

	local headers = {}

	headers["Content-Type"] = "application/x-www-form-urlencoded"
	headers["Accept-Language"] = "en-US"
		print(session)	
	local body = "country="..session

	local params = {}
	params.headers = headers
	params.body = body

	network.request( "http://mmlab.lhu.edu.tw/abbcountry.php", "POST", networkListener, params )

----------------------------------------------------------------------                
                if ( "release" == phase ) then

                	
        
            	end
			end
   


    ---------------------------------------------------------------

   
    -- Create the widget
            tableView = widget.newTableView{
                left =display.contentHeight*0.3,
                top = 40,
                height = display.contentHeight*0.75,
                width = display.contentWidth*0.3,
                hideBackground = true,
                listener = tableViewListener,
                onRowRender = onRowRender,
                onRowTouch = onRowTouch,
                --listener = scrollListener
            }
            sceneGroup:insert(tableView)
           
    
            for i = 1, #namevalue do
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

	

	network.request( "http://mmlab.lhu.edu.tw/selectcountry.php", "GET", networkListener)

	end


	---------------------------------------------------------------------------------------------------
function scene:show( event )
	local phase = event.phase
	composer.removeScene( "Register" )
	composer.removeScene( "EditProfile" )
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


