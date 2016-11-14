-- main.lua
        local composer = require( "composer" )

infoTable = {}
valueTable = {}
nameTable = {}
nameTable.name=nil
nameTable.email=nil
nameTable.riddleid=nil
nameTable.country=nil
session= {}

session = 0
deletenumber = 0
insertnumber = 0
local path = system.pathForFile("automatic login.txt",system.DocumentsDirectory)
local file = io.open(path,"r")
local content
if (file) then
	content = file:read("*a")
	io.close(file)
end

if(content) then

	nameTable.email = content
	composer.gotoScene( "Main menu","fade",10)

else
	local composer = require "composer"
	--composer.gotoScene( "Solve",frad,10)
	--composer.gotoScene( "Reply",frad,10)
	--composer.gotoScene( "Check",frad,10)
	--composer.gotoScene( "local",frad,10)
	--composer.gotoScene( "Main menu",frad,10)
	--composer.gotoScene( "Register",frad,10)
	composer.gotoScene( "Front cover",frad,10)
	--composer.gotoScene( "Correct",frad,10)
	--composer.gotoScene( "wrong",frad,10)
	--composer.gotoScene( "Scores",frad,10)
	--composer.gotoScene( "Create",frad,10)
end
