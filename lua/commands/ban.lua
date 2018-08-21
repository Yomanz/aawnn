local function ban(ply, str, args, team)
    if not ply:IsAdmin() then
        ply:ChatPrint("You are not admin.")
        return ""
    end
    local target = AAWNN:GetPlayer(args[1])
    if not target then
        ply:ChatPrint("Invalid player.")
        return ""
    end
    local reason = "No reason"
    local time = 0 or args[2]
    if args[3] then
        table.RemoveCount(args, 2)
        reason = table.concat(args, " ")
    end
    target:Ban(time)
    target:Kick(string.format([[--== BANNED ==--
You were banned by %s
Reason given: %s]], ply:GetName(), reason))
    AAWNN:GlobalChat(string.format([[%s banned %s (%s)]], ply:GetName(), target:GetName(), reason))
    return ""
end

AAWNN.Commands.ban = ban