local function random(ply, str, args, team)
    local ind = math.random(1, #args)
    ply:ChatPrint(args[ind])
    return ""
end

AAWNN.Commands.random = random