repeat
    wait()
until game:IsLoaded() and game.Players.LocalPlayer:FindFirstChild("DataLoaded")
repeat
    wait()
until not game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Main (minimal)")
local requests = http_request or request
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Plr = Players.LocalPlayer

local function invokeServer(...)
    return ReplicatedStorage.Remotes.CommF_:InvokeServer(...)
end

local args =
    {'Death Step', 'Sharkman Karate', 'Electric Claw', 'Dragon Talon', 'Superhuman', 'Godhuman', 'Sanguine Art'}
local concac = {"Last Resort", "Agility", "Water Body", "Heavenly Blood", "Heightened Senses", "Energy Core",
                "Primordial Reign"}

_print = function()
    
end
_print("LOGGING")
repeat
    wait()
until game:IsLoaded() and game.Players.LocalPlayer:FindFirstChild("DataLoaded")

local plr = game.Players.LocalPlayer

local l_Remotes_0 = game.ReplicatedStorage:WaitForChild("Remotes");
if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Main (minimal)") then
    repeat
        wait()
    until not game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Main (minimal)")
end
function scriptojoin()
    return
        'game:GetService("TeleportService"):TeleportToPlaceInstance(' .. game.PlaceId .. ',"' .. game.JobId .. '",' ..
            'game.Players.LocalPlayer)'
end

function getfm()
    if game:GetService("Lighting"):GetAttribute("MoonPhase") == 5 and
        (math.floor(game.Lighting.ClockTime) >= 12 or math.floor(game.Lighting.ClockTime) < 5) then
        return "Full Moon"
    elseif game:GetService("Lighting"):GetAttribute("MoonPhase") == 4 then
        return "Next Night"
    else
        return "Bad Moon"
    end
end

function getmirage()
    if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
        return true
    else
        return false
    end
end

function checkgatcan()
    local a = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(
        "CheckTempleDoor")
    if a then
        return "Pulled"
    else
        return "No"
    end
end

function data()
    return math.floor(game.Lighting.ClockTime) .. " | " .. game.Players.NumPlayers .. "/" .. game.Players.MaxPlayers ..
               getfm() .. getmirage() .. checkgatcan()
end

function isrealmoon()
    return (math.floor(game.Lighting.ClockTime) >= 12 or math.floor(game.Lighting.ClockTime) < 5)
end

function isnight()
    return (math.floor(game.Lighting.ClockTime) >= 18 or math.floor(game.Lighting.ClockTime) < 5)
end

function HavePrehistoricIsland()
    return workspace.Map:FindFirstChild("PrehistoricIsland")
end

function HaveRareBoss(name)
    for i, v in game:GetService("ReplicatedStorage"):GetChildren() do
        if string.find(v.Name, name) then
            return true
        end
    end
    for i, v in workspace.Enemies:GetChildren() do
        if string.find(v.Name, name) then
            return true
        end
    end
    for i, v in workspace._WorldOrigin.EnemySpawns:GetChildren() do
        if string.find(v.Name, name) then
            return true
        end
    end
end

local rareboss = {"rip_indra", "rip_indra True Form", "Dough King", "Darkbeard", "Cursed Captain", "Soul Reaper", "Cake Queen"}
local elite = {"Deandre", "Urban", "Diablo"}

local save = {}
local castleSent = false
local lastCastleNotification = 0

function anat(_type, extra)
    request({
        Url = 'https://discord.com/api/webhooks/1531328439053713439/bBCpVyEzwYYSyhkWYlfowpKeyj3VYFJjU8SsuMNsHAca_uXJojrNca0SzUvv_jNCZgyg', 
        Method = 'POST', 
        Headers = {["Content-Type"] = "application/json"}, 
        Body = game:GetService("HttpService"):JSONEncode({
            content = _type .. ' ' .. extra .. ' | ' .. game.JobId .. ' ' .. game.Players.LocalPlayer.Name
        })
    })
end

function havelegnpc()
    if not workspace.NPCs:FindFirstChild("Legendary Sword Dealer ") then
        if game:GetService("ReplicatedStorage").NPCs["Legendary Sword Dealer "].HumanoidRootPart.CFrame.Position.X ~= 0 then
            return true
        end
    else
        if (workspace.NPCs:FindFirstChild("Legendary Sword Dealer ").HumanoidRootPart.CFrame.X) ~= 0 then
            return true
        end
    end
end

