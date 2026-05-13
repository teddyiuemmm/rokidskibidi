-- Remote Spy v3 (clean rewrite)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local hub = gethui and gethui() or game:GetService("CoreGui")

-- ── Config ──────────────────────────────────────────────────────────────────
local ICONS = {
    RemoteEvent      = "rbxassetid://413369506",
    RemoteFunction   = "rbxassetid://413369623",
    BindableEvent    = "rbxassetid://4229809371",
    BindableFunction = "rbxassetid://4229807624",
}
local filters = {
    RemoteEvent      = true,
    RemoteFunction   = true,
    BindableEvent    = false,
    BindableFunction = false,
}
local copyArgs   = false
local canRefresh = true
local genId      = 0

-- ── Helpers ─────────────────────────────────────────────────────────────────
local nameCache = setmetatable({}, { __mode = "k" })

local function getNameCount(parent, name)
    if not parent then return 0 end
    if not nameCache[parent] then
        local counts = {}
        local ok, children = pcall(function() return parent:GetChildren() end)
        if ok then
            for _, c in ipairs(children) do
                counts[c.Name] = (counts[c.Name] or 0) + 1
            end
        end
        nameCache[parent] = counts
    end
    return nameCache[parent][name] or 0
end

local function escStr(s)
    if not s then return "" end
    local out = {}
    for i = 1, #s do
        local b = s:byte(i)
        if 32 <= b and b <= 126 and b ~= 34 and b ~= 92 then
            out[#out+1] = string.char(b)
        else
            out[#out+1] = "\\" .. string.format("%03d", b)
        end
    end
    return table.concat(out)
end

local function isIdent(s)
    return type(s) == "string" and s:match("^[%a_][%w_]*$") ~= nil
end

local function getPath(inst, svcMap, player)
    if not inst then return "nil" end
    local chain = {}
    local cur = inst
    while cur and cur ~= game do
        table.insert(chain, 1, cur)
        cur = cur.Parent
    end
    if #chain == 0 then return "game" end

    local rootName = chain[1].Name or ""
    local path

    if player and rootName == (player.Name or "") then
        path = 'game:GetService("Players").LocalPlayer'
    elseif svcMap and svcMap[rootName] then
        path = svcMap[rootName]
    else
        local ok, svc = pcall(function() return game:GetService(rootName) end)
        if ok and svc then
            path = 'game:GetService("' .. escStr(rootName) .. '")'
        elseif rootName == "Workspace" then
            path = "workspace"
        elseif isIdent(rootName) then
            path = "game." .. rootName
        else
            path = 'game["' .. escStr(rootName) .. '"]'
        end
    end

    for i = 2, #chain do
        local node   = chain[i]
        local name   = node.Name or ""
        local parent = node.Parent
        if parent then
            if getNameCount(parent, name) <= 1 then
                path = path .. (isIdent(name) and ("." .. name) or ('["' .. escStr(name) .. '"]'))
            else
                local ok2, siblings = pcall(function() return parent:GetChildren() end)
                local idx = 1
                if ok2 then
                    for j, sib in ipairs(siblings) do
                        if sib == node then idx = j break end
                    end
                end
                path = path .. ":GetChildren()[" .. idx .. "]"
            end
        else
            path = path .. '["' .. escStr(name) .. '"]'
        end
    end
    return path
end

local function fixPath(s)
    if type(s) ~= "string" then return s end
    local lp = 'game:GetService("Players").LocalPlayer:WaitForChild("PlayerScripts")'
    return s
        :gsub('game:GetService%("StarterPlayer"%)%.StarterPlayerScripts', lp)
        :gsub('game%.StarterPlayer%.StarterPlayerScripts', lp)
        :gsub('game%[%"StarterPlayer%"%]%[%"StarterPlayerScripts%"%]', lp)
end

local function loadSvcMap()
    local ok, result = pcall(function()
        local raw = game:HttpGet("https://raw.githubusercontent.com/Games1799/MAP/refs/heads/main/GetService.lua")
        local fn = raw and loadstring(raw)
        if not fn then return {} end
        local ok2, data = pcall(fn)
        return (ok2 and type(data) == "table") and data or {}
    end)
    return (ok and type(result) == "table") and result or {}
end

local function buildCode(className, path, rawPath)
    local fixed = fixPath(rawPath)
    if className == "RemoteEvent" then
        return copyArgs and ("local args = {}\n" .. path .. ":FireServer(unpack(args))") or (path .. ":FireServer()")
    elseif className == "RemoteFunction" then
        return copyArgs and ("local args = {}\n" .. path .. ":InvokeServer(unpack(args))") or (path .. ":InvokeServer()")
    elseif className == "BindableEvent" then
        return copyArgs and ("local args = {}\n" .. fixed .. ":Fire(unpack(args))") or (fixed .. ":Fire()")
    elseif className == "BindableFunction" then
        return copyArgs and ("local args = {}\n" .. fixed .. ":Invoke(unpack(args))") or (fixed .. ":Invoke()")
    end
    return path
end

local function getClipboard()
    return setclipboard or toclipboard
end

-- ── UI helpers ───────────────────────────────────────────────────────────────
local function new(class, props, parent)
    local obj = Instance.new(class)
    if parent then obj.Parent = parent end
    if props then
        for k, v in pairs(props) do obj[k] = v end
    end
    return obj
end

-- ── Build UI ─────────────────────────────────────────────────────────────────
local sg = new("ScreenGui", { ResetOnSpawn = false, Parent = hub })

-- Main frame
local mainFrame = new("Frame", {
    Size = UDim2.fromOffset(250, 350),
    Position = UDim2.new(0.5, -125, 0.5, -175),
    BackgroundColor3 = Color3.fromRGB(30, 32, 34),
    Active = true,
    Draggable = true,
    Visible = false,
}, sg)

-- Title
new("TextLabel", {
    Size = UDim2.new(1, 0, 0, 30),
    BackgroundColor3 = Color3.fromRGB(45, 48, 51),
    Text = "Remote Browser",
    Font = Enum.Font.GothamBold,
    TextSize = 16,
    TextColor3 = Color3.fromRGB(200, 200, 200),
}, mainFrame)

-- Close button
new("TextButton", {
    Size = UDim2.fromOffset(30, 30),
    Position = UDim2.new(1, -30, 0, 0),
    Text = "X",
    Font = Enum.Font.GothamBold,
    TextSize = 15,
    BackgroundColor3 = Color3.fromRGB(255, 60, 60),
    TextColor3 = Color3.new(1, 1, 1),
}, mainFrame).MouseButton1Click:Connect(function()
    mainFrame.Visible = false
    local settings = sg:FindFirstChild("Settings")
    if settings then settings.Visible = false end
end)

-- Settings toggle
local settingsFrame
new("ImageButton", {
    Size = UDim2.fromOffset(30, 30),
    Position = UDim2.fromOffset(0, 0),
    Image = "rbxassetid://6031280882",
    BackgroundColor3 = Color3.fromRGB(45, 48, 51),
}, mainFrame).MouseButton1Click:Connect(function()
    if settingsFrame then settingsFrame.Visible = not settingsFrame.Visible end
end)

-- Search box
local searchBox = new("TextBox", {
    Size = UDim2.new(1, -10, 0, 25),
    Position = UDim2.fromOffset(5, 35),
    PlaceholderText = "Search...",
    ClearTextOnFocus = false,
    BackgroundColor3 = Color3.fromRGB(50, 53, 57),
    TextColor3 = Color3.fromRGB(220, 220, 220),
    Text = "",
    Font = Enum.Font.Gotham,
    TextSize = 14,
}, mainFrame)

-- Remote list
local remoteList = new("ScrollingFrame", {
    Position = UDim2.fromOffset(0, 65),
    Size = UDim2.new(1, 0, 1, -65),
    BackgroundColor3 = Color3.fromRGB(38, 40, 42),
    ScrollBarThickness = 4,
    CanvasSize = UDim2.new(0, 0, 0, 0),
}, mainFrame)

local listLayout = new("UIListLayout", { Padding = UDim.new(0, 4) }, remoteList)

listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    remoteList.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 10)
end)

