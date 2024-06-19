## Intinialize saveinstance

```lua
local HttpService = game:GetService("HttpService")
local IntinializeParams = {
    ["MainURL"] = "https://raw.githubusercontent.com/boydev1444/Boy-s-saveinstance/main/",
    ["SSI"] = "saveinstance",
}

local SaveInstanceOptions = {
    SavePlayers = false,
    SafeMode = true,
    PlayerCharacters = false,
    Decompile = true,
}

--// main saveinstance
loadstring(HttpService:GetAsync(IntinializeParams.MainURL..IntinializeParams.SSI..".lua", true), IntinializeParams.SSI)(SaveInstanceOptions)
