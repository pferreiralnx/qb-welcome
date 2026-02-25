local QBCore = exports['qb-core']:GetCoreObject()
local isUIOpen = false

RegisterCommand('welcome', function()
    if isUIOpen then return end
    TriggerServerEvent('qb_welcome:checkRedeemed')
end, false)

RegisterNetEvent('qb_welcome:checkResult')
AddEventHandler('qb_welcome:checkResult', function(hasRedeemed)
    if hasRedeemed then
        QBCore.Functions.Notify('Já resgataste o teu prémio de boas-vindas!', 'error')
    else
        OpenWelcomeUI()
    end
end)

function OpenWelcomeUI()
    isUIOpen = true
    SetNuiFocus(true, true)

    local prizesData = {}
    for i, prize in ipairs(Config.Prizes) do
        prizesData[i] = {
            index       = i,
            label       = prize.label,
            description = prize.description,
            badge       = prize.badge,
            image       = prize.image,
        }
    end

    SendNUIMessage({
        action   = 'openUI',
        title    = Config.Title,
        subtitle = Config.Subtitle,
        prizes   = prizesData
    })
end

function CloseWelcomeUI()
    isUIOpen = false
    SetNuiFocus(false, false)
    SendNUIMessage({ action = 'closeUI' })
end

RegisterNUICallback('choosePrize', function(data, cb)
    cb('ok')
    local prizeIndex = tonumber(data.prize)

    if not prizeIndex then
        print('[qb_welcome] ERRO: prizeIndex é nil! data.prize = ' .. tostring(data.prize))
        return
    end

    local prize = Config.Prizes[prizeIndex]

    if not prize then
        print('[qb_welcome] ERRO: prize é nil! prizeIndex = ' .. tostring(prizeIndex))
        return
    end

    CloseWelcomeUI()

    TriggerServerEvent('qb_welcome:givePrize', prizeIndex)
end)

RegisterNUICallback('closeUI', function(data, cb)
    CloseWelcomeUI()
    cb('ok')
end)

RegisterNetEvent('qb_welcome:notify')
AddEventHandler('qb_welcome:notify', function(msg, msgType)
    QBCore.Functions.Notify(msg, msgType or 'success')
end)