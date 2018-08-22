--[[
    AAWNN Server-Side Stuff
    (C) ry00001 2018
]]--

AAWNN = {}

AAWNN.Prefix = "-"

AAWNN.Commands = {}

function AAWNN:IsAdmin(name)
    if name == "ry00001" then
        return true -- !!!!!!!!!!!!! VERY TEMPORARY
    end
end

function AAWNN:GetPlayer(name) 
    name = string.lower(name)
    for _,v in ipairs(player.GetAll()) do
        if (string.find(string.lower(v:Name()),name,1,true) != nil) then return v end
    end
end

function AAWNN:GlobalChat(str)
    for k,p in pairs(player.GetAll()) do
        p:ChatPrint(str)
    end
end

function table.RemoveCount(tab, count)
    local ret = {}
    for i=1,count do
        local item = table.remove(tab, 1)
        table.insert(ret, item)
    end
    return ret
end

function AAWNN_EventChat(ply, text, team)
    local plen = #AAWNN.Prefix
    if not string.StartWith(text, AAWNN.Prefix) then 
        return 
    end
    local prefixless = text:sub(plen+1)
    local split = prefixless:Split(" ")
    local command = table.remove(split, 1) -- avoid double-calls
    if AAWNN.Commands[command] then
        local cmd = AAWNN.Commands[command]
        return cmd(ply, text, split, team)
    end
end

hook.Add("PlayerSay", "AAWNNChatEvt", AAWNN_EventChat)

local cmdfiles = {
    'ban',
    'kick',
    'random',
    'say'
}

for _,i in pairs(cmdfiles) do
    include("commands/"..i..".lua")
    print("[AAWNN] Loaded "..i.." command.")
end

print("AAWNN loaded successfully.")