function HaveCastle()
    local castlePos = Vector3.new(-5543.5327148438, 313.80062866211, -2964.2585449219)
    local enemies = workspace:FindFirstChild("Enemies")
    if not enemies then return false end
    
    local mobCount = 0
    for _, mob in pairs(enemies:GetChildren()) do
        if mob:IsA("Model") then
            local hrp = mob:FindFirstChild("HumanoidRootPart")
            if hrp and (hrp.Position - castlePos).Magnitude < 1800 then
                local hum = mob:FindFirstChild("Humanoid")
                if hum and hum.Health > 0 then
                    local pirateMobs = {"Galley Pirate", "Galley Captain", "Raider", "Mercenary", "Zombie", "Vampire",
                    "Snow Trooper", "Winter Warrior", "Lab Subordinate", "Horned Warrior", "Lava Pirate",
                    "Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer", "Arctic Warrior",
                    "Snow Lurker", "Sea Soldier", "Water Fighter"}
                    for _, pirateMob in pairs(pirateMobs) do
                        if string.find(mob.Name, pirateMob) then
                            mobCount = mobCount + 1
                            break
                        end
                    end
                end
            end
        end
    end
    -- Chỉ return true khi có ít nhất 1 mobs (đảm bảo Castle raid thực sự đang diễn ra)
    return mobCount >= 1
end

function HaveElite()
    
    for _, boss in pairs(bossCategories.Elite) do
        if workspace.Enemies:FindFirstChild(boss) then
            local elite = workspace.Enemies:FindFirstChild(boss)
            if elite:FindFirstChild("Humanoid") and elite.Humanoid.Health > 0 then
                return boss
            end
        end
    end
    return false
end




