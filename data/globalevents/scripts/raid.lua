local raid=
{
{["nome"]="Ghazbaran",["dia_semana_ou_mes"]="semana",["dia"]={7},["hora"]=15,["minuto"]=32},
{["nome"]="Demodras",["dia_semana_ou_mes"]="semana",["dia"]={1},["hora"]=15,["minuto"]=0}
}

function onThink(interval)
   local time = os.date("*t")
   for _,a in pairs(raid) do
       if ((a["dia_semana_ou_mes"] == "semana" and  isInArray(time.wday,a["dia"])) or (a["dia_semana_ou_mes"] == "mes" and  isInArray(time.day,a["dia"]))) and  a["hora"] == time.hour and  a["minuto"] == time.min then
           executeRaid(a["nome"])
           break
       end
   end
   return true
end