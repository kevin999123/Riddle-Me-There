--ConfirmFriends.lua
local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()
local image
local json = require("json")


local nextPress = function ( self,event ) 
		
        composer.gotoScene( "Friends", "fade", 400 )
end

local nextPress1 = function ( self,event ) 
		
        composer.gotoScene( "Messages", "fade", 400 )
end

local nextPress2 = function ( self,event ) 
		
        composer.gotoScene( "invitefriends2", "fade", 400 )
end


function scene:create( event )
	local sceneGroup = self.view
	local friendsname = {}
	
image = display.newImage( "muim/background-18.png" )
image.x = display.contentCenterX
image.y = display.contentCenterY


image1 = display.newImage( "muim/ConfirmFriends.png" )
image1.x = display.contentWidth/1.23
image1.y = display.contentHeight/1.48


sceneGroup:insert( image )
sceneGroup:insert( image1 )




			local function networkListener( event )
				if ( event.isError ) then
	        		print( "Network error: ", event.response )
	    		else

	        		print ( "RESPONSE: " .. event.response )
	        		result = event.response
	        		decodedData = json.decode(event.response)
	        		print(result)

	        		if(result ~= nil) then
		        		for i=1,#decodedData do
							friendsname[i] = decodedData[1]
							
						end    
	-----------------------------------------------------------------------------------------------------

		--tableview
				 		local function onRowRender( event )
			                local row = event.row
			                local rowIndex=row.index
			                local groupContentHeight = row.contentHeight
			                print(rowIndex)
			                --印出每行資料
			                local rowTitle = display.newText(row,friendsname[rowIndex], 20, 0, native.systemFontBold, 19 )
			                rowTitle.x = 35
			                -- we also set the anchorX of the text to 0, so the object is x-anchored at the left
			                rowTitle.anchorX = 0
			                print("rowTitle.x:"..rowTitle.x)
			                rowTitle.y = groupContentHeight * 0.55
			                rowTitle:setFillColor(255/255,246/255,134/255)
			               
			                row:insert(rowTitle)
			            end

		 				local function onRowTouch( event )
			                local phase = event.phase
			                local row = event.row
			                local rowIndex=row.index
			                --nameTable.riddleid=idtable[row.index]
			                if ( "release" == phase ) then
			                	local function onComplete( event )
									if ( event.action == "clicked" ) then
													    	
										local i = event.index
												print(i)	        
										if ( i == 1 ) then
											 -- Confirm
											local function networkListener( event )
												if ( event.isError ) then
									        		print( "Network error: ", event.response )
									    		else

									        		print ( "RESPONSE: " .. event.response )
									        		result = event.response
									        		
									        		composer.gotoScene( "Main menu", "fade", 400 )
									        		
									    		end
											end

											local headers = {}

											headers["Content-Type"] = "application/x-www-form-urlencoded"
											headers["Accept-Language"] = "en-US"
											
											local body = "friendname="..friendsname[row.index].."&email="..nameTable.email
											
											local params = {}
											params.headers = headers
											params.body = body

											network.request( "http://mmlab.lhu.edu.tw/confirmfriends.php", "POST", networkListener, params )
									           
																
										elseif ( i == 2 ) then
											--Cancel


										elseif (i == 3) then
											--delete
											local function networkListener( event )
												if ( event.isError ) then
									        		print( "Network error: ", event.response )
									    		else

									        		print ( "RESPONSE: " .. event.response )
									        		result = event.response
									        		composer.gotoScene( "Main menu", "fade", 400 )
									    		end
											end

											local headers = {}

											headers["Content-Type"] = "application/x-www-form-urlencoded"
											headers["Accept-Language"] = "en-US"
											
											local body = "friendname="..friendsname[row.index].."&email="..nameTable.email
											
											local params = {}
											params.headers = headers
											params.body = body

											network.request( "http://mmlab.lhu.edu.tw/deletefriends.php", "POST", networkListener, params )

										end
									 end
								end

								local alert = native.showAlert( "Riddle Me There", "確認"..friendsname[row.index].."加入為好友", {"Confirm", "Cancel","delete"}, onComplete )
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
		end

		local headers = {}

		headers["Content-Type"] = "application/x-www-form-urlencoded"
		headers["Accept-Language"] = "en-US"
			
		local body = "email="..nameTable.email

		local params = {}
		params.headers = headers
		params.body = body

		network.request( "http://mmlab.lhu.edu.tw/receivefriends.php", "POST", networkListener, params )






	local nextPress = widget.newButton
 { 
	
	defaultFile = "muim/friends.png",
	overFile = "muim/friends.png",
	emboss = true,
	onPress = nextPress,
	--onRelease = button1Release,
 }
     sceneGroup:insert(nextPress)
    nextPress.x =display.contentWidth/1.13
	nextPress.y =display.contentHeight/2.4

	local nextPress1 = widget.newButton
 { 
	
	defaultFile = "muim/Messages.png",
	overFile = "muim/Messages.png",
	emboss = true,
	onPress = nextPress1,
	--onRelease = button1Release,
 }
     sceneGroup:insert(nextPress1)
    nextPress1.x =display.contentWidth/1.14 
	nextPress1.y =display.contentHeight/	1.28


	local nextPress2 = widget.newButton
 { 
	
	defaultFile = "muim/invitefriends.png",
	overFile = "muim/invitefriends.png",
	emboss = true,
	onPress = nextPress2,
	--onRelease = button1Release,
 }
     sceneGroup:insert(nextPress2)
    nextPress2.x =display.contentWidth/1.21
	nextPress2.y =display.contentHeight/1.8

--
end
function scene:show( event )
	local phase = event.phase
	composer.removeScene( "Front cover" )
	composer.removeScene( "invitefriends2" )
	composer.removeScene( "Messages" )
	composer.removeScene( "Friends" )
		
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


