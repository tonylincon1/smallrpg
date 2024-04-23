function onSay(cid, words, param)
if db.executeQuery("UPDATE killers SET unjustified = 0 WHERE id NOT IN (SELECT kill_id FROM player_killers WHERE player_id NOT IN (SELECT id FROM players));") then
return doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_BLUE,'Todos os frags do serve foram removidos!.')
end
return doPlayerSendCancel(cid, '[Error] não foi possivel deletar as frags do servidor')
end