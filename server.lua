local QBCore = exports['qb-core']:GetCoreObject()

-- Função auxiliar para gerar matrícula aleatória
local function GeneratePlate()
    local plate = QBCore.Shared.RandomInt(1) .. QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(2)
    local result = MySQL.scalar.await('SELECT plate FROM player_vehicles WHERE plate = ?', { plate })
    if result then
        return GeneratePlate()
    else
        return plate:upper()
    end
end

RegisterNetEvent('qb_welcome:givePrize')
AddEventHandler('qb_welcome:givePrize', function(prizeIndex)
    local src     = source
    local Player  = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local prize = Config.Prizes[prizeIndex]
    if not prize then
        print('[qb_welcome] ERRO: prize é nil | prizeIndex:', prizeIndex)
        return
    end

    -- Dinheiro
    if prize.money and prize.money > 0 then
        Player.Functions.AddMoney('bank', prize.money, 'welcome-reward')
    end

    -- Itens
    if prize.items then
        for _, v in ipairs(prize.items) do
            if v.item and v.count and v.count > 0 then
                Player.Functions.AddItem(v.item, v.count)
            end
        end
    end

    -- Carro
    if (prize.type == 'car' or prize.type == 'bundle') and prize.carModel then
        local plate = GeneratePlate()
        MySQL.insert(
            'INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, garage, state) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
            {
                Player.PlayerData.license,
                Player.PlayerData.citizenid,
                prize.carModel,
                GetHashKey(prize.carModel),
                '{}',
                plate,
                'pillboxgarage',
                1
            }
        )
    end

    -- Registo na BD
    MySQL.insert(
        'INSERT INTO welcome_rewards (identifier, prize, redeemed_at) VALUES (?, ?, NOW())',
        { Player.PlayerData.citizenid, prizeIndex },
        function(rowsChanged)
            if rowsChanged then
                print('[qb_welcome] ' .. Player.PlayerData.citizenid .. ' escolheu o prémio ' .. prizeIndex)
            end
        end
    )

    TriggerClientEvent('qb_welcome:notify', src, 'Recebeste o prémio: ' .. prize.label, 'success')
end)

RegisterNetEvent('qb_welcome:checkRedeemed')
AddEventHandler('qb_welcome:checkRedeemed', function()
    local src    = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    MySQL.scalar(
        'SELECT COUNT(*) FROM welcome_rewards WHERE identifier = ?',
        { Player.PlayerData.citizenid },
        function(count)
            TriggerClientEvent('qb_welcome:checkResult', src, count > 0)
        end
    )
end)