-- Filter/search
local function applyFilter()
    local q = (searchBox.Text or ""):lower()
    for _, child in ipairs(remoteList:GetChildren()) do
        if child:IsA("Frame") then
            local class = child:GetAttribute("ClassName") or ""
            local btn   = child:FindFirstChildWhichIsA("TextButton")
            if btn then
                local show = (filters[class] or false)
                    and (q == "" or btn.Text:lower():find(q, 1, true) ~= nil)
                child.Visible = show
            end
        end
    end
end

searchBox:GetPropertyChangedSignal("Text"):Connect(applyFilter)

-- Refresh remotes
local function refresh()
    genId = genId + 1
    local gen = genId

    for _, c in ipairs(remoteList:GetChildren()) do
        if c:IsA("Frame") then c:Destroy() end
    end

    local svcMap = loadSvcMap()
    local remotes, seen = {}, {}

    for _, obj in ipairs(game:GetDescendants()) do
        local c = obj.ClassName
        if c == "RemoteEvent" or c == "RemoteFunction"
        or c == "BindableEvent" or c == "BindableFunction" then
            table.insert(remotes, obj)
        end
    end

    task.spawn(function()
        for i, inst in ipairs(remotes) do
            if gen ~= genId then return end

            local ok, path = pcall(getPath, inst, svcMap, LocalPlayer)
            local safePath = ok and path or ("<error: " .. tostring(inst) .. ">")

            if not seen[safePath] then
                seen[safePath] = true

                local row = new("Frame", {
                    Size = UDim2.new(1, -10, 0, 30),
                    BackgroundTransparency = 1,
                    Parent = remoteList,
                })
                row:SetAttribute("ClassName", inst.ClassName)

                new("ImageLabel", {
                    Size = UDim2.fromOffset(20, 20),
                    Position = UDim2.new(0, 0, 0.5, -10),
                    BackgroundTransparency = 1,
                    Image = ICONS[inst.ClassName] or ICONS.RemoteEvent,
                }, row)

                local btn = new("TextButton", {
                    Size = UDim2.new(1, -35, 1, 0),
                    Position = UDim2.fromOffset(30, 0),
                    Text = inst.Name,
                    Font = Enum.Font.Gotham,
                    TextSize = 13,
                    TextColor3 = Color3.fromRGB(220, 220, 220),
                    BackgroundColor3 = Color3.fromRGB(52, 55, 60),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextTruncate = Enum.TextTruncate.AtEnd,
                }, row)
                new("UIPadding", { PaddingLeft = UDim.new(0, 8) }, btn)

                btn.MouseButton1Click:Connect(function()
                    local ok2, p2 = pcall(getPath, inst, svcMap, LocalPlayer)
                    local finalPath = ok2 and p2 or safePath
                    local code = buildCode(inst.ClassName, finalPath, fixPath(finalPath))
                    local cb = getClipboard()
                    if cb then pcall(cb, code) end
                end)
            end

            if i % 40 == 0 then task.wait() end
        end
        applyFilter()
    end)
