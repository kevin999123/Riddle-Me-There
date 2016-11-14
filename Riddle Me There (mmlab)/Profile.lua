--Profile.lua

local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()
local json = require("json")
local decodedData
local img,imagecamera
-------------------------------------------------------
local function onSceneTouch1( self, event )
	if event.phase == "began" then
		composer.gotoScene( "EditProfile", "slideLeft", 800  )
		
	end
end

local returnPress = function ( self,event ) 
           composer.gotoScene( "Main menu", "fade", 400 )
end


function scene:create( event )
	local sceneGroup = self.view
	local namevalue,countryvalue,agevalue,sexvalue,createvalue,solvevalue

	display.setStatusBar( display.HiddenStatusBar )
----------------------------------------------------------------------------------------
	local path = system.pathForFile("image.jpg",system.DocumentsDirectory)
	local file = io.open(path,"r")
	local content
	if (file) then
		content = file:read("*a")
		io.close(file)
	end
----------------------------------------------------------------------------------------
	image = display.newImage( "muim/background-16.png" )
	image.x = display.contentCenterX
	image.y = display.contentCenterY
	
	image1 = display.newImage( "muim/Profile.png" )
	image1.x = display.contentWidth/1.1
	image1.y = display.contentHeight/2.3


	image2 = display.newImage( "muim/EditProfile.png" )
	image2.x = display.contentWidth/1.17
	image2.y = display.contentHeight/1.75

	image3 = display.newImage( "muim/age1.png" )
	image3.x = display.contentWidth/4
	image3.y = display.contentHeight/4.1

	image4 = display.newImage( "muim/email2.png" )
	image4.x = display.contentWidth/4.2
	image4.y = display.contentHeight/1.65

	image5 = display.newImage( "muim/country2.png" )
	image5.x = display.contentWidth/4.2
	image5.y = display.contentHeight/1.45

	image6 = display.newImage( "muim/solvedriddles.png" )
	image6.x = display.contentWidth/3.55
	image6.y = display.contentHeight/1.27

	image7 = display.newImage( "muim/createdriddles.png" )
	image7.x = display.contentWidth/3.7
	image7.y = display.contentHeight/1.13
	

	sceneGroup:insert( image)	
	sceneGroup:insert( image1)	
	sceneGroup:insert( image2)	
	sceneGroup:insert( image3)	
	sceneGroup:insert( image4)	
	sceneGroup:insert( image5)
	sceneGroup:insert( image6)
	sceneGroup:insert( image7)	
	image2.touch = onSceneTouch1

--------------------------------------------------------------------------------------------
local function onSceneTouch2( self, event )
		
		if event.phase == "began" then
			
			local function onComplete( event )
				
				local action = event.action
				local i = event.index
				if "clicked" == event.action then
					if (i == 1) then
						local function onComplete( event )
							photo = event.target

							photoGroup = display.newGroup()  
						    photoGroup:insert(photo)
						 	
						    photo.x = 290	
							photo.y = 80
			   				photo.width=80
							photo.height=80

						    local tmpDirectory = system.DocumentsDirectory
						    display.save(photoGroup, "image.jpg", tmpDirectory) 
 
				
				
				
						end
			
			
			


			
						if media.hasSource( media.Camera ) then
							media.capturePhoto( { listener=onComplete} )

						else
							native.showAlert( "Corona", "This device does not have a camera.", { "OK" } )
						end
					elseif ( i == 2 )  then
						print("123")
						local function onComplete( event )
							photo = event.target

							photoGroup = display.newGroup()  
						    photoGroup:insert(photo)
						 	
						    photo.x = 290	
							photo.y = 80
			   				photo.width=80
							photo.height=80

						    local tmpDirectory = system.DocumentsDirectory
						    display.save(photoGroup, "image.jpg", tmpDirectory) 
 
				
				
				
						end
			
			
			


			
						if media.hasSource( media.PhotoLibrary ) then
   							media.selectPhoto( { mediaSource=media.PhotoLibrary, listener=onComplete } )

						else
							native.showAlert( "Corona", "This device does not have a camera.", { "OK" } )
						end
					end
				
					
				end
			end

