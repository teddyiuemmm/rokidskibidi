local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/teddyiuemmm/secretii/refs/heads/main/orionlibbypnka.lua"))()
local win = lib:MakeWindow({
    Name = "trash hub",
    Subtitle = "v1.0 by pnka",
    SaveConfig = true,
    ConfigFolder = "trash",
    Size = UDim2.fromOffset(595, 305),
})

local main    = win:MakeTab({ Name = "Main" })
local shop    = win:MakeTab({ Name = "Shop" })
local setting = win:MakeTab({ Name = "Settings" })

-- Services
local Players           = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService      = game:GetService("TweenService")
local UserInputService  = game:GetService("UserInputService")
local TeleportService   = game:GetService("TeleportService")
local VirtualUser = game:GetService("VirtualUser")

local plr       = Players.LocalPlayer
local data      = plr:WaitForChild("TycoonData")
local nextRef   = data:WaitForChild("NextAffordableButton")
local tycoonRef = data:WaitForChild("Tycoon")

local speaker = plr
if getconnections then
    for _, connection in pairs(getconnections(speaker.Idled)) do
        if connection.Disable then
            connection:Disable()
        elseif connection.Disconnect then
            connection:Disconnect()
        end
    end
else
    speaker.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end

-- RemoteEvents
local remoteEvents   = ReplicatedStorage:WaitForChild("RemoteEvents")
local buySeedRemote  = remoteEvents:WaitForChild("BuySeedEvent")
local cropConfig     = require(ReplicatedStorage:WaitForChild("Configs"):WaitForChild("CropConfig"))

-- Global state
local delayTime = 0.1

local state = {
    farmTween    = false,
    farmInstant  = false,
    plant        = false,
    equipPet     = false,
    rebirth      = false,
    buySeeds     = false,
    buySelected  = false,
    buySpin      = false,
    autoSpin     = false,
    restock      = false,
    gem          = false,
    funpass      = false,
    rejoin       = false,
    destroyUI    = false,
}
local farmTweenToggle
local farmInstantToggle

local selectedSeed
local farmThread
local destroyConn

-- Seed list for dropdown
local seedList = {}
for _, v in ipairs(cropConfig.Crops) do
    if v.InShop then table.insert(seedList, v.Name) end
end

-- Helpers
local function getHRP()
    local char = plr.Character
    return char and char:FindFirstChild("HumanoidRootPart")
end

local function getOwnedTycoon()
    local val = tycoonRef.Value
    return (typeof(val) == "Instance") and val or workspace:FindFirstChild(tostring(val))
end

local function tweenTo(cf)
    local hrp = getHRP()
    if not hrp then return end
    hrp.Velocity = Vector3.zero
    TweenService:Create(hrp, TweenInfo.new(0.25, Enum.EasingStyle.Linear), {CFrame = cf}):Play()
end

local function teleportShop(path)
    pcall(function()
        local hrp = getHRP()
        local part = workspace["Exterior Terrain"]["Sakura Plaza"][path].Aura.Collider
        if part and hrp then
            part.CFrame = hrp.CFrame * CFrame.new(0, 0, -2)
        end
    end)
end

local function resetShops()
    pcall(function()
        local pos = CFrame.new(166, 4, -469)
        for _, name in ipairs({"Pets Shop", "Seeds Shop"}) do
            local s = workspace["Exterior Terrain"]["Sakura Plaza"][name].Aura.Collider
            if s then s.CFrame = pos end
        end
    end)
end

-- ===================== SHOP TAB =====================

shop:AddButton({
    Name = "Open Pet Shop",
    Subtitle = "after use this, click 'Reset Shops' in Settings",
    Callback = function() teleportShop("Pets Shop") end
})

shop:AddButton({
    Name = "Open Seed Shop",
    Subtitle = "after use this, click 'Reset Shops' in Settings",
    Callback = function() teleportShop("Seeds Shop") end
})

shop:AddButton({
    Name = "Claim Offline Rewards",
    Callback = function()
        pcall(function()
            local tycoon = tycoonRef.Value
            local handle = tycoon:WaitForChild("P_Silo"):WaitForChild("Handle")
            local prompt = handle:WaitForChild("ProximityPrompt")
            local hrp = getHRP()
            if hrp then hrp.CFrame = handle.CFrame end
            task.wait(delayTime)
            fireproximityprompt(prompt)
        end)
    end
})

