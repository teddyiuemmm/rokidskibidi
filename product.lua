local _MarketplaceService = game:GetService('MarketplaceService')
local _LocalPlayer = game:GetService('Players').LocalPlayer

-- Load Fluent UI
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua'))()
local InterfaceManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua'))()

local Window = Fluent:CreateWindow({
    Title = 'Developer Product Buyer',
    SubTitle = 'by MoiNotVideo',
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 520),
    Acrylic = true,
    Theme = 'Dark',
    MinimizeKey = Enum.KeyCode.LeftControl,
})

local Tabs = {
    Main = Window:AddTab({ Title = 'Main', Icon = 'shopping-cart' }),
    Settings = Window:AddTab({ Title = 'Settings', Icon = 'settings' }),
}

local Options = Fluent.Options
local ProductList = {}
local AutoBuyEnabled = false
local PurchaseDelay = 0.05
local SelectedProductId = nil
local ActionMode = "Exec"
local UIButtons = {}

-- HÀM COPY FULL PATH (Không dùng local)
local function GetCopyScript(productId)
    return "game:GetService('MarketplaceService'):SignalPromptProductPurchaseFinished(game:GetService('Players').LocalPlayer.UserId, " .. tostring(productId) .. ", true)"
end

-- Execute purchase logic
local function ExecutePurchase(productId)
    if not productId or productId == 0 then return end
    pcall(function()
        _MarketplaceService:SignalPromptProductPurchaseFinished(_LocalPlayer.UserId, productId, true)
    end)
    -- Thử trigger các Remote phổ biến trong game Tycoon/Simulator
    local remotes = {'PurchaseProduct', 'BuyItem', 'AttemptPurchase', 'BuyDeveloperProduct'}
    for _, name in ipairs(remotes) do
        local remote = game:GetService('ReplicatedStorage'):FindFirstChild(name, true)
        if remote then
            if remote:IsA('RemoteEvent') then
                remote:FireServer(productId)
            elseif remote:IsA('RemoteFunction') then
                pcall(function() remote:InvokeServer(productId) end)
            end
        end
    end
end

-- Quét danh sách sản phẩm
local function FetchProducts()
    local products = {}
    local success, pages = pcall(function() return _MarketplaceService:GetDeveloperProductsAsync() end)
    if success and pages then
        while true do
            for _, item in ipairs(pages:GetCurrentPage()) do
                table.insert(products, {id = item.ProductId, name = item.Name, price = item.PriceInRobux})
            end
            if pages.IsFinished then break end
            pcall(function() pages:AdvanceToNextPage() end)
        end
    end
    return #products > 0 and products or {{id = 0, name = "No Products Found", price = 0}}
end

local function RefreshUI()
    for _, btn in ipairs(UIButtons) do btn:Destroy() end
    table.clear(UIButtons)
    ProductList = FetchProducts()
    
    if Options.ProductSelect then
        local dropdownValues = {}
        for _, p in ipairs(ProductList) do
            if p.id ~= 0 then table.insert(dropdownValues, p.name .. " (" .. p.price .. " R$)") end
        end
        Options.ProductSelect:SetValues(dropdownValues)
    end

    for _, product in ipairs(ProductList) do
        if product.id ~= 0 then
            local btn = Tabs.Main:AddButton({
                Title = product.name .. " (" .. product.price .. " R$)",
                Description = "ID: " .. product.id,
                Callback = function() 
                    if ActionMode == "Exec" then
                        ExecutePurchase(product.id)
                    else
                        setclipboard(GetCopyScript(product.id))
                        Fluent:Notify({Title = "Copied Full Path", Content = "Script copied to clipboard!", Duration = 3})
                    end
                end
            })
            table.insert(UIButtons, btn)
        end
    end
end

-- UI Setup
Tabs.Main:AddDropdown("ActionMode", {
    Title = "Action Mode",
    Values = {"Exec", "Copy Script"},
    Default = "Exec",
    Callback = function(v) ActionMode = v end
})

Tabs.Main:AddDropdown('ProductSelect', {
    Title = 'Select Product',
    Values = {},
    Callback = function(value)
        for _, p in ipairs(ProductList) do
            if p.name .. " (" .. p.price .. " R$)" == value then
                SelectedProductId = p.id
                break
            end
        end
    end
})

Tabs.Main:AddButton({
    Title = 'Action Selected',
    Callback = function()
        if not SelectedProductId then return end
        if ActionMode == "Exec" then
            ExecutePurchase(SelectedProductId)
        else
            setclipboard(GetCopyScript(SelectedProductId))
            Fluent:Notify({Title = "Copied", Content = "Full Path copied!", Duration = 3})
        end
    end
})

Tabs.Main:AddToggle('AutoBuyAll', {
    Title = 'Auto Buy All Loop',
    Default = false,
    Callback = function(state)
        AutoBuyEnabled = state
        task.spawn(function()
            while AutoBuyEnabled do
                for _, p in ipairs(ProductList) do
                    if not AutoBuyEnabled then break end
                    if p.id ~= 0 then ExecutePurchase(p.id) task.wait(PurchaseDelay) end
                end
                task.wait(1)
            end
        end)
    end,
})

Tabs.Main:AddButton({ Title = 'Refresh Products', Callback = RefreshUI })

Tabs.Settings:AddSlider('PurchaseDelay', {
    Title = 'Purchase Delay',
    Min = 0, Max = 2, Default = 0.05, Rounding = 2,
    Callback = function(val) PurchaseDelay = val end,
})

RefreshUI()
Window:SelectTab(1)
