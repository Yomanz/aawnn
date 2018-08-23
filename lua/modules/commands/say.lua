local function say(ply, str, args, team)
    local s = table.concat(args, " ")
    return s
end

AAWNN.Commands.say = say