local saveServices = {
	"Workspace",
	"Lighting",
	"MaterialService",
	"ServerScriptService",
	"ServerStorage",
	"StarterGui",
	"StarterPack",
}

local httpService = game:GetService("HttpService")
local localPlayer = game.Players.LocalPlayer;


local Params = {
	RepoURL = "https://raw.githubusercontent.com/luau/SomeHub/main/",
	UMF = "UniversalMethodFinder",
	ROM = "RequireOnlineModule",
}

local finder, globalcontainer = loadstring(httpService:GetAsync(Params.RepoURL .. Params.UMF .. ".luau", true), Params.UMF)()

finder({
	-- readbinarystring = 'string.find(...,"bin",nil,true)', -- ! Could match some unwanted stuff
	decompile = '(string.find(...,"decomp",nil,true) and string.sub(...,#...) ~= "s") or string.find(...,"assembl",nil,true)',
	gethiddenproperty = 'string.find(...,"get",nil,true) and string.find(...,"h",nil,true) and string.find(...,"prop",nil,true) and string.sub(...,#...) ~= "s"',
	gethiddenproperties = 'string.find(...,"get",nil,true) and string.find(...,"h",nil,true) and string.find(...,"prop",nil,true) and string.sub(...,#...) == "s"',
	sethiddenproperty = 'string.find(...,"set",nil,true) and string.find(...,"h",nil,true) and string.find(...,"prop",nil,true) and string.sub(...,#...) ~= "s"',
	gethui = 'string.find(...,"get",nil,true) and string.find(...,"h",nil,true) and string.find(...,"ui",nil,true)',
	getnilinstances = 'string.find(...,"nil",nil,true)', -- ! Could match some unwanted stuff
	getproperties = 'string.find(...,"get",nil,true) and string.find(...,"prop",nil,true) and string.sub(...,#...) == "s"',
	getspecialinfo = 'string.find(...,"get",nil,true) and string.find(...,"spec",nil,true)',
	protectgui = 'string.find(...,"protect",nil,true) and string.find(...,"ui",nil,true) and not string.find(...,"un",nil,true)',
	writefile = 'string.find(...,"file",nil,true) and string.find(...,"write",nil,true)',
}, true)


local writefile = globalcontainer.writefile

return function(options : {SavePlayers : boolean, Decompile : boolean , SavePlayerCharacters : boolean , NilInstances : boolean })
	if options.SavePlayers then
		table.insert(saveServices , "Players")
		table.insert(saveServices , "StarterPlayer")
	end

	writefile("aaaaaaaa")
	print("saved")
	
	
	if not localPlayer.PlayerGui:FindFirstChild("decompileGui") then
		local gui = Instance.new("ScreenGui",localPlayer.PlayerGui)
		gui.Name = "decompileGui"
		gui.DisplayOrder = 1000000000
		gui.IgnoreGuiInset = true
		gui.ResetOnSpawn = false
	else
		warn("there is already a decompiling process")
	end
end


