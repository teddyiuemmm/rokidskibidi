local MarketplaceService = game:GetService('MarketplaceService')
local Players = game:GetService('Players')
local LocalPlayer = Players.LocalPlayer

-- Load Fluent UI
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = 'Dev Products Purchase Ultra',
    SubTitle = 'by MoiNotVideo',
    TabWidth = 150,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = 'Dark',
    MinimizeKey = Enum.KeyCode.LeftControl,
})

local Tabs = {
    Buyer = Window:AddTab({ Title = 'Buyer', Icon = 'shopping-cart' }),
    Logger = Window:AddTab({ Title = 'Logger', Icon = 'list' }),
    Settings = Window:AddTab({ Title = 'Settings', Icon = 'settings' }),
}

local Options = Fluent.Options
local suppressCounter = 0
local activeLoops = {} -- Cho Logger
local logEntries = {}  -- Cho Logger UI

-- Variables cho Buyer
local ProductList = {}
local AutoBuyEnabled = false
local PurchaseDelay = 0.05
local SelectedProductId = nil
local ActionMode = "Exec"
local UIButtons = {}
local autoSpeed = 100 -- Cho Logger Auto

-- ==========================================
-- LOGIC HÀM DÙNG CHUNG
-- ==========================================

local function GetFullScript(signalType, id)
    local suffix = (signalType == "Gamepass" and "" or ".UserId")
    return string.format("game:GetService('MarketplaceService'):SignalPrompt%sPurchaseFinished(game:GetService('Players').LocalPlayer%s, %s, true)", signalType, suffix, tostring(id))
end

local function fireSignal(signalType, id)
    suppressCounter = suppressCounter + 1
    pcall(function()
        if signalType == "Product" then
            MarketplaceService:SignalPromptProductPurchaseFinished(LocalPlayer.UserId, id, true)
        elseif signalType == "Gamepass" then
            MarketplaceService:SignalPromptGamePassPurchaseFinished(LocalPlayer, id, true)
        elseif signalType == "Purchase" or signalType == "Standard" then
            MarketplaceService:SignalPromptPurchaseFinished(LocalPlayer.UserId, id, true)
        end
    end)
    suppressCounter = suppressCounter - 1
end

-- ==========================================
-- PHẦN 1: TAB BUYER
-- ==========================================

local function FetchProducts()
    local products = {}
    local success, pages = pcall(function() return MarketplaceService:GetDeveloperProductsAsync() end)
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

local function RefreshBuyerUI()
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
            local btn = Tabs.Buyer:AddButton({
                Title = product.name .. " (" .. product.price .. " R$)",
                Description = "ID: " .. product.id,
                Callback = function() 
                    if ActionMode == "Exec" then
                        fireSignal("Product", product.id)
                    else
                        setclipboard(GetFullScript("Product", product.id))
                        Fluent:Notify({Title = "Copied", Content = "Script copied!", Duration = 2})
                    end
                end
            })
            table.insert(UIButtons, btn)
        end
    end
end

Tabs.Buyer:AddDropdown("ActionMode", {
    Title = "Action Mode",
    Values = {"Exec", "Copy Script"},
    Default = "Exec",
    Callback = function(v) ActionMode = v end
})

Tabs.Buyer:AddDropdown('ProductSelect', {
    Title = 'Select Product (Dropdown)',
    Values = {},
    Callback = function(value)
        for _, p in ipairs(ProductList) do
            if p.name .. " (" .. p.price .. " R$)" == value then SelectedProductId = p.id break end
        end
    end
})

Tabs.Buyer:AddButton({
    Title = 'Action Selected',
    Callback = function()
        if not SelectedProductId then return end
        if ActionMode == "Exec" then fireSignal("Product", SelectedProductId)
        else setclipboard(GetFullScript("Product", SelectedProductId)) end
    end
})

Tabs.Buyer:AddToggle('AutoBuyAll', {
    Title = 'Auto Buy All Loop',
    Default = false,
    Callback = function(state)
        AutoBuyEnabled = state
        task.spawn(function()
            while AutoBuyEnabled do
                for _, p in ipairs(ProductList) do
                    if not AutoBuyEnabled then break end
                    if p.id ~= 0 then fireSignal("Product", p.id) task.wait(PurchaseDelay) end
                end
                task.wait(1)
            end
        end)
    end,
})

Tabs.Buyer:AddButton({ Title = 'Refresh Products', Callback = RefreshBuyerUI })

-- ==========================================
-- PHẦN 2: TAB LOGGER
-- ==========================================

Tabs.Logger:AddButton({
    Title = "Clear All Logs",
    Description = "Dọn dẹp danh sách log và dừng Auto",
    Callback = function()
        for id, _ in pairs(activeLoops) do activeLoops[id] = false end
        for _, item in ipairs(logEntries) do pcall(function() item:Destroy() end) end
        table.clear(logEntries)
        table.clear(activeLoops)
        Fluent:Notify({Title = "System", Content = "Logged cleared!", Duration = 2})
    end
})

local function addLogUI(signalType, id)
    if suppressCounter > 0 then return end
    if activeLoops[id] ~= nil then return end 
    activeLoops[id] = false

    local section = Tabs.Logger:AddSection("Log: " .. id)
    table.insert(logEntries, section)

    local infoLabel = section:AddParagraph({
        Title = "", 
        Content = string.format("Type: %s | ID: %s | Time: %s", signalType, tostring(id), os.date("%H:%M:%S"))
    })
    table.insert(logEntries, infoLabel)

    section:AddButton({
        Title = "Execute Once",
        Callback = function() fireSignal(signalType, id) end
    })

    section:AddToggle("Auto" .. id, {
        Title = "Auto Execute",
        Default = false,
        Callback = function(state)
            activeLoops[id] = state
            if state then
                task.spawn(function()
                    while activeLoops[id] do fireSignal(signalType, id) task.wait(1 / autoSpeed) end
                end)
            end
        end
    })

    section:AddButton({
        Title = "Copy Full Path",
        Callback = function()
            setclipboard(GetFullScript(signalType, id))
            Fluent:Notify({Title = "Copied", Content = "Script copied!", Duration = 2})
        end
    })
end

-- ==========================================
-- PHẦN 3: TAB SETTINGS
-- ==========================================

Tabs.Settings:AddSlider('PurchaseDelay', {
    Title = 'Buyer Loop Delay (sec)',
    Min = 0, Max = 2, Default = 0.05, Rounding = 2,
    Callback = function(val) PurchaseDelay = val end,
})

Tabs.Settings:AddSlider("AutoSpeed", {
    Title = "Logger Auto Speed (sig/sec)",
    Min = 1, Max = 1000, Default = 100, Rounding = 0,
    Callback = function(v) autoSpeed = v end
})

-- ==========================================
-- KẾT NỐI SỰ KIỆN & KHỞI CHẠY
-- ==========================================

MarketplaceService.PromptProductPurchaseFinished:Connect(function(_, id) addLogUI("Product", id) end)
MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(_, id) addLogUI("Gamepass", id) end)
MarketplaceService.PromptPurchaseFinished:Connect(function(_, id) addLogUI("Purchase", id) end)

RefreshBuyerUI()
Window:SelectTab(1)