-- Show alert
			local alert = native.showAlert( "Riddle Me There", "Please select the photo mode.", { "拍照", "檔案" }, onComplete )
			
			


		end
end		        

if (content) then
	imagecamera = display.newImage("image.jpg",system.DocumentsDirectory,290,80)
	imagecamera.width=80
	imagecamera.height=80
	sceneGroup:insert( imagecamera )
	imagecamera.touch = onSceneTouch2
else

	img =display.newImage( "muim/No photo.png" )
	img.x = display.contentWidth/1.65
	img.y = display.contentHeight/4

	sceneGroup:insert( img )
	img.touch = onSceneTouch2
end


--------------------------－-----------------------------------------------------------------

	local function networkListener( event )
		if ( event.isError ) then
		   print( "Network error: ", event.response )
		else

		    print ( "RESPONSE: " .. event.response )
		    decodedData = json.decode(event.response)
		    for i=1,#decodedData do
		    	
				namevalue = decodedData[1]
				countryvalue = decodedData[2]
				agevalue = decodedData[3]
				sexvalue = decodedData[4]
				createvalue = decodedData[5]
				solvevalue = decodedData[6]
		    end    	
		   	
		    local name = display.newText(namevalue,display.contentWidth/3.3,45,native.systemFont,16)
 			name:setFillColor( 0, 0, 0)
 			sceneGroup:insert( name)

 			local age2 = display.newText(agevalue,display.contentWidth/3,78,native.systemFont,16)
 			age2:setFillColor( 0, 0, 0)
 			sceneGroup:insert( age2)

 			local sex = display.newText(sexvalue,display.contentWidth/3.3,115,native.systemFont,16)
 			sex:setFillColor( 0, 0, 0)
 			sceneGroup:insert( sex)

 			local email2 = display.newText(nameTable.email,display.contentWidth/1.9,190,native.systemFont,16)
 			email2:setFillColor( 0, 0, 0)
 			sceneGroup:insert( email2)

 			local country2 = display.newText(countryvalue,display.contentWidth/1.65,220,native.systemFont,16)
 			country2:setFillColor( 0, 0, 0)
 			sceneGroup:insert( country2)

 			local solve2 = display.newText(solvevalue,display.contentWidth/1.65,250,native.systemFont,16)
 			solve2:setFillColor( 0, 0, 0)
 			sceneGroup:insert( solve2)

 			local create2 = display.newText(createvalue,display.contentWidth/1.65,280,native.systemFont,16)
 			create2:setFillColor( 0, 0, 0)
 			sceneGroup:insert( create2)



   		
		end
	end

	local headers = {}

	headers["Content-Type"] = "application/x-www-form-urlencoded"
	headers["Accept-Language"] = "en-US"
	
	local body = "email="..nameTable.email
	
				
	local params = {}
	params.headers = headers
	params.body = body

	network.request( "http://mmlab.lhu.edu.tw/searchprofile.php", "POST", networkListener, params )
--------------------------------------------------------------------------------------------------

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

end
----------------------------------------------------------------------------------------------------------
function scene:show( event )
	local phase = event.phase
	composer.removeScene("Main menu")
	composer.removeScene("EditProfile")
	if "did" == phase then
		print( "1: show event, phase did" )
	local path = system.pathForFile("image.jpg",system.DocumentsDirectory)
	local file = io.open(path,"r")
	local content
	if (file) then
		content = file:read("*a")
		io.close(file)
	end

local showMem = function()	
		image2:addEventListener( "touch", image2 )
		if(content) then
			imagecamera:addEventListener( "touch", imagecamera )
		else
			img:addEventListener( "touch", img )
		end
	end
		memTimer = timer.performWithDelay( 500, showMem, 1 )

	end	
end

function scene:hide( event )
	local phase = event.phase
	if "will" == phase then
		image2:removeEventListener( "touch", image2 )

		local path = system.pathForFile("image.jpg",system.DocumentsDirectory)
	local file = io.open(path,"r")
	local content
	if (file) then
		content = file:read("*a")
		io.close(file)
	end

		if(content) then
			imagecamera:removeEventListener( "touch", imagecamera )
		else
			img:removeEventListener( "touch", img )
		end
		
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