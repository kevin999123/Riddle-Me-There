--AAME.lua

local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()

---------------------------------------------------------

function scene:create( event )
	local sceneGroup = self.view
	system.openURL("https://www.youtube.com/")
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