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
AAWNN = AAWNN or {}

AAWNN.Prefix = "-"

AAWNN.Commands = {}

include( "core/sh_core.lua" )
Util.include("core/sh_core.lua", "shared")

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

Util.PrintToConsole("ADDON", "Loaded Successfully!")



hook.Add("ModuleInitialized", "testHook", function()
    Util.PrintToConsole("MODULE ", "ModuleInitialized has been called!")
  end)