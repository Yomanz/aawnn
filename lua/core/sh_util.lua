--[[
Copyright (c) 2015 - 2018 AAWNN Developers <ry00001@protonmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
]]--
Util = Util or {}

function Util.include(fileName, state)
	if (!fileName) then
    Util.PrintToConsole("INCLUDE", "No file name specified for including.")
	end

	if ((state == "server" or fileName:find("sv_")) and SERVER) then
		include(fileName)
	elseif (state == "shared" or fileName:find("sh_")) then
		if (SERVER) then
			AddCSLuaFile(fileName)
		end

		include(fileName)
	elseif (state == "client" or fileName:find("cl_")) then
		if (SERVER) then
			AddCSLuaFile(fileName)
		else
			include(fileName)
		end
	end
end

function Util.PrintToConsole(...)
	local args = { ... }
	local color = args[3]
	local msgtype = tostring(args[1])
	local msgtypeLen = tostring(string.len(msgtype))
	while (string.len(msgtype) < 8) do
		msgtype = msgtype .. " "
	end

	if (color != nil) then
		local rgbtable = string.Explode(",", color, false)
		local r = tonumber(rgbtable[1])
		local g = tonumber(rgbtable[2])
		local b = tonumber(rgbtable[3])

		MsgC(Color(r, g, b), "AAWNN:" .. msgtype .. " | " .. args[2] .. " \n")
			else
		MsgC(Color(255,69,0), "AAWNN:" .. msgtype .. " | " .. args[2] .. " \n")
	end
end

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