shop:AddButton({
    Name = "Claim Daily Rewards",
    Callback = function()
        for i = 1, 7 do
            remoteEvents.AttemptToClaimDailyReward:FireServer(i)
        end
    end
})

shop:AddToggle({
    Name = "Auto Restock Seed Shop",
    Default = false,
    Callback = function(v)
        state.restock = v
        if not v then return end
        task.spawn(function()
            local remote = remoteEvents:WaitForChild("ManualRestockEvent")
            while state.restock do
                pcall(function() remote:FireServer() end)
                task.wait(delayTime)
            end
        end)
    end
})

shop:AddDropdown({
    Name = "Select Seed",
    Default = seedList[1],
    Options = seedList,
    Callback = function(v) selectedSeed = v end
})

shop:AddToggle({
    Name = "Auto Buy Selected Seed",
    Default = false,
    Callback = function(v)
        state.buySelected = v
        if not v then return end
        task.spawn(function()
            while state.buySelected do
                if selectedSeed then
                    pcall(function() buySeedRemote:FireServer(selectedSeed) end)
                end
                task.wait(delayTime)
            end
        end)
    end
})

shop:AddToggle({
    Name = "Auto Buy All Seeds",
    Default = false,
    Callback = function(v)
        state.buySeeds = v
        if not v then return end
        task.spawn(function()
            while state.buySeeds do
                for _, cropData in ipairs(cropConfig.Crops) do
                    if not state.buySeeds then return end
                    if cropData.InShop then
                        pcall(function() buySeedRemote:FireServer(cropData.Name) end)
                        task.wait(delayTime)
                    end
                end
                task.wait(delayTime)
            end
        end)
    end
})

shop:AddToggle({
    Name = "Buy Spin",
    Default = false,
    Callback = function(v)
        state.buySpin = v
        if not v then return end
        task.spawn(function()
            local remote = ReplicatedStorage:WaitForChild("RemoteFunctions"):WaitForChild("IncrementSpinAvailable")
            while state.buySpin do
                pcall(function() remote:InvokeServer(10) end)
                task.wait(delayTime)
            end
        end)
    end
})

shop:AddToggle({
    Name = "Auto Spin",
    Default = false,
    Callback = function(v)
        state.autoSpin = v
        if not v then return end
        task.spawn(function()
            local remote = ReplicatedStorage:WaitForChild("RemoteFunctions"):WaitForChild("PerformSpin")
            while state.autoSpin do
                pcall(function() remote:InvokeServer(2) end)
                task.wait(delayTime)
            end
        end)
    end
})

-- ===================== MAIN TAB =====================

-- Noclip loop (shared)
task.spawn(function()
    while true do
        task.wait(delayTime)
        if not (state.farmTween or state.farmInstant) then continue end
        local char = plr.Character
        if char then
            for _, v in pairs(char:GetDescendants()) do
                if v:IsA("BasePart") then v.CanCollide = false end
            end
        end
    end
end)

-- Touch loop (shared)
task.spawn(function()
    while true do
        task.wait(delayTime)
        if not (state.farmTween or state.farmInstant) then continue end
        local button = nextRef.Value
        local tycoon = tycoonRef.Value
        local hrp = getHRP()
        if button and tycoon and hrp and button:IsDescendantOf(tycoon) and button.Name:match("^P_Coindropper") then
            local collider = button:FindFirstChild("HouseCoinDropper") and button.HouseCoinDropper:FindFirstChild("Collider")
            if collider then
                firetouchinterest(hrp, collider, 0)
                firetouchinterest(hrp, collider, 1)
            end
        end
    end
end)

farmTweenToggle = main:AddToggle({
    Name = "Auto Farm (Tween)",
    Subtitle = "smooth tween movement",
    Default = false,
    Callback = function(v)
        state.farmTween = v
        if v and farmInstantToggle then
            farmInstantToggle:Set(false) -- tắt instant khi bật tween
        end
        if not v then return end
        task.spawn(function()
            while state.farmTween do
                task.wait(delayTime)
                local target = workspace.Camera.NextButton.Target
                if target then tweenTo(target.CFrame) end
            end
        end)
    end
})

