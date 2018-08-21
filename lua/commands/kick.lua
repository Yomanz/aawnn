local function kick(ply, str, args, team)
    if not ply:IsAdmin() then
        ply:ChatPrint("You are not admin.")
        return ""
    end
    local tokick = AAWNN:GetPlayer(args[1])
    if not tokick then
        ply:ChatPrint("Invalid player.")
        return ""
    end
    local reason = "No reason"
    if args[2] then
        table.remove(args, 1)
        reason = table.concat(args, " ")
    end
    tokick:Kick(string.format([[You were kicked by %s: %s]], ply:GetName(), reason))
    AAWNN:GlobalChat(string.format([[%s kicked %s (%s)]], ply:GetName(), tokick:GetName(), reason))
    return ""
end

AAWNN.Commands.kick = kick