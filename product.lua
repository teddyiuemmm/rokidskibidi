-- ts file was generated at discord.gg/25ms

local _MarketplaceService = game:GetService('MarketplaceService')
local _LocalPlayer = game:GetService('Players').LocalPlayer
local u3 = loadstring(game:HttpGet('https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua'))()
local v4 = loadstring(game:HttpGet('https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua'))()
local v5 = loadstring(game:HttpGet('https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua'))()
local v6 = u3
local v7 = u3.CreateWindow(v6, {
    Title = 'gyat skibidi sigma',
    SubTitle = 'Jet On Top !',
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = 'Dark',
    MinimizeKey = Enum.KeyCode.LeftControl,
})
local u8 = {
    Main = v7:AddTab({
        Title = 'Main',
        Icon = 'shopping-cart',
    }),
    Settings = v7:AddTab({
        Title = 'Settings',
        Icon = 'settings',
    }),
}
local _Options = u3.Options
local u10 = {}
local u11 = false
local u12 = 0.01
local u13 = {}

local function u20(p14)
    pcall(function()
        _MarketplaceService:SignalPromptProductPurchaseFinished(_LocalPlayer.UserId, p14, true)

        local v15, v16, v17 = ipairs({
            'PurchaseProduct',
            'BuyItem',
            'AttemptPurchase',
        })

        while true do
            local v18

            v17, v18 = v15(v16, v17)

            if v17 == nil then
                break
            end

            local v19 = game:GetService('ReplicatedStorage'):FindFirstChild(v18)

            if v19 then
                if v19:IsA('RemoteEvent') then
                    v19:FireServer(p14)
                elseif v19:IsA('RemoteFunction') then
                    v19:InvokeServer(p14)
                end
            end
        end
    end)
end
local function u29()
    local v21 = {}
    local v22, v23 = pcall(function()
        return _MarketplaceService:GetDeveloperProductsAsync()
    end)

    if v22 and v23 then
        while true do
            local v24 = v23:GetCurrentPage()
            local v25, v26, v27 = ipairs(v24)

            while true do
                local v28

                v27, v28 = v25(v26, v27)

                if v27 == nil then
                    break
                end

                table.insert(v21, {
                    id = v28.ProductId,
                    name = v28.Name,
                    price = v28.PriceInRobux,
                })
            end

            if v23.IsFinished or not v23:AdvanceToNextPage() then
            end
        end
    else
        return (#v21 <= 0 or not v21) and {
            {
                id = 0,
                name = 'No products found',
                price = 0,
            },
        } or v21
    end
end
local function u34()
    local v30, v31, v32 = ipairs(u10)

    while true do
        local v33

        v32, v33 = v30(v31, v32)

        if v32 == nil then
            break
        end
        if v33.id ~= 0 then
            task.spawn(u20, v33.id)
        end
    end
end
local function u39()
    local v35, v36, v37 = ipairs(u13)

    while true do
        local v38

        v37, v38 = v35(v36, v37)

        if v37 == nil then
            break
        end

        v38:Destroy()
    end

    table.clear(u13)
end
local function u45()
    task.spawn(function()
        u39()

        u10 = u29()

        local v40, v41, v42 = ipairs(u10)

        while true do
            local u43

            v42, u43 = v40(v41, v42)

            if v42 == nil then
                break
            end

            local v44 = u8.Main:AddButton({
                Title = u43.name .. ' (' .. u43.price .. ' R$)',
                Description = 'Buy this item.',
                Callback = function()
                    u20(u43.id)
                end,
            })

            table.insert(u13, v44)
        end
    end)
end
local function v48()
    u8.Settings:AddSlider('PurchaseDelay', {
        Title = 'Purchase Delay',
        Description = 'Delay between purchases (seconds).',
        Min = 0.01,
        Max = 1,
        Default = 0.05,
        Rounding = 2,
        Callback = function(p46)
            u12 = p46
        end,
    })
    u8.Settings:AddToggle('NoDelay', {
        Title = 'Experimental: No Purchase Delay',
        Default = false,
        Callback = function(p47)
            if p47 then
                u12 = 0
            else
                u12 = _Options.PurchaseDelay.Value
            end
        end,
    })
end

(function()
    u8.Main:AddToggle('AutoBuyAll', {
        Title = 'Auto Buy All Products',
        Default = false,
        Callback = function(p49)
            u11 = p49

            task.spawn(function()
                while u11 do
                    u34()
                    task.wait(u12)
                end
            end)
        end,
    })
    u8.Main:AddButton({
        Title = 'Buy All Now',
        Description = 'Instantly purchase all products once.',
        Callback = function()
            u34()
        end,
    })
    u8.Main:AddButton({
        Title = 'Refresh Products',
        Description = 'Reload the list of products.',
        Callback = function()
            u45()
            u3:Notify({
                Title = 'Products Refreshed',
                Content = 'Product list updated successfully.',
                Duration = 4,
            })
        end,
    })
    u45()
end)()
v48()
v4:SetLibrary(u3)
v5:SetLibrary(u3)
v4:IgnoreThemeSettings()
v4:SetIgnoreIndexes({})
v5:SetFolder('cc ba may')
v4:SetFolder('cc ba may/con cac')
v5:BuildInterfaceSection(u8.Settings)
v7:SelectTab(1)

local v50 = u3

u3.Notify(v50, {
    Title = 'cai lon me m !',
    Content = 'con cac!',
    Duration = 8,
})
v4:LoadAutoloadConfig()