local v245 = nil
local v246 = nil
spawn(function()
    while wait() do
        local a, b = xpcall(function()
            while wait() do
                _print("HIT")
                v245, v246 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ColorsDealer", "1")
                if v245 and v245 ~= OldHaki then
                    OldHaki = v245
                    local payloadleghaki = {
                        ["JobId"] = tostring(game.JobId),
                        ["Players"] = game.Players.NumPlayers .. "/" .. game.Players.MaxPlayers,
                        ["ClockTime"] = math.floor(game.Lighting.ClockTime),
                        ["Haki"] = v245,
                        ["IsNight"] = isnight(),
                        ["Script To Join"] = scriptojoin(),
                        ["Type"] = "Legendary Haki"
                    }
                    _print("Send Haki Data")
                    anat("Haki", v245, game.JobId)
                    local DataCallBack = request({
                        Url = "https://api.mikudata.site/data-private",
                        Method = 'POST',
                        Headers = {
                            ["Content-Type"] = "application/json"
                        },
                        Body = game:GetService("HttpService"):JSONEncode(payloadleghaki)

                    })
                end
                _print(10)
                if game.PlaceId == 4442272183 then
                    if havelegnpc() then
                        local v242 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1");
                        if OldSword == v242 then return end 
                        _print("Send Sword Data", v242)
                        OldSword = v242
                        anat("Sword", v242, game.JobId)
                        local payloadleg = {
                            ["JobId"] = tostring(game.JobId),
                            ["Players"] = game.Players.NumPlayers .. "/" .. game.Players.MaxPlayers,
                            ["ClockTime"] = math.floor(game.Lighting.ClockTime),
                            ["Sword"] = v242,
                            ["IsNight"] = isnight(),
                            ["Script To Join"] = scriptojoin(),
                            ["Type"] = "Legendary Sword"
                        }
                        local DataCallBack = request({
                            Url = "https://api.mikudata.site/data-private",
                            Method = 'POST',
                            Headers = {
                                ["Content-Type"] = "application/json"
                            },
                            Body = game:GetService("HttpService"):JSONEncode(payloadleg)
                        })
                    end
                        end
    
                -- Rare Boss Detection
                for i, v in pairs(rareboss) do
                    if HaveRareBoss(v) and not table.find(save, v) then
                        table.insert(save, v)
                        _print("SENT RARE BOSS", v)
                        anat("Rare Boss", v, game.JobId)
                        local payloadRare = {
                            ["JobId"] = tostring(game.JobId),
                            ["Players"] = game.Players.NumPlayers .. "/" .. game.Players.MaxPlayers,
                            ["ClockTime"] = math.floor(game.Lighting.ClockTime),
                            ["Rare Boss"] = v,
                            ["IsNight"] = isnight(),
                            ["Script To Join"] = scriptojoin(),
                            ["Type"] = "Rare Boss"
                        }
                        local DataCallBack = request({
                            Url = "https://api.mikudata.site/data-private",
                            Method = 'POST',
                            Headers = {
                                ["Content-Type"] = "application/json"
                            },
                            Body = game:GetService("HttpService"):JSONEncode(payloadRare)
                        })
                    elseif not HaveRareBoss(v) and table.find(save, v) then
                        -- Remove boss from save array when it's no longer present
                        for j = #save, 1, -1 do
                            if save[j] == v then
                                table.remove(save, j)
                                break
                            end
                        end
                    end
                end
    
                _print(20)
                if HavePrehistoricIsland() and not toibingu then
                    toibingu = 1
                    _print("SENT PREHISTORIC ISLAND")
                    anat("Prehistoric", "Island", game.JobId)
                    local payloadPrehistocricIsland = {
                        ["JobId"] = tostring(game.JobId),
                        ["Players"] = game.Players.NumPlayers .. "/" .. game.Players.MaxPlayers,
                        ["ClockTime"] = math.floor(game.Lighting.ClockTime),
                        ["Prehistoric Island"] = HavePrehistoricIsland(),
                        ["IsNight"] = isnight(),
                        ["Script To Join"] = scriptojoin(),
                        ["Type"] = "Prehistoric Island"
                    }
                    local DataCallBack = request({
                        Url = "https://api.mikudata.site/data-private",
                        Method = 'POST',
                        Headers = {
                            ["Content-Type"] = "application/json"
                        },
                        Body = game:GetService("HttpService"):JSONEncode(payloadPrehistocricIsland)
                    })
                end
                _print(3)
                if getmirage() and not miragesent then
                    _print("SEND MIRAGE")
                    miragesent = true
                    anat("Mirage", "Island", game.JobId)
                    local payloadmirage = {
                        ["JobId"] = tostring(game.JobId),
                        ["Players"] = game.Players.NumPlayers .. "/" .. game.Players.MaxPlayers,
                        ["ClockTime"] = math.floor(game.Lighting.ClockTime),
                        ["Mirage"] = getmirage(),
                        ["IsNight"] = isnight(),
                        ["Script To Join"] = scriptojoin(),
                        ["Type"] = "Mirage"
                    }
                    local DataCallBack = request({
                        Url = "https://api.mikudata.site/data-private",
                        Method = 'POST',
                        Headers = {
                            ["Content-Type"] = "application/json"
                        },
                        Body = game:GetService("HttpService"):JSONEncode(payloadmirage)
                    })
                end
                _print(40)
                if isrealmoon() and getfm() == "Full Moon" then
                    if os.time() - ( LAstSend or 0 ) < 1200 then continue end
                    anat("Full", "Moon", game.JobId)
                    local payloadmoon = {
                        ["JobId"] = tostring(game.JobId),
                        ["Players"] = game.Players.NumPlayers .. "/" .. game.Players.MaxPlayers,
                        ["ClockTime"] = math.floor(game.Lighting.ClockTime),
                        ["MoonPhase"] = getfm(),
                        ["IsNight"] = isnight(),
                        ["Script To Join"] = scriptojoin(),
                        ["Type"] = "Moon"
                    }
                    _print("SENT FULL MOON")
                    LAstSend = os.time()
                    local DataCallBack = request({
                        Url = "https://api.mikudata.site/data-private",
                        Method = 'POST',
                        Headers = {
                            ["Content-Type"] = "application/json"
                        },
                        Body = game:GetService("HttpService"):JSONEncode(payloadmoon)
                    })
                end
    
    
                if HaveCastle() and not castleSent and (os.time() - lastCastleNotification) > 300 then
                    castleSent = true
                    lastCastleNotification = os.time()
                    _print("SENT CASTLE")
                    anat("Castle", "Raid", game.JobId)
                    local payloadCastle = {
                        ["JobId"] = tostring(game.JobId),
                        ["Players"] = game.Players.NumPlayers .. "/" .. game.Players.MaxPlayers,
                        ["ClockTime"] = math.floor(game.Lighting.ClockTime),
                        ["Castle"] = "Pirate Raid Active",
                        ["IsNight"] = isnight(),
                        ["Script To Join"] = scriptojoin(),
                        ["Type"] = "Castle"
                    }
                    local DataCallBack = request({
                        Url = "https://api.mikudata.site/data-private",
                        Method = 'POST',
                        Headers = {
                            ["Content-Type"] = "application/json"
                        },
                        Body = game:GetService("HttpService"):JSONEncode(payloadCastle)
                    })
                end
                
                if not HaveCastle() and castleSent then
                    castleSent = false
                end
    
    
                for i, v in pairs(elite) do
                    if HaveRareBoss(v) and not table.find(save, v) then
                        table.insert(save, v)
                        _print("SENT ELITE", v)
                        anat("Elite", v, game.JobId)
                        local payloadElite = {
                            ["JobId"] = tostring(game.JobId),
                            ["Players"] = game.Players.NumPlayers .. "/" .. game.Players.MaxPlayers,
                            ["ClockTime"] = math.floor(game.Lighting.ClockTime),
                            ["Elite"] = v,
                            ["IsNight"] = isnight(),
                            ["Script To Join"] = scriptojoin(),
                            ["Type"] = "Elite"
                        }
                        local DataCallBack = request({
                            Url = "https://api.mikudata.site/data-private",
                            Method = 'POST',
                            Headers = {
                                ["Content-Type"] = "application/json"
                            },
                            Body = game:GetService("HttpService"):JSONEncode(payloadElite)
                        })
                    elseif not HaveRareBoss(v) and table.find(save, v) then
                        -- Remove boss from save array when it's no longer present
                        for j = #save, 1, -1 do
                            if save[j] == v then
                                table.remove(save, j)
                                break
                            end
                        end
                    end
                end
                
                _print("PASS")
            end
        end, debug.traceback)

        if not a then 
            _print("FAIL", a, b) 
            anat("Finder Crashed\n", b or 'unexcepted error') 
        end 
    end
end)