local firstItems = {}
firstItems[0] =
{
2173,
2536,
2428,
2124,
2491,
2488,
2643
}
firstItems[1] =
{
2173,
2536,
2190,
2124,
2323,
7730,
2643
}
firstItems[2] =
{
2173,
2536,
2182,
2124,
2323,
7730,
2643
}
firstItems[3] =
{
2173,
2536,
2389,
2124,
2491,
2488,
2643
}
firstItems[4] =
{
2173,
2536,
2428,
2124,
2491,
2488,
2643
}

function onLogin(cid)
if getPlayerStorageValue(cid, 30001) == -1 then
for i = 1, table.maxn(firstItems[getPlayerVocation(cid)]) do
doPlayerAddItem(cid, firstItems[getPlayerVocation(cid)][i], 1)
end
if getPlayerSex(cid) == 0 then
doPlayerAddItem(cid, 2656, 1)
else
doPlayerAddItem(cid, 2656, 1)
end
local bag = doPlayerAddItem(cid, 5926, 1)
doAddContainerItem(bag, 2160, 5)
doAddContainerItem(bag, 2554, 1)
doAddContainerItem(bag, 2120, 1)
doAddContainerItem(bag, 7618, 5)
doAddContainerItem(bag, 2383, 1)
setPlayerStorageValue(cid, 30001, 1)
end
return TRUE
end