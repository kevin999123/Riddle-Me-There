local json = require("json")
local widget= require("widget")
local decodedData
local myNewData
local nametable = {}
local grade = {}
local created = {}
local solved = {}
local tableView
local I = {}	

 I.networktableview =function (n, m )
   
    display.remove(tableView)
        tableView = nil 
  function networkListener( event )
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
			
	local body = "button="..m
	
	local params = {}
	params.headers = headers
	params.body = body

	network.request( n, "POST", networkListener, params )
end

 I.removetableview =function (event)
         display.remove(tableView)
        tableView = nil 
 end

return I;