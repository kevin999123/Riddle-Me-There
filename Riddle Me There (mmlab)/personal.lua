--personal.lua

local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()
local json = require("json")
local decodedData
local scoreT
local quantityC
local scoreC
local quantityS
local scoreS
local quantityL
local quantityD
-------------------------------------------------------
local nextPress = function ( self,event ) 
           composer.gotoScene( "countryscore", "fade", 400 )
end

local nextPress1 = function ( self,event ) 
           composer.gotoScene( "Global", "fade", 400 )
end

local nextPress2 = function ( self,event ) 
           composer.gotoScene( "Scores", "fade", 400 )
end

local returnPress = function ( self,event ) 
           composer.gotoScene( "Main menu", "fade", 400 )
end

local nextPress3 = function ( self,event ) 
           composer.gotoScene( "Global", "fade", 400 )
end
---------------------------------------------------------

function scene:create( event )
	local sceneGroup = self.view

	image = display.newImage( "muim/background-0.png" )
	image.x = display.contentCenterX
	image.y = display.contentCenterY

	image1 = display.newImage( "muim/reel-1.png" )
	image1.x = display.contentWidth/1.1
	image1.y = display.contentHeight/1.45

	image2 = display.newImage( "muim/personal.png" )
	image2.x = display.contentWidth/1.15
	image2.y = display.contentHeight/1.2

 
	
	sceneGroup:insert( image)	
	sceneGroup:insert( image1)
	sceneGroup:insert( image2)

-------------------------------------------------------------------------------
 local totalscore = display.newText("Total Score:",display.contentWidth/2-35,50,native.systemFont,20)
 totalscore:setFillColor( 1, 1, 1)
 sceneGroup:insert( totalscore)

 local solveriddlepoint = display.newText("Solved Riddle Point:",display.contentWidth/2-40,80,native.systemFont,14)
 solveriddlepoint:setFillColor( 0, 0, 0)
 sceneGroup:insert( solveriddlepoint)

 local createriddlepoint = display.newText("Created Riddle Point:",display.contentWidth/2-39,117,native.systemFont,14)
 createriddlepoint:setFillColor( 0, 0, 0)
 sceneGroup:insert( createriddlepoint)

 local likeriddlepoint = display.newText("Liked Riddle Point:",display.contentWidth/2-43,154,native.systemFont,14)
 likeriddlepoint:setFillColor( 0, 0, 0)
 sceneGroup:insert( likeriddlepoint)

 local dislikeriddlepoint = display.newText("Disliked Riddle Point:",display.contentWidth/2-43,191,native.systemFont,14)
 dislikeriddlepoint:setFillColor( 0, 0, 0)
 sceneGroup:insert( dislikeriddlepoint)

 local createriddle= display.newText("Created Riddle:",display.contentWidth/2-60,228,native.systemFont,14)
 createriddle:setFillColor( 0, 0, 0)
 sceneGroup:insert( createriddle)

 local solveriddle= display.newText("Solved Riddle:",display.contentWidth/2-63,265,native.systemFont,14)
 solveriddle:setFillColor( 0, 0, 0)
 sceneGroup:insert( solveriddle)


-------------------------------------------------------------------------------
local function networkListener( event )
	if ( event.isError ) then
		print( "Network error: ", event.response )
	else

		print ( "RESPONSE: " .. event.response )
		decodedData = json.decode(event.response)
		print(decodedData[1])
		for i=1,#decodedData do
			scoreT = decodedData[1]
			quantityC = decodedData[2]
			scoreC = decodedData[3]
			quantityS = decodedData[4]
			scoreS = decodedData[5]
			quantityL = decodedData[6]
			quantityD = decodedData[7]
		end        		
		--------------------------------------------------------------------------------		       
		local totalscore2 = display.newText(scoreT,display.contentWidth/2+60,50,native.systemFont,20)
 		totalscore2:setFillColor( 1, 1, 1)
 		sceneGroup:insert( totalscore2)

 		local solveriddlepoint2 = display.newText(scoreS,display.contentWidth/2+58,99,native.systemFont,14)
 		solveriddlepoint2:setFillColor( 0, 0, 0)
 		sceneGroup:insert( solveriddlepoint2)

 		local createriddlepoint2 = display.newText(scoreC,display.contentWidth/2+58,140,native.systemFont,14)
 		createriddlepoint2:setFillColor( 0, 0, 0)
 		sceneGroup:insert( createriddlepoint2)

 		local likeriddlepoint2 = display.newText(quantityL,display.contentWidth/2+58,169,native.systemFont,14)
 		likeriddlepoint2:setFillColor( 0, 1, 0)
 		sceneGroup:insert( likeriddlepoint2)

 		local dislikeriddlepoint2 = display.newText(quantityD,display.contentWidth/2+58,205,native.systemFont,14)
 		dislikeriddlepoint2:setFillColor( 1, 0, 0)
 		sceneGroup:insert( dislikeriddlepoint2)

 		local createriddle2= display.newText(quantityC,display.contentWidth/2+58,238,native.systemFont,14)
 		createriddle2:setFillColor( 0, 0, 0)
 		sceneGroup:insert( createriddle2)

 		local solveriddle2= display.newText(quantityS,display.contentWidth/2+58,276,native.systemFont,14)
 		solveriddle2:setFillColor( 0, 0, 0)
 		sceneGroup:insert( solveriddle2)

	end
end

local headers = {}

headers["Content-Type"] = "application/x-www-form-urlencoded"
headers["Accept-Language"] = "en-US"
				
local body = "email="..nameTable.email
				
				
local params = {}
params.headers = headers
params.body = body

network.request( "http://mmlab.lhu.edu.tw/score.php", "POST", networkListener, params )
--------------------------------------------------------------------------------
print(scoreT)
print(scoreS)

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
	defaultFile = "muim/friends.png",
	overFile = "muim/friends.png",
	emboss = true,
	onPress = nextPress2,
	--onRelease = button1Release,
 }
     sceneGroup:insert(nextPress2)
    nextPress2.x =display.contentWidth/1.13
	nextPress2.y =display.contentHeight/2.05

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
	local button4 = widget.newButton
 { 
	
	defaultFile = "muim/global1.png",
	overFile = "muim/global1.png",
	id = "3",
	emboss = true,
	onPress = nextPress3,
	--onRelease = button1Release,
 }
     sceneGroup:insert(button4)
    button4.x =display.contentWidth/1.23
	button4.y =display.contentHeight/1.37		
	
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