end

-- Open/close button
new("TextButton", {
    Size = UDim2.fromOffset(120, 35),
    Position = UDim2.new(0, 20, 0.5, -100),
    Text = "Remote Spy",
    Font = Enum.Font.GothamSemibold,
    TextSize = 14,
    BackgroundColor3 = Color3.fromRGB(50, 55, 60),
    TextColor3 = Color3.new(1, 1, 1),
    Parent = sg,
}).MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
    if mainFrame.Visible and #remoteList:GetChildren() <= 1 then
        refresh()
    end
end)

-- ── Settings ─────────────────────────────────────────────────────────────────
settingsFrame = new("Frame", {
    Name = "Settings",
    Size = UDim2.fromOffset(200, 300),
    Position = UDim2.new(0.5, -100, 0.5, -150),
    BackgroundColor3 = Color3.fromRGB(40, 40, 45),
    Visible = false,
    Active = true,
    Draggable = true,
    Parent = sg,
})

new("TextLabel", {
    Size = UDim2.new(1, 0, 0, 30),
    BackgroundColor3 = Color3.fromRGB(55, 55, 60),
    Text = "Settings",
    Font = Enum.Font.GothamBold,
    TextSize = 15,
    TextColor3 = Color3.new(1, 1, 1),
}, settingsFrame)