farmInstantToggle = main:AddToggle({
    Name = "Auto Farm (Instant)",
    Subtitle = "instant teleport",
    Default = false,
    Callback = function(v)
        state.farmInstant = v
        if v and farmTweenToggle then
            farmTweenToggle:Set(false) -- tắt tween khi bật instant
        end
        if not v then return end
        task.spawn(function()
            while state.farmInstant do
                task.wait(delayTime)
                local hrp = getHRP()
                local target = workspace.Camera.NextButton.Target
                if hrp and target then hrp:PivotTo(target.CFrame) end
            end
        end)
    end
})

main:AddToggle({
    Name = "Auto Plant",
    Default = false,
    Callback = function(v)
        state.plant = v
        if not v then return end
        task.spawn(function()
            local backpack    = plr:WaitForChild("Backpack")
            local remoteEquip = remoteEvents:WaitForChild("EquipSeedEvent")
            local remoteToggle = remoteEvents:WaitForChild("ToggleHarvestEvent")
            local harvestLabel = plr.PlayerGui:WaitForChild("PetGui").PetsIndexFrame.Container.MainFrame.SideButtons.ToggleHarvestButton.PetName
            local seeds = {"Carrot","Wheat","Cabbage","Corn","Tomato","Sugar Cane","Eggplant","Pumpkin","What the crop?!"}

            while state.plant do
                if string.find(harvestLabel.Text, "OFF") then
                    remoteToggle:FireServer()
                    task.wait(delayTime)
                end

                local tycoon = getOwnedTycoon()
                if tycoon then
                    for _, plot in ipairs(tycoon:GetChildren()) do
                        if plot.Name:match("^P_Plot_") then
                            local conveyField = plot:FindFirstChild("ConveyField")
                            local gridOverlay = conveyField and conveyField:FindFirstChild("GridOverlay")
                            if gridOverlay then
                                local planted = 0
                                for _, item in ipairs(conveyField:GetChildren()) do
                                    if table.find(seeds, item.Name) then planted += 1 end
                                end
                                if planted < #gridOverlay:GetChildren() then
                                    local seed
                                    for _, name in ipairs(seeds) do
                                        seed = backpack:FindFirstChild(name)
                                        if seed then break end
                                    end
                                    if seed then
                                        remoteEquip:FireServer(seed)
                                        task.wait(delayTime)
                                        for _, cell in ipairs(gridOverlay:GetChildren()) do
                                            local prompt = cell:FindFirstChildOfClass("ProximityPrompt")
                                            if prompt then fireproximityprompt(prompt) end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                task.wait(5)
            end
        end)
    end
})

