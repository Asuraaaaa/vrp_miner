local Proxy = module("vrp", "lib/Proxy")
local Tunnel = module("vrp", "lib/Tunnel")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_miner")
vRPCminer = Tunnel.getInterface("vRP_miner","vRP_miner")

vRPminer = {}
Tunnel.bindInterface("vRP_miner",vRPminer)
Proxy.addInterface("vRP_miner",vRPminer)


RegisterServerEvent('vRP_miner:Pay')
AddEventHandler('vRP_miner:Pay', function()
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
    if player then
        vRP.giveMoney({user_id,25000})
		vRPclient.notify(player, {"[~o~Thor~w~] Ai primit ~g~$25000 ~w~pentru job-ul de ~p~Miner~w~!"})
	end
end)


