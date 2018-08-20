local function say(ply, str, args, team)
    local s = table.concat(args, " ")
    return s
end

print("Loaded \"say\" command.")

AAWNN.Commands.say = say