main:AddToggle({
    Name = "Auto Equip Pet",
    Default = false,
    Callback = function(v)
        state.equipPet = v
        if farmThread then task.cancel(farmThread) farmThread = nil end
        if not v then return end

        farmThread = task.spawn(function()
            local hs        = game:GetService("HttpService")
            local petConfig = require(ReplicatedStorage:WaitForChild("Configs"):WaitForChild("PetConfig"))
            local equipRem  = remoteEvents:WaitForChild("EquipPetEvent")
            local unequipRem = remoteEvents:WaitForChild("UnequipPetEvent")

            local function decode(attr)
                local raw = plr:GetAttribute(attr)
                if not raw then return {} end
                local ok, res = pcall(hs.JSONDecode, hs, raw)
                return ok and res or {}
            end

            local function buildTop(inv)
                local list = {}
                for _, id in ipairs(inv) do
                    local d = petConfig.Pets[id]
                    if d then list[#list+1] = {Id=id, Power=(d.HarvestSpeed or 10)+(d.FollowSpeed or 0)} end
                end
                table.sort(list, function(a,b) return a.Power > b.Power end)
                local top = {}
                for i = 1, math.min(3, #list) do top[#top+1] = list[i].Id end
                return top
            end

            local function sameSet(a, b)
                if #a ~= #b then return false end
                local map = {}
                for _, v in ipairs(a) do map[v] = true end
                for _, v in ipairs(b) do if not map[v] then return false end end
                return true
            end

            while state.equipPet do
                local inv     = decode("PetInventory")
                local equipped = decode("EquippedPets")
                if #inv > 0 then
                    local target = buildTop(inv)
                    if not sameSet(target, equipped) then
                        for _, id in ipairs(equipped) do
                            if not state.equipPet then return end
                            unequipRem:FireServer(id)
                        end
                        task.wait(delayTime)
                        for _, id in ipairs(target) do
                            if not state.equipPet then return end
                            equipRem:FireServer(id)
                            task.wait(delayTime)
                        end
                    end
                end
                task.wait(delayTime)
            end
        end)
    end
})

main:AddToggle({
    Name = "Auto Rebirth",
    Default = false,
    Callback = function(v)
        state.rebirth = v
        if not v then return end
        task.spawn(function()
            local remote = remoteEvents:WaitForChild("Rebirth")
            while state.rebirth do
                local ok, text = pcall(function()
                    return plr.PlayerGui.Windows.Rebirth.Container.MainFrame.ProgressBG.ProgressLabel.Text
                end)
                if ok and text == "100%" then
                    pcall(function() remote:FireServer() end)
                    task.wait(delayTime)
                end
                task.wait(delayTime)
            end
        end)
    end
})

main:AddToggle({
    Name = "Auto Gem",
    Default = false,
    Callback = function(v)
        state.gem = v
        if not v then return end
        task.spawn(function()
            local remote = remoteEvents:WaitForChild("RemoteCollectGem")
            while state.gem do
                remote:FireServer()
                task.wait(delayTime)
            end
        end)
    end
})

main:AddToggle({
    Name = "Auto Claim FunPass",
    Default = false,
    Callback = function(v)
        state.funpass = v
        if not v then return end

        local remote       = remoteEvents:WaitForChild("AttemptToClaimFunPassReward")
        local funPassConfig = require(ReplicatedStorage.Configs.FunPass)
        local rewardType   = require(ReplicatedStorage.Configs.FunPassReward)

        local playerDataModule
        for _, x in pairs(getgc(true)) do
            if typeof(x) == "table" and rawget(x, "GetLocalPlayerData") then
                playerDataModule = x break
            end
        end
        if not playerDataModule then warn("no PlayerData") return end

        local function claim()
            local d = playerDataModule:GetLocalPlayerData()
            if not d or not d.FunPass then return end
            local exp = plr:GetAttribute("EXP") or 0
            local level = math.floor(exp / (funPassConfig.TotalEXPRequired / #funPassConfig.Rewards))
            for i, status in ipairs(d.FunPass) do
                if not state.funpass then break end
                if level >= i then
                    if bit32.band(bit32.rshift(status,1),1) ~= 1 then
                        pcall(function() remote:FireServer(i, rewardType.FREE) end)
                        task.wait(delayTime)
                    end
                    if bit32.band(status,1) ~= 1 then
                        pcall(function() remote:FireServer(i, rewardType.PREMIUM) end)
                        task.wait(delayTime)
                    end
                end
            end
        end

        while state.funpass do
            pcall(claim)
            task.wait(delayTime)
        end
    end
})

-- ===================== SETTINGS TAB =====================

setting:AddButton({
    Name = "Reset Shops",
    Subtitle = "reset pet/seed shop collider về vị trí gốc",
    Callback = resetShops
})

setting:AddToggle({
    Name = "Destroy UI Gem/Coin",
    Default = false,
    Callback = function(v)
        state.destroyUI = v
        local gui = plr:WaitForChild("PlayerGui")

        local function isTarget(obj)
            if obj.Name ~= "ItemIcon" then return false end
            local p = obj.Parent
            local gp = p and p.Parent
            return p and (p.Name == "Gems" or p.Name == "Coins" or (gp and gp.Name == "FunPass"))
        end

        if destroyConn then destroyConn:Disconnect() destroyConn = nil end
        if v then
            destroyConn = gui.DescendantAdded:Connect(function(obj)
                if state.destroyUI and isTarget(obj) then obj:Destroy() end
            end)
        end
    end
})

setting:AddTextbox({
    Name = "Delay (seconds)",
    Subtitle = "default: 0.1",
    Default = "0.1",
    TextDisappear = false,
    Callback = function(v)
        delayTime = tonumber(v) or delayTime
    end
})

local rejoinMinutes = 1
setting:AddTextbox({
    Name = "Rejoin Time (minutes)",
    Default = "1",
    TextDisappear = false,
    Callback = function(v)
        rejoinMinutes = tonumber(v) or 1
    end
})

setting:AddToggle({
    Name = "Auto Rejoin",
    Subtitle = "set time above before enabling",
    Default = false,
    Callback = function(v)
        state.rejoin = v
        if not v then return end
        task.spawn(function()
            while state.rejoin do
                task.wait(rejoinMinutes * 60)
                if not state.rejoin then break end
                pcall(function() plr:Kick("pnka love u...") end)
                task.wait(1)
                TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, plr)
            end
        end)
    end
})

lib:Init()
