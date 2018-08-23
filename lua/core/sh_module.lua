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
Module = Module or {}

function Module.load(uniqueID, path, isSingleFile, variable)
  variable = variable or "MODULE"
  Util.include(isSingleFile and path or path.."/"..variable:lower()..".lua", "shared")

  local pathL = path
  while(string.len(pathL) < 40) do
    pathL = pathL.. " "
  end
  if(!string.EndsWith(path,".lua")) then
    Util.PrintToConsole("MODULE", "[ "..pathL.." ] | Loaded")
  elseif(string.EndsWith(path,".lua")) then
    Util.PrintToConsole("MODULE", "[ "..pathL.." ] | Loaded")
  end
end

function Module.loadFromDir(directory)
	local files, folders = file.Find(directory.."/*", "LUA")

	for k, v in ipairs(folders) do
		Module.load(v, directory.."/"..v)
	end

	for k, v in ipairs(files) do
		Module.load(string.StripExtension(v), directory.."/"..v, true)
	end
end

function Module.initialize()
  Module.loadFromDir("modules/commands")
end