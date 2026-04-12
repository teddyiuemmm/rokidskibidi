local _MarketplaceService = game:GetService('MarketplaceService')
local _LocalPlayer = game:GetService('Players').LocalPlayer

-- Load Thư viện Fluent UI
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua'))()
local InterfaceManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua'))()

local Window = Fluent:CreateWindow({
    Title = 'Developer Product Buyer',
    SubTitle = 'by MoiNotVideo',
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
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
local UIButtons = {}

-- Hàm thực hiện lệnh mua
local function ExecutePurchase(productId)
    pcall(function()
        if _MarketplaceService.SignalPromptProductPurchaseFinished then
            _MarketplaceService:SignalPromptProductPurchaseFinished(_LocalPlayer.UserId, productId, true)
        end
    end)

    local remotes = {'PurchaseProduct', 'BuyItem', 'AttemptPurchase', 'BuyDeveloperProduct'}
    for _, name in ipairs(remotes) do
        local remote = game:GetService('ReplicatedStorage'):FindFirstChild(name)
        if remote then
            if remote:IsA('RemoteEvent') then
                remote:FireServer(productId)
            elseif remote:IsA('RemoteFunction') then
                pcall(function() remote:InvokeServer(productId) end)
            end
        end
    end
end

-- Lấy danh sách sản phẩm từ game
local function FetchProducts()
    local products = {}
    local success, pages = pcall(function()
        return _MarketplaceService:GetDeveloperProductsAsync()
    end)

    if success and pages then
        while true do
            for _, item in ipairs(pages:GetCurrentPage()) do
                table.insert(products, {
                    id = item.ProductId,
                    name = item.Name,
                    price = item.PriceInRobux,
                })
            end
            if pages.IsFinished or not pcall(function() pages:AdvanceToNextPage() end) then break end
        end
    end
    
    return #products > 0 and products or {{id = 0, name = "No Products Found", price = 0}}
end

-- Mua tất cả
local function BuyAll()
    for _, product in ipairs(ProductList) do
        if product.id ~= 0 then
            task.spawn(ExecutePurchase, product.id)
            if PurchaseDelay > 0 then task.wait(PurchaseDelay) end
        end
    end
end

-- Làm mới UI
local function RefreshUI()
    -- Xóa nút cũ
    for _, btn in ipairs(UIButtons) do
        if btn.Destroy then btn:Destroy() end
    end
    table.clear(UIButtons)

    ProductList = FetchProducts()

    for _, product in ipairs(ProductList) do
        if product.id ~= 0 then
            local btn = Tabs.Main:AddButton({
                Title = product.name .. " (" .. product.price .. " R$)",
                Description = "ID: " .. product.id,
                Callback = function() ExecutePurchase(product.id) end
            })
            table.insert(UIButtons, btn)
        end
    end
end

-- Cài đặt
local function SetupSettings()
    Tabs.Settings:AddSlider('PurchaseDelay', {
        Title = 'Purchase Delay',
        Description = 'Delay between purchases.',
        Min = 0,
        Max = 1,
        Default = 0.05,
        Rounding = 2,
        Callback = function(val) PurchaseDelay = val end,
    })
end

-- Giao diện chính
local function SetupMain()
    Tabs.Main:AddToggle('AutoBuyAll', {
        Title = 'Auto Buy Loop',
        Default = false,
        Callback = function(state)
            AutoBuyEnabled = state
            if state then
                task.spawn(function()
                    while AutoBuyEnabled do
                        BuyAll()
                        task.wait(1) -- Chống crash
                    end
                end)
            end
        end,
    })

    Tabs.Main:AddButton({
        Title = 'Buy All Now',
        Callback = BuyAll
    })

    Tabs.Main:AddButton({
        Title = 'Refresh Products',
        Callback = function()
            RefreshUI()
            Fluent:Notify({Title = "System", Content = "List Updated", Duration = 3})
        end
    })
end

-- Chạy Script
SetupSettings()
SetupMain()
RefreshUI()

-- Cấu hình SaveManager (Đã sửa tên thư mục cho sạch sẽ)
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
InterfaceManager:SetFolder("DevProductUtility")
SaveManager:SetFolder("DevProductUtility/Configs")
InterfaceManager:BuildInterfaceSection(Tabs.Settings)

Window:SelectTab(1)

Fluent:Notify({
    Title = 'Script Loaded',
    Content = 'Ready to use!',
    Duration = 5,
})