new("TextButton", {
    Size = UDim2.fromOffset(30, 30),
    Position = UDim2.new(1, -30, 0, 0),
    Text = "X",
    Font = Enum.Font.GothamBold,
    TextSize = 15,
    BackgroundColor3 = Color3.fromRGB(255, 60, 60),
    TextColor3 = Color3.new(1, 1, 1),
}, settingsFrame).MouseButton1Click:Connect(function()
    settingsFrame.Visible = false
end)

-- Copy args toggle
local copyArgsBtn = new("TextButton", {
    Size = UDim2.new(1, -20, 0, 28),
    Position = UDim2.fromOffset(10, 40),
    Text = "Copy args — OFF",
    Font = Enum.Font.Gotham,
    TextSize = 13,
    BackgroundColor3 = Color3.fromRGB(60, 60, 70),
    TextColor3 = Color3.new(1, 1, 1),
}, settingsFrame)
copyArgsBtn.MouseButton1Click:Connect(function()
    copyArgs = not copyArgs
    copyArgsBtn.Text = "Copy args — " .. (copyArgs and "ON" or "OFF")
end)

-- Filters label
new("TextLabel", {
    Size = UDim2.new(1, -20, 0, 20),
    Position = UDim2.fromOffset(10, 75),
    BackgroundTransparency = 1,
    Text = "Filters",
    Font = Enum.Font.GothamBold,
    TextSize = 13,
    TextColor3 = Color3.new(1, 1, 1),
}, settingsFrame)

-- Filter buttons
local filterY = 100
for _, class in ipairs({"RemoteEvent","RemoteFunction","BindableEvent","BindableFunction"}) do
    local btn = new("TextButton", {
        Size = UDim2.new(1, -20, 0, 26),
        Position = UDim2.fromOffset(10, filterY),
        Text = class .. " — " .. (filters[class] and "ON" or "OFF"),
        Font = Enum.Font.Gotham,
        TextSize = 13,
        BackgroundColor3 = Color3.fromRGB(60, 60, 70),
        TextColor3 = Color3.new(1, 1, 1),
    }, settingsFrame)
    btn.MouseButton1Click:Connect(function()
        filters[class] = not filters[class]
        btn.Text = class .. " — " .. (filters[class] and "ON" or "OFF")
        applyFilter()
    end)
    filterY = filterY + 30
end

-- Refresh button
new("TextLabel", {
    Size = UDim2.new(1, -20, 0, 20),
    Position = UDim2.new(0, 10, 1, -50),
    BackgroundTransparency = 1,
    Text = "Refresh",
    Font = Enum.Font.GothamBold,
    TextSize = 13,
    TextColor3 = Color3.new(1, 1, 1),
}, settingsFrame)

new("TextButton", {
    Size = UDim2.new(1, -20, 0, 26),
    Position = UDim2.new(0, 10, 1, -26),
    Text = "Refresh",
    Font = Enum.Font.Gotham,
    TextSize = 13,
    BackgroundColor3 = Color3.fromRGB(70, 70, 80),
    TextColor3 = Color3.new(1, 1, 1),
}, settingsFrame).MouseButton1Click:Connect(function()
    if canRefresh then
        canRefresh = false
        refresh()
        task.delay(5, function() canRefresh = true end)
    end
end)

-- Version
new("TextLabel", {
    Size = UDim2.new(1, -20, 0, 20),
    Position = UDim2.new(0, 10, 1, -22),
    BackgroundTransparency = 1,
    Text = "v3",
    Font = Enum.Font.GothamItalic,
    TextSize = 12,
    TextColor3 = Color3.fromRGB(180, 180, 180),
    TextTransparency = 0.5,
    TextXAlignment = Enum.TextXAlignment.Right,
}, settingsFrame)

-- Init
task.delay(0.5, refresh)
