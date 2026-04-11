local message = Instance.new("Message")
message.Text = "loading wygay (skidded by MoiNotVideo)"
message.Parent = game:GetService("CoreGui")

task.wait(0.25)
message:Destroy()

local LoadTime = tick()
local player = game.Players.LocalPlayer
local LocalUserId = player.UserId or nil
local LocalName = player.Name or nil
local LocalAge = player.AccountAge or nil
local PlaceId = game.PlaceId or nil

local BindableRemoteFunctionToggle
local BindableRemoteEventToggle
local Status_LastUpdate
local DevProductLink
local GamePassLink
local UseBulkStatus
local PurchasePrice
local StataRemaing
local Status_Online 
local PurchaseLink
local oldNewindex
local Status_Open
local oldNamecall
local DevProduct 
local GamePass
local Conn_Id_1
local Conn_Id_2
local Conn_Id_3
local Conn_Id_4
local IsLimited
local GamesId
local Number1
local Number2
local Number3
local Number4
local Number5
local Number6
local _PlaceId
local Prompt1
local Prompt2
local Conn_1
local Conn_2
local Conn_3
local Conn_4
local Conn_5
local NewId
local _Price
local Home
local UgcId
local Stata
local Price
local T_C
local pp

local BindableRemoteEventToggle = false
local BindableFunctionToggle = false
local AntiTeleport = false

local old_namecall = nil
local RootPlaceId = nil
local ProductInfo = nil

local Cache = {}
local Places = {}
local PlaceIds = {}
local _Remotes = {}
local __Remotes = {}
local BulkResults = {}
local HidePlayers = {}
local BulkNewIds = {}
local GamePassIds = {}
local UniverseCache = {}
local SettingsWygay = {}
local DevProductsIds = {}
local GamePassNames = {}
local DevProductsNames = {}

local cloneref = cloneref or clone_ref or function(a) -- Fake cloneref 
   return a
end

local MarketplaceService  = cloneref(game:GetService("MarketplaceService"))
local ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"))
local TeleportService = cloneref(game:GetService("TeleportService"))
local AssetService = cloneref(game:GetService("AssetService"))
local HttpService = cloneref(game:GetService("HttpService"))
local RunService = cloneref(game:GetService("RunService"))
local workspace  = cloneref(game:GetService("Workspace"))
local Players = cloneref(game:GetService("Players"))

local setclipboard = setclipboard or toclipboard or setrbxclipboard or set_clipboard or to_clipboard or set_rbx_clipboard or (Clipboard and Clipboard.set) or writeclipboard or write_clipboard or nil
local clearteleportqueue = clearteleportqueue or clear_teleport_queue or (syn and syn.clear.teleport.queue) or (fluxus and fluxus.clear_teleport_queue) or nil
local getconnections = getconnections or get_signal_cons or get_connections or getsignalcons or getsignalconnections or get_signal_connections or nil
local queueonteleport = queueonteleport or queue_on_teleport or (syn and syn.queue_on_teleport) or (fluxus and fluxus.queue_on_teleport) or nil
local getnamecallmethod = getnamecallmethod or get_namecall_method or nil
local fireproximityprompt = fireproximityprompt or fire_proximy_prompt or nil
local firesignal = firesignal or fire_signal or signalfire or signal_fire or nil
local firetouchinterest = firetouchinterest or fire_touch_interest or nil
local fireclickdetector = fireclickdetector or fire_click_detector or nil

if firesignal and not fireproximityprompt then
   fireproximityprompt = function(prompt)
      firesignal(prompt.Triggered)
   end
end

if firesignal and not fireclickdetector then
   fireclickdetector = function(Detector)
      firesignal(Detector.MouseClick)
   end
end

if firesignal and not firetouchinterest then
   firetouchinterest = function(part1, part2, toggle)
      if toggle == 0 then
         firesignal(part1.Touched, part2)
      else
         firesignal(part1.TouchEnded, part2)
      end
   end
end

local Fake = false
pcall(function() -- for weak executors 
   if type(getgenv) ~= "function" then
      Fake = true
      function getgenv() -- Fake getgenv
         return _G
      end
   end
end)

getgenv().Wygay_LoopFireAllRemotesOnYourMethod = false
getgenv().Wygay_UseTableInMyFireRemotesMethod = false
getgenv().Wygay_LoopFireRemoteOnYourMethod = false
getgenv().Wygay_AllPlayerOwnsAssetReturnTrue = false
getgenv().Wygay_LoopFireAllProximityPrompt = false
getgenv().Wygay_LoopFireAllTouchInterest = false
getgenv().Wygay_LoopFireAllClickDetector = false
getgenv().Wygay_LoadScriptAfterTeleport = false
getgenv().Wygay_AutoClickerCloseErors = false
getgenv().Wygay_AutoClickerPurchase = false
getgenv().Wygay_LoopFireDevProduct = false
getgenv().Wygay_LoopFireGamePass = false
getgenv().Wygay_AutoClickerClose = false
getgenv().Wygay_AutoHidePlayers = false
getgenv().Wygay_LoopFireRemote = false
getgenv().Wygay_EnableNumber = false
getgenv().Wygay_BuyPaidItems = false
getgenv().Wygay_OpenConsole = false 
getgenv().Wygay_SpamSignal = false
getgenv().Wygay_SignalTrue = false
getgenv().Wygay_AntiKick = false
getgenv().Wygay_UseTools = false
getgenv().Wygay_KillAura = false
getgenv().Wygay_Ticket = false 

getgenv().Wygay_YourFireRemotesMethod = nil
getgenv().Wygay_SelectRemote = nil
getgenv().Wygay_LevelConnect = nil
getgenv().Wygay_HumPosition = nil
getgenv().Wygay__ProductInfo = nil
getgenv().Wygay_BulkIds = nil

getgenv().Wygay_NotificationRemotes = true

getgenv().Wygay_BulkStatus = "Success"
getgenv().Wygay_SignalDelay = 0.1 

local defaultSettings = {
    ["Home"] = true,
    ["Scripts"] = true,
    ["UGC Limiteds"] = true,
    ["Remotes"] = true,
    ["Games"] = true,
    ["Value Explorer"] = true,
    ["ENV Explorer"] = false,
    ["Players"] = true,
    ["Player"] = true,
    ["Network"] = true,
    ["Input Automations"] = true,
    ["Purchase Exploits"] = true,
    ["Purchase Signals"] = true,
    ["Fake Purchase"] = true
}

for i, v in pairs(defaultSettings) do
    if getgenv().Wygay_Settings and getgenv().Wygay_Settings[i] ~= nil then
        SettingsWygay[i] = getgenv().Wygay_Settings[i]
    else
        SettingsWygay[i]= v
    end
end

pcall(function() -- For Fire All Remotes 
    for _, v in ipairs(cloneref(game:GetService("RobloxReplicatedStorage")):GetChildren()) do
       v:Destroy()
    end
end)

local discord = loadstring(game:HttpGet("https://raw.githubusercontent.com/teddyiuemmm/rokidskibidi/refs/heads/main/discordtrashLib.lua"))()
local win = discord:Window("Wygay v3.6 skidded by MoiNotVideo")
local serv = win:Server("Wygay", "http://www.roblox.com/asset/?id=6031075938")

local serv2 = win:Server("Settings", "http://www.roblox.com/asset/?id=4492476121")
local SettingsSection = serv2:Channel("???")
SettingsSection:Label("deo co gi dau")

if SettingsWygay["Home"] then
   local Home = serv:Channel("Home")

   local TimeLoaded = tick() - LoadTime

   Home:Label("Welcome to Wygay!\nThis script was skid by MoiNotVideo")
   Home:Label("\nThank you for using Wygay\nOn Top JetJet Vi En")
   
   Home:Seperator()
   
   Home:Label(("Wygay is loaded in %.1fs"):format(TimeLoaded))
   
   Home:Seperator()

   Home:Button("Copy Script Wygay", function()
      setclipboard('loadstring(Game:HttpGet("https://raw.githubusercontent.com/Games1799/Scripts/refs/heads/main/Wygay.lua"))()')
   end)

   Home:Toggle("Anti Kick (Client)", false, function(state)
      getgenv().Wygay_AntiKick = state
      if state then
         local oldKc
         oldKc = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
            if getgenv().Wygay_AntiKick and getnamecallmethod() == "Kick" then
               return
            end
            return oldKc(self, ...)
         end))
      end
   end)  
end

if SettingsWygay["Scripts"] then
   local Scripts = serv:Channel("Scripts")
   
   local GetRandomString
   pcall(function()
       GetRandomString = function()
          local s = ""
          for i = 2, 25 do
              s = s .. string.char(math.random(1,250))
          end
          return s
      end
   end)
   
   Scripts:Button("Open Console",function()
      game:GetService("StarterGui"):SetCore("DevConsoleVisible", true)
   end)
   
      Scripts:Button("Dex",function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/infyiff/backup/main/dex.lua'))()
   end)
   
   Scripts:Button("IY",function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end)
   
   Scripts:Button("remote spy",function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua"))()
   end)
   
   Scripts:Button("octo spy",function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/InfernusScripts/Octo-Spy/refs/heads/main/Main.lua", true))()
   end)

   Scripts:Button("turtle spy",function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/uuuuuuu/main/Turtle%20Spy.lua"))()
   end)
   
   Scripts:Button("Dev Products Purchase", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ckw69/Wyborn/refs/heads/main/Dev%20Product%20Purchase"))()
   end)
   
   Scripts:Button("Dev Products Purchase v2", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Sqweex-lua/Free-Product-Obfs/main/obfuscated.lua"))()
   end)
   
Scripts:Seperator()

     Scripts:Button("Dex explorer ++",function()
      loadstring(game:HttpGet("https://github.com/AZYsGithub/DexPlusPlus/releases/latest/download/out.lua"))()
   end)
   
    Scripts:Button("F3X", function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/refs/heads/main/f3x.lua"))()
   end)
   
   Scripts:Button("Audio Logger", function()
      loadstring(game:HttpGet(('https://raw.githubusercontent.com/infyiff/backup/main/audiologger.lua'),true))()
   end)
   
   Scripts:Button("Teleport Tool", function()
       local TpTool = Instance.new("Tool")
       pcall(function() TpTool.Name = GetRandomString() end)
       TpTool.RequiresHandle = false
       TpTool.TextureId = "rbxassetid://6723742952"
       TpTool.Parent = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")

       local mouse = game.Players.LocalPlayer:GetMouse()
       TpTool.Activated:Connect(function()
              local root = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
              if not root then return end
              if not mouse.Target then return end
              root.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0,3,0))
              pcall(function() TpTool.Name = GetRandomString() end)
       end)
   end)

   Scripts:Button("Adonis Anti Cheat Bypass", function()
       loadstring(game:HttpGet('https://raw.githubusercontent.com/Pixeluted/adoniscries/main/Source.lua'))()
   end)
   
   Scripts:Button("Server Browser", function()
       loadstring(game:HttpGet("https://www.scriptblox.com/raw/Server-Browser_80"))()
   end)
end

if SettingsWygay["UGC Limiteds"] then
   local UGCLimiteds = serv:Channel("UGC Limiteds")
   UGCLimiteds:Label("Looking for Remote Bruteforcing? Check out #Remotes!")
   UGCLimiteds:Seperator()
   UGCLimiteds:Label("\nThis will auto purchase any limited that gets prompted!\nThis is recommended to use in the rolimons game.\n")

   UGCLimiteds:Button("Teleport to Rolimons UGC Game", function()
      TeleportService:Teleport(14056754882,game.Players.LocalPlayer)
   end)
   
   UGCLimiteds:Button("Flex UGC Codes", function()
      TeleportService:Teleport(15108736400, game.Players.LocalPlayer)
   end)

   UGCLimiteds:Seperator()
   
   UGCLimiteds:Button("Check Purchase Finished Connections",function()
       if type(getconnections) == "function" then 
           local Conn_Prompt = getconnections(MarketplaceService.PromptPurchaseFinished)
           local Conn_GamePass = getconnections(MarketplaceService.PromptGamePassPurchaseFinished)
           local Conn_Product = getconnections(MarketplaceService.PromptProductPurchaseFinished)
           local Conn_Bundle = getconnections(MarketplaceService.PromptBundlePurchaseFinished)
           local Conn_Bulk = getconnections(MarketplaceService.PromptBulkPurchaseFinished)
           discord:Notification("Success","Prompt: "..#Conn_Prompt.." | GamePass: "..#Conn_GamePass.." | Product: "..#Conn_Product.."\nBundle: "..#Conn_Bundle.." | Bulk: "..#Conn_Bulk,"Okay")
       else
           discord:Notification("Error","Your executor doesn't support getconnections","okay")
       end
   end)
   
   UGCLimiteds:Seperator()
   
   UGCLimiteds:Toggle("Enable Auto Click Purchase (PromptGui v4)",false,function(state)
      local VirtualInputManager = cloneref(game:GetService("VirtualInputManager"))
      local CoreGui = cloneref(game:GetService("CoreGui"))
      getgenv().Wygay_New_AutoClickerPurchase = state
      while getgenv().Wygay_New_AutoClickerPurchase and task.wait() do
            task.spawn(function()
                 pcall(function()
                    if CoreGui.FoundationOverlay then
                    if CoreGui.FoundationOverlay.ProductPurchaseModal then
                    if CoreGui.FoundationOverlay.ProductPurchaseModal.Sheet then
                    if CoreGui.FoundationOverlay.ProductPurchaseModal.Sheet.Content then
                    if CoreGui.FoundationOverlay.ProductPurchaseModal.Sheet.Content.Actions then
                    if CoreGui.FoundationOverlay.ProductPurchaseModal.Sheet.Content.Actions[1] then
                    local SusButtonFullName = CoreGui.FoundationOverlay.ProductPurchaseModal.Sheet.Content.Actions[1]
                    local SusButtonPos = SusButtonFullName.AbsolutePosition + (SusButtonFullName.AbsolutePosition / 3)
                    VirtualInputManager:SendMouseButtonEvent(SusButtonPos.X,SusButtonPos.Y,0,true,game,0)
                    task.wait()
                    VirtualInputManager:SendMouseButtonEvent(SusButtonPos.X,SusButtonPos.Y,0,false,game,0)
                    end end end end end end
                 end)
             end)
        end
   end)
   
   
   UGCLimiteds:Toggle("Enable Auto Click Close Error (PromptGui v4)",false,function(state)
     local VirtualInputManager = cloneref(game:GetService("VirtualInputManager"))
     local CoreGui = cloneref(game:GetService("CoreGui"))
     getgenv().Wygay_New_AutoClickerCloseErors = state
     while getgenv().Wygay_New_AutoClickerCloseErors and task.wait() do
           task.spawn(function()
                pcall(function()
                   if CoreGui.FoundationOverlay then
                   if CoreGui.FoundationOverlay.ProductPurchasePrompt then
                   if CoreGui.FoundationOverlay.ProductPurchasePrompt.Sheet then
                   if CoreGui.FoundationOverlay.ProductPurchasePrompt.Sheet.Content then
                   if CoreGui.FoundationOverlay.ProductPurchasePrompt.Sheet.Content.Actions then
                   if CoreGui.FoundationOverlay.ProductPurchasePrompt.Sheet.Content.Actions[1] then
                   local CloseErrorButton = cloneref(game:GetService("CoreGui")).FoundationOverlay.ProductPurchasePrompt.Sheet.Content.Actions[1]
                   local CloseErrorButtonPos = CloseErrorButton.AbsolutePosition + (CloseErrorButton.AbsolutePosition / 3)
                   VirtualInputManager:SendMouseButtonEvent(CloseErrorButtonPos.X,CloseErrorButtonPos.Y,0,true,game,0)
                   task.wait()
                   VirtualInputManager:SendMouseButtonEvent(CloseErrorButtonPos.X,CloseErrorButtonPos.Y,0,false,game,0)
                   end end end end end end
               end)
          end)
       end
   end)
   
   UGCLimiteds:Toggle("Enable Auto Close Prompt (PromptGui v4)",false,function(state)
     local VirtualInputManager = cloneref(game:GetService("VirtualInputManager"))
     local CoreGui = cloneref(game:GetService("CoreGui"))
     getgenv().Wygay_New_AutoClickerClose = state
     while getgenv().Wygay_New_AutoClickerClose and task.wait() do
           task.spawn(function()
                pcall(function()
                   if CoreGui.FoundationOverlay then
                   if CoreGui.FoundationOverlay.ProductPurchaseModal then 
                   if CoreGui.FoundationOverlay.ProductPurchaseModal.Sheet then
                   if CoreGui.FoundationOverlay.ProductPurchaseModal.Sheet.CloseAffordance then 
                   local CloseButtonFullName = CoreGui.FoundationOverlay.ProductPurchaseModal.Sheet.CloseAffordance
                   local CloseButtonPos = CloseButtonFullName.AbsolutePosition + (CloseButtonFullName.AbsoluteSize * 1.65) -  Vector2.new(10,-15)
                   VirtualInputManager:SendMouseButtonEvent(CloseButtonPos.X,CloseButtonPos.Y,0,true,game,0)
                   task.wait()
                   VirtualInputManager:SendMouseButtonEvent(CloseButtonPos.X,CloseButtonPos.Y,0,false,game,0)
                   end end end end
                end)
           end)
        end
   end)
   
   UGCLimiteds:Seperator()
   
   UGCLimiteds:Toggle("Enable Auto Click Purchase (PromptGui v3)",false,function(state)
      local VirtualInputManager = cloneref(game:GetService("VirtualInputManager"))
      local CoreGui = cloneref(game:GetService("CoreGui"))
      getgenv().Wygay_V3_AutoClickerPurchase = state
      while getgenv().Wygay_V3_AutoClickerPurchase and task.wait() do
            task.spawn(function()
                 pcall(function()
                    if CoreGui.FoundationOverlay then
                    if CoreGui.FoundationOverlay.ProductPurchaseModal then
                    if CoreGui.FoundationOverlay.ProductPurchaseModal.SheetContainer then
                    if CoreGui.FoundationOverlay.ProductPurchaseModal.SheetContainer.Sheet then
                    if CoreGui.FoundationOverlay.ProductPurchaseModal.SheetContainer.Sheet.Content then
                    if CoreGui.FoundationOverlay.ProductPurchaseModal.SheetContainer.Sheet.Content.Actions then
                    if CoreGui.FoundationOverlay.ProductPurchaseModal.SheetContainer.Sheet.Content.Actions["1"] then
                    local SusButtonFullName = cloneref(game:GetService("CoreGui")).FoundationOverlay.ProductPurchaseModal.SheetContainer.Sheet.Content.Actions["1"]
                    local SusButtonPos = SusButtonFullName.AbsolutePosition
                    VirtualInputManager:SendMouseButtonEvent(SusButtonPos.X,SusButtonPos.Y,0,true,game,0)
                    task.wait()
                    VirtualInputManager:SendMouseButtonEvent(SusButtonPos.X,SusButtonPos.Y,0,false,game,0)
                    end end end end end end end
                 end)
             end)
        end
   end)
   
   UGCLimiteds:Toggle("Enable Auto Click Close Error (PromptGui v3)",false,function(state)
     local VirtualInputManager = cloneref(game:GetService("VirtualInputManager"))
     local CoreGui = cloneref(game:GetService("CoreGui"))
     getgenv().Wygay_V3_AutoClickerCloseErors = state
     while getgenv().Wygay_V3_AutoClickerCloseErors and task.wait() do
           task.spawn(function()
                pcall(function()
                   if CoreGui.FoundationOverlay then
                   if CoreGui.FoundationOverlay.ProductPurchasePrompt then
                   if CoreGui.FoundationOverlay.ProductPurchasePrompt.SheetContainer then
                   if CoreGui.FoundationOverlay.ProductPurchasePrompt.SheetContainer.Sheet then
                   if CoreGui.FoundationOverlay.ProductPurchasePrompt.SheetContainer.Sheet.Content then
                   if CoreGui.FoundationOverlay.ProductPurchasePrompt.SheetContainer.Sheet.Content.Actions then
                   if CoreGui.FoundationOverlay.ProductPurchasePrompt.SheetContainer.Sheet.Content.Actions["1"] then
                   local CloseErrorButton = cloneref(game:GetService("CoreGui")).FoundationOverlay.ProductPurchasePrompt.SheetContainer.Sheet.Content.Actions["1"]
                   local CloseErrorButtonPos = CloseErrorButton.AbsolutePosition + (CloseErrorButton.AbsolutePosition / 3)
                   VirtualInputManager:SendMouseButtonEvent(CloseErrorButtonPos.X,CloseErrorButtonPos.Y,0,true,game,0)
                   task.wait()
                   VirtualInputManager:SendMouseButtonEvent(CloseErrorButtonPos.X,CloseErrorButtonPos.Y,0,false,game,0)
                   end end end end end end end
               end)
          end)
       end
   end)
   
   UGCLimiteds:Toggle("Enable Auto Close Prompt (PromptGui v3)",false,function(state)
     local VirtualInputManager = cloneref(game:GetService("VirtualInputManager"))
     local CoreGui = cloneref(game:GetService("CoreGui"))
     getgenv().Wygay_V3_AutoClickerClose = state
     while getgenv().Wygay_V3_AutoClickerClose and task.wait() do
           task.spawn(function()
                pcall(function()
                   if CoreGui.FoundationOverlay then
                   if CoreGui.FoundationOverlay.ProductPurchaseModal then 
                   if CoreGui.FoundationOverlay.ProductPurchaseModal.SheetContainer then
                   if CoreGui.FoundationOverlay.ProductPurchaseModal.SheetContainer.Sheet then 
                   if CoreGui.FoundationOverlay.ProductPurchaseModal.SheetContainer.Sheet.CloseAffordance then
                   local CloseButtonFullName = CoreGui.FoundationOverlay.ProductPurchaseModal.SheetContainer.Sheet.CloseAffordance
                   local CloseButtonPos = CloseButtonFullName.AbsolutePosition + (CloseButtonFullName.AbsoluteSize * 1.65) -  Vector2.new(10,-15)
                   VirtualInputManager:SendMouseButtonEvent(CloseButtonPos.X,CloseButtonPos.Y,0,true,game,0)
                   task.wait()
                   VirtualInputManager:SendMouseButtonEvent(CloseButtonPos.X,CloseButtonPos.Y,0,false,game,0)
                   end end end end end
                end)
           end)
        end
   end)   
   
   UGCLimiteds:Seperator()

   UGCLimiteds:Toggle("Enable Auto Click Purchaser (PromptGui v2)",false,function(state)
      local VirtualInputManager = cloneref(game:GetService("VirtualInputManager"))
      local CoreGui = cloneref(game:GetService("CoreGui"))
      getgenv().Wygay_AutoClickerPurchase = state
      while getgenv().Wygay_AutoClickerPurchase and task.wait() do
            task.spawn(function()
                 pcall(function()
                    if CoreGui.PurchasePromptApp then
                    if CoreGui.PurchasePromptApp.ProductPurchaseContainer then
                    if CoreGui.PurchasePromptApp.ProductPurchaseContainer.Animator then
                    if CoreGui.PurchasePromptApp.ProductPurchaseContainer.Animator.ProductPurchaseModal then
                    if CoreGui.PurchasePromptApp.ProductPurchaseContainer.Animator.ProductPurchaseModal.AlertContents then
                    if CoreGui.PurchasePromptApp.ProductPurchaseContainer.Animator.ProductPurchaseModal.AlertContents.Footer then
                    if CoreGui.PurchasePromptApp.ProductPurchaseContainer.Animator.ProductPurchaseModal.AlertContents.Footer.Buttons then 
                    if CoreGui.PurchasePromptApp.ProductPurchaseContainer.Animator.ProductPurchaseModal.AlertContents.Footer.Buttons[1] then
                    local SusButtonFullName = CoreGui.PurchasePromptApp.ProductPurchaseContainer.Animator.ProductPurchaseModal.AlertContents.Footer.Buttons[1]
                    local SusButtonPos = SusButtonFullName.AbsolutePosition + (SusButtonFullName.AbsolutePosition / 2.4)
                    VirtualInputManager:SendMouseButtonEvent(SusButtonPos.X,SusButtonPos.Y,0,true,game,0)
                    task.wait()
                    VirtualInputManager:SendMouseButtonEvent(SusButtonPos.X,SusButtonPos.Y,0,false,game,0)
                    end end end end end end end end 
                 end)
             end)
        end
   end)

   UGCLimiteds:Toggle("Enable Auto Click Close Error (PromptGui v2)",false,function(state)
     local VirtualInputManager = cloneref(game:GetService("VirtualInputManager"))
     local CoreGui = cloneref(game:GetService("CoreGui"))
     getgenv().Wygay_AutoClickerCloseErors = state
     while getgenv().Wygay_AutoClickerCloseErors and task.wait() do
           task.spawn(function()
                pcall(function()
                   if CoreGui.PurchasePromptApp then
                   if CoreGui.PurchasePromptApp.ProductPurchaseContainer then
                   if CoreGui.PurchasePromptApp.ProductPurchaseContainer.Animator then
                   if CoreGui.PurchasePromptApp.ProductPurchaseContainer.Animator.ProductPurchasePrompt then
                   if CoreGui.PurchasePromptApp.ProductPurchaseContainer.Animator.ProductPurchasePrompt.AlertContents then
                   if CoreGui.PurchasePromptApp.ProductPurchaseContainer.Animator.ProductPurchasePrompt.AlertContents.Footer then
                   if CoreGui.PurchasePromptApp.ProductPurchaseContainer.Animator.ProductPurchasePrompt.AlertContents.Footer.Buttons then
                   if CoreGui.PurchasePromptApp.ProductPurchaseContainer.Animator.ProductPurchasePrompt.AlertContents.Footer.Buttons["1"] then
                   local CloseErrorButton = cloneref(game:GetService("CoreGui")).PurchasePromptApp.ProductPurchaseContainer.Animator.ProductPurchasePrompt.AlertContents.Footer.Buttons["1"]
                   local CloseErrorButtonPos = CloseErrorButton.AbsolutePosition + (CloseErrorButton.AbsolutePosition / 2.4)
                   VirtualInputManager:SendMouseButtonEvent(CloseErrorButtonPos.X,CloseErrorButtonPos.Y,0,true,game,0)
                   task.wait()
                   VirtualInputManager:SendMouseButtonEvent(CloseErrorButtonPos.X,CloseErrorButtonPos.Y,0,false,game,0)
                   end end end end end end end end
               end)
          end)
       end
   end)

   UGCLimiteds:Toggle("Enable Auto Close Prompt (PromptGui v2)",false,function(state)
     local VirtualInputManager = cloneref(game:GetService("VirtualInputManager"))
     local CoreGui = cloneref(game:GetService("CoreGui"))
     getgenv().Wygay_AutoClickerClose = state
     while getgenv().Wygay_AutoClickerClose and task.wait() do
           task.spawn(function()
                pcall(function()
                   if CoreGui.PurchasePromptApp then
                   if CoreGui.PurchasePromptApp.ProductPurchaseContainer then 
                   if CoreGui.PurchasePromptApp.ProductPurchaseContainer.Animator then
                   if CoreGui.PurchasePromptApp.ProductPurchaseContainer.Animator.ProductPurchaseModal then 
                   if CoreGui.PurchasePromptApp.ProductPurchaseContainer.Animator.ProductPurchaseModal.AlertContents then
                   if CoreGui.PurchasePromptApp.ProductPurchaseContainer.Animator.ProductPurchaseModal.AlertContents.TitleContainer then
                   if CoreGui.PurchasePromptApp.ProductPurchaseContainer.Animator.ProductPurchaseModal.AlertContents.TitleContainer.TitleArea then
                   if CoreGui.PurchasePromptApp.ProductPurchaseContainer.Animator.ProductPurchaseModal.AlertContents.TitleContainer.TitleArea.Title then
                   if CoreGui.PurchasePromptApp.ProductPurchaseContainer.Animator.ProductPurchaseModal.AlertContents.TitleContainer.TitleArea.Title.CloseButton then
                   local CloseButtonFullName = CoreGui.PurchasePromptApp.ProductPurchaseContainer.Animator.ProductPurchaseModal.AlertContents.TitleContainer.TitleArea.Title.CloseButton
                   local CloseButtonPos = CloseButtonFullName.AbsolutePosition + (CloseButtonFullName.AbsoluteSize * 1.65) -  Vector2.new(10,-15)
                   VirtualInputManager:SendMouseButtonEvent(CloseButtonPos.X,CloseButtonPos.Y,0,true,game,0)
                   task.wait()
                   VirtualInputManager:SendMouseButtonEvent(CloseButtonPos.X,CloseButtonPos.Y,0,false,game,0)
                   end end end end end end end end end
                end)
           end)
        end
   end)

   UGCLimiteds:Seperator()

   UGCLimiteds:Toggle("Enable Auto Signal True On PromptPurchase",false,function(state)
       if state then
          Conn_2 = MarketplaceService.PromptPurchaseRequestedV2:Connect(function(_,Conn_Id_2)
              MarketplaceService:SignalPromptPurchaseFinished(game.Players.LocalPlayer,Conn_Id_2,true)
          end)
       else
           Conn_2:Disconnect()
       end
   end)

   UGCLimiteds:Toggle("Enable Auto Signal False On PromptPurchase",false,function(state)
       if state then
          Conn_3 = MarketplaceService.PromptPurchaseRequestedV2:Connect(function(_,Conn_Id_2)
              MarketplaceService:SignalPromptPurchaseFinished(game.Players.LocalPlayer,Conn_Id_2,false)
          end)
       else
            Conn_3:Disconnect()
       end
   end)

   UGCLimiteds:Toggle("Enable Auto Signal True On PromptBundlePurchase",false,function(state)
       if state then 
          Conn_4 = MarketplaceService.PromptPurchaseRequestedV2:Connect(function(_,Conn_Id_3)
              MarketplaceService:SignalPromptBundlePurchaseFinished(game.Players.LocalPlayer,Conn_Id_3,true)
          end)
       else
           Conn_4:Disconnect()
       end
   end)

   UGCLimiteds:Toggle("Enable Auto Signal False On PromptBundlePurchase",false,function(state)
       if state then 
          Conn_5 = MarketplaceService.PromptPurchaseRequestedV2:Connect(function(_,Conn_Id_4)
              MarketplaceService:SignalPromptBundlePurchaseFinished(game.Players.LocalPlayer,Conn_Id_4,false)
          end)
       else
           Conn_5:Disconnect()
       end
    end)

    UGCLimiteds:Seperator()
     
    local AutoCheckRemaingCopies
    UGCLimiteds:Textbox("You can check ugc status with Id","Enter a ugc Id",true,function(SID)
        local StatusId = tonumber(SID)
        getgenv().Wygay_StatusId_ = StatusId
        if StatusId then
           local CheckStatus = MarketplaceService:GetProductInfo(StatusId)
           if CheckStatus.IsLimited or CheckStatus.IsLimitedUnique then
			   IsLimited = "Yes" 
		   else 
			   IsLimited = "No"
		   end
           if CheckStatus.IsLimited or CheckStatus.IsLimitedUnique then
			   StataRemaing = CheckStatus.Remaining
		   else
			   StataRemaing = "nil"
		   end
           if CheckStatus.IsForSale then
			  Stata = "For Sale"
		   elseif not CheckStatus.IsForSale and CheckStatus.PriceRobux ~= nil and CheckStatus.PriceRobux > 0 and CheckStatus.Sales > 0 then
			  Stata = "Offsale"
		   elseif not CheckStatus.IsForSale and (CheckStatus.PriceRobux == nil or CheckStatus.PriceRobux == 0) and CheckStatus.Sales == 0 then
			  Stata = "Not for sale"
		   end 
           discord:Notification("Success!","Id - "..StatusId.." / Status - "..Stata.."\nIs Limited - "..IsLimited.." / Remaing - "..StataRemaing,"Okay!")
           AutoCheckRemaingCopies:Change("Ramaing Copies – "..StataRemaing)
        else
            discord:Notification("Error!","Enter a number","Okay")
        end
    end)
    
    AutoCheckRemaingCopies = UGCLimiteds:Label("Ramaing Copies – nil")
    
    getgenv().Wygay_StatusId_ = nil
    getgenv().Wygay_CheckCPR = false
    local SRC
    local _SRC
    
    UGCLimiteds:Toggle("Auto Check Remaing Copies", false, function(state)
        if not getgenv().Wygay_StatusId_ and not getgenv().Wygay_CheckCPR  then
            discord:Notification("Error", "Enter a ugc id", "Okay")
            return
        end
        getgenv().Wygay_CheckCPR = state
        while getgenv().Wygay_CheckCPR and task.wait(1) do
            local TCR = MarketplaceService:GetProductInfo(getgenv().Wygay_StatusId_)
            if TCR.IsLimited or TCR.IsLimitedUnique then
                SRC = TCR.Remaining
            else
                 SRC = "nil"
            end
            pcall(function()
                if getgenv().Wygay_UPNOT then
                    AutoCheckRemaingCopies:Change("Ramaing Copies – "..SRC)
                    if not _SRC then
                        _SRC = SRC
                    end
                    if SRC ~= _SRC then
                        _SRC = SRC
                        discord:Notification("Change Copies", "Remaining: "..SRC.."\nId: "..getgenv().Wygay_StatusId_, "Okay")
                    end
                else
                    AutoCheckRemaingCopies:Change("Ramaing Copies – "..SRC)
                end
            end)
        end
    end)
    
    UGCLimiteds:Toggle("Use Notifications", false, function(state)
        getgenv().Wygay_UPNOT = state
    end)

    UGCLimiteds:Seperator()

    UGCLimiteds:Toggle("Open Console After Purchase",false,function(state)
        getgenv().Wygay_OpenConsole = state
    end)

    UGCLimiteds:Toggle("Auto Purchase Paid Items (For Below)",false,function(state)
        getgenv().Wygay_BuyPaidItems = state
    end)
      
    UGCLimiteds:Seperator()
    
    UGCLimiteds:Toggle("Auto Purchaser V1",false,function(state)
              if state then
                      discord:Notification("Waiting","Waiting for any free UGC item to be prompted...","Okay!")
                      local Conn = MarketplaceService.PromptPurchaseRequestedV2:Connect(function(...)
                             local t = {...}
                             discord:Notification("Prompt Detected","If this is a UGC item, this script will attempt purchase. Please check console.","Okay!")
                             local PurchaseProductId = t[2]
                             local IdempotencyKey = t[5]
                             local PurchaseAuthToken = t[6]
                             local info = MarketplaceService:GetProductInfo(PurchaseProductId,Enum.InfoType.Asset)
                             local PurchaseCollectibleItemId = info.CollectibleItemId
                             local PurchaseCollectibleProductId = info.CollectibleProductId
                             local PurchaseInfoType = Enum.InfoType.Asset

                             if getgenv().Wygay_BuyPaidItems then 
                                    PurchasePrice = info.PriceInRobux 
                             else 
                                    PurchasePrice = 0 
                             end
                             
                             local IsRobloxPurchase = true
                             local PurchaseRequestId = HttpService:GenerateGUID(false)
                             local timedOptionsDays = 0 -- 0 days
                             print("ProductId — "..PurchaseProductId)
                             print("IdempotencyKey — "..IdempotencyKey)
                             print("AuthToken — "..PurchaseAuthToken)
                             print("CollectibleItemId — "..PurchaseCollectibleItemId)
                             print("CollectibleProductId — "..PurchaseCollectibleProductId)
                             print("InfoType — "..tostring(PurchaseInfoType))
                             print("Price — "..PurchasePrice)
                             print("IsRobloxPurchase — "..tostring(IsRobloxPurchase))
                             print("RequestId — "..PurchaseRequestId)
                             print("TimedOptionsDays – "..tostring(timedOptionsDays))
                             warn("———————————————————————————————")
                             warn("FIRST PURCHASE ITEM!")
                             if getgenv().Wygay_OpenConsole then 
                                   local VirtualInputManager = cloneref(game:GetService("VirtualInputManager"))
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F9, false, nil)
                                    task.wait(0.01)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.F9, false, nil)
                             end 
                             local sus,eror = pcall(function()
                                      MarketplaceService:PerformPurchase(PurchaseInfoType,PurchaseProductId,PurchasePrice,PurchaseRequestId,IsRobloxPurchase,PurchaseCollectibleItemId,PurchaseCollectibleProductId,IdempotencyKey,PurchaseAuthToken,timedOptionsDays)
                              end)
                              if not sus then 
                                      error("Snaiper V1 Error — "..eror) 
                              else 
                                      print("Purchase success!") 
                              end
                      end)
              else
                     Conn:Disconnect()
              end
      end)

      UGCLimiteds:Toggle("Auto Purchaser V2 (Only UGC Limiteds)",false,function(state)
              if state then
                      discord:Notification("Waiting","Waiting for any free UGC item to be prompted...","Okay!")
                      local _Conn = MarketplaceService.PromptPurchaseRequestedV2:Connect(function(...)
                              discord:Notification("Prompt Detected","If this is a UGC item, this script will attempt purchase. Please check console.","Okay!")
                              local k = {...}
                              local InfoType = Enum.InfoType.Asset
                              local ProductId  = k[2]
                              local info = MarketplaceService:GetProductInfo(ProductId)
                              
                              if getgenv().Wygay_BuyPaidItems then 
                                     Price = info.PriceInRobux 
                              else 
                                     Price = 0 
                              end
                              
                              local RequestId = HttpService:GenerateGUID(false)
                              local IsRbxPurchase = true
                              local collectiblesProductDetails = info.CollectibleDetails
                              print("InfoType — "..tostring(InfoType))
                              print("ProductId — "..ProductId)
                              print("Price — "..Price)
                              print("RequestId — "..RequestId)
                              print("IsRobloxPurchase — "..tostring(IsRbxPurchase))
                              print("collectiblesProductDetails — "..collectiblesProductDetails)
                              warn("———————————————————————————————")
                              warn("FIRST PURCHASE ITEM!")
                              local _sus,_eror = pcall(function()
                                      if not _sus then 
                                             error("Snaiper V2 Error — ".._eror) 
                                      else 
                                             print("Purchase success!") 
                                      end
                                      if getgenv().Wygay_OpenConsole then 
                                            local VirtualInputManager = cloneref(game:GetService("VirtualInputManager"))
                                            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F9, false, nil)
                                             task.wait(0.01)
                                             VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.F9, false, nil)
                                      end
                                      MarketplaceService:PerformPurchaseV2(InfoType,ProductId,Price,RequestId,IsRbxPurchase,collectiblesProductDetails)
                              end)
                      end)
              else
                      _Conn:Disconnect()
              end
      end)

       UGCLimiteds:Toggle("Auto Purchaser V3 (WEB Only)",false,function(state)
               if state then
                       discord:Notification("Waiting","Waiting for any free UGC item to be prompted...","Okay!")
                       local __con = MarketplaceService.PromptPurchaseRequestedV2:Connect(function(...)
                              local j = {...}
                              local _ProductId = j[2]
                              local _info = MarketplaceService:GetProductInfo(_ProductId)
                              local _CollectibleItemId = _info.CollectibleItemId
                              local _PurchaseCollectibleProductId = _info.CollectibleProductId
                              local _ExpectedCurrency = 1

                              if getgenv().Wygay_BuyPaidItems then 
                                      _Price = _info.PriceInRobux 
                              else 
                                      _Price = 0 
                              end
                              
                              local _IdempotencyKey = HttpService:GenerateGUID(false)
                              local _SellerId = _info.Creator.Id
                              local _SellerType = _info.Creator.CreatorType
                              local _PurchaserType = "User"
                              local _PurchaserUserId = player.UserId
                              local Data = {_ProductId,_CollectibleItemId,_PurchaseCollectibleProductId,_ExpectedCurrency,_Price,_IdempotencyKey,_SellerId,_SellerType,_PurchaserType,_PurchaserUserId}
                              local JsonData = HttpService:JSONEncode(Data)
                              print(JsonData)
                              pcall(function()
                                      PurchaseLink = "https://apis.roblox.com/marketplace-sales/v1/item/"..tostring(_info.CollectibleItemId).."/purchase-item"
                              end)
                              local _Ye,_No
                              if PurchaseLink then
                                       if getgenv().Wygay_OpenConsole then 
                                               local VirtualInputManager = cloneref(game:GetService("VirtualInputManager"))
                                               VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F9, false, nil)
                                               task.wait(0.01)
                                               VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.F9, false, nil)
                                        end
                                        _Ye,_No = pcall(function()
                                                cloneref(game:GetService("HttpRbxApiService")):GetAsyncFullUrl(PurchaseLink,Enum.HttpContentType.ApplicationJson,false,{},JsonData)
                                        end)
                                end
                                if _Ye then
                                        print("answer : "..response)
                                        local decoded = HttpService:JSONDecode(response)
                                        print(decoded)
                                else
                                        warn("Error Request:", response)
                                end
                       end)
               else
                       __con:Disconnect()
               end
       end)

       UGCLimiteds:Toggle("Auto Purchaser V4 (Only BULK)",false,function(state)
               if state then
                      discord:Notification("Waiting","Waiting for any free UGC item to be prompted...","Okay!")
                      local ___con = MarketplaceService.PromptBulkPurchaseRequested:Connect(function(...)
                      local w = {...}
                      local PurchaseOrderQuest = w[3] or {}
                      local PurchasOptions = w[6] or {}
                      print("PurchaseOrderQuest — "..PurchaseOrderQuest)
                      print("PurchasOptions — "..PurchasOptions)
                      warn("ITEM TO PURCHASE!")
                      if getgenv().Wygay_OpenConsole then 
                               local VirtualInputManager = cloneref(game:GetService("VirtualInputManager"))
                               VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F9, false, nil)
                               task.wait(0.01)
                               VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.F9, false, nil)
                       end
                               MarketplaceService:PerformBulkPurchase(PurchaseOrderQuest,PurchasOptions)
                       end)
               else
                       ___con:Disconnect()
               end
       end)
       
       UGCLimiteds:Seperator()
       
       UGCLimiteds:Label("If your executor don't support function GetAsyncFullUrl then you\ncan start web Snaiper on ROBLOSEQURETE token (V5)")
       
       local ROBS_Token
       local XCSR_Token
       local V5_Conn
       local V5_LINK
       local V5_LINK_2

       UGCLimiteds:Textbox("Your ROBLOSEQURETE Token","Enter your ROBLOSEQURETE token",true,function(token)
            ROBS_Token = token
            discord:Notification("Success", "You can now start web Sniper", "Okay")
       end)
       
       local V5_PR
       -- ========= Looking for Stealer? ========= --
       UGCLimiteds:Toggle("Auto Purchaser V5 (Only WEB)", false, function(state)
           if state then
               if ROBS_Token then
                   V5_Conn = MarketplaceService.PromptPurchaseRequestedV2:Connect(function(...)
                       local o = {...}
                       local V5_PRI = o[2]
                       local V5_CID = MarketplaceService:GetProductInfo(V5_PRI, Enum.InfoType.Asset)
                       local V5_CPD = V5_CID.CollectibleItemId
                       local V5_CBP = V5_CID.CollectibleProductId
                       
                       if getgenv().Wygay_BuyPaidItems then 
                           V5_PR = V5_CID.PriceInRobux
                       else
                           V5_PR = 0
                       end
                       
                       local V5_PID = player.UserId
                       local V5_EPT = "User"
                       local V5_ESD = V5_CID.Creator.Id
                       local V5_AST = V5_CID.AssetId
                       local V5_EST = V5_CID.Creator.CreatorType
                       local V5_ST = (V5_EST == Enum.CreatorType.Group) and "Group" or "User"
                       local V5_IKY = HttpService:GenerateGUID(false)
                       local V5_EX = 1
                       local V5_DT = {
                                 collectibleItemId = tostring(V5_CPD),
                                 collectibleProductId = tostring(V5_CBP),
                                 expectedCurrency = V5_EX, 
                                 expectedPrice = V5_PR,
                                 expectedPurchaserId = tostring(player.UserId), 
                                 expectedPurchaserType = "User",
                                 expectedSellerId = V5_ESD,
                                 expectedSellerType = tostring(V5_ST),
                                 idempotencyKey = tostring(V5_IKY),
                                 rentalOptionDays = nil
                                 }
                       local V5_Body = HttpService:JSONEncode(V5_DT)
                       pcall(function() -- apis 
                           V5_LINK = "https://apis.roblox.com/marketplace-sales/v1/item/"..tostring(V5_CPD).."/purchase-item" -- for purchase
                           V5_LINK_2 = "https://auth.roblox.com/v2/logout" -- for token
                       end)
                       local httprequest = request or http_request or (syn and syn.request) or (http and http.request) or (fluxus and fluxus.request)
                       if not httprequest then
                           discord:Notification("Error","Your executor doesn't support request function","Okay")
                           return
                       end
                       if V5_LINK and httprequest and ROBS_Token ~= "" and ROBS_Token ~= " " then
                           local V5_F = httprequest({Url = tostring(V5_LINK_2), Method = "POST", Headers = {["Cookie"] = ".ROBLOSECURITY="..ROBS_Token..";", ["Content-Type"] = "application/json", ["User-Agent"] = "Roblox/WinInet"}, Body = "{}"})
                           if not V5_F then
                               discord:Notification("Error", "Http Error", "Okay")
                               return
                           end
                           local V5_HK = V5_F and (V5_F.Headers or V5_F.headers)
                           local V5_2T = V5_HK and (V5_HK["x-csrf-token"] or V5_HK["X-CSRF-Token"] or V5_HK["X-CSRF-TOKEN"])
                           if not V5_2T then 
                               discord:Notification("Error","Http Error [2]\nROBLOSECURITY is incorrect","Okay")
                               return
                           end
                           local V5_S = httprequest({Url = tostring(V5_LINK), Method = "POST", Headers = {["Cookie"] = ".ROBLOSECURITY="..ROBS_Token..";", ["Content-Type"] = "application/json", ["X-CSRF-TOKEN"] = V5_2T}, Body = V5_Body})
                           if getgenv().Wygay_OpenConsole then 
                               local VirtualInputManager = cloneref(game:GetService("VirtualInputManager"))
                               VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F9, false, nil)
                               task.wait(0.01)
                               VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.F9, false, nil)
                           end
                           if (not V5_S or V5_S.StatusCode ~= 200) then 
                               discord:Notification("Error", "Http Error [3]\nError Code: "..V5_S.StatusCode.."\nError: "..V5_S.Body, "Okay")
                               warn(V5_S)
                               return
                           end
                           if (V5_S and V5_S.StatusCode) == 200 then
                                discord:Notification("Purchase Success ", "Purchase success for "..V5_AST, "Okay")
                           end
                       end
                   end)
               else
                   discord:Notification("Error","Enter a ROBLOSEQURETE token","Okay")
               end
           else
               V5_Conn:Disconnect()
           end
       end)
end

if SettingsWygay["Remotes"] then
       local Remotes = serv:Channel("Remotes")
       Remotes:Label("\nFires all remotes in the game as an attempt to prompt the item.\nWarning: This can be risky and can fire a decoy remote!")

       Remotes:Textbox("UGC Limited Item ID","Enter Item ID that you wanna be included in the arguments...",false,function(id)
               getgenv().Wygay_UgcId = tonumber(id)
               if getgenv().Wygay_UgcId then
                      discord:Notification("Success","The script now remembers that the Item ID you want is " .. tostring(getgenv().Wygay_UgcId) .. "!","Okay!")
               else
                      discord:Notification("Error","That's... not an Item ID.", "Okay!")
               end
       end)

       Remotes:Dropdown("Remote Arguments...",{
                 "No Arguments/Blank",
                 "Bulk Purchase Function 1, (Ugc Item Id)",
                 "Bulk Purchase Function 2, (Ugc Item Id, nil)",
                 "Bulk Purchase Function 3, (UGC Item Id, Fake Ids)",
                 "LocalPlayer",
                 "Your Username",
                 "Your UserId",
                 "UGC Item ID",
                 "UGC Item ID, LocalPlayer",
                 "LocalPlayer, UGC Item ID",
                "'UGC' as a string",
                "'PromptPurchase' as a string, UGC Item Id",
                "'PromptAssetPurchase' as a string, UGC Item Id",
                "UGC Item ID, 'true' boolean",
                "UGC Item ID, 'false' boolean",
                "UGC Item ID, Your UserId",
                "UGC Item ID, InfoType",
                "InfoType, UGC Item ID",
                "'true' boolean",
                "'false' boolean",
                "UGC Item Id, MarketplaceProductType",
                "MarketplaceProductType, UGC Item Id",
                "literal lua code to prompt item",
               "UGC Item ID, 0",
               "UGC Item Id, negative value",
               "Positive value",
               "Negative value",
               "loadstring prompt item", 
                },function(x)
               getgenv().Wygay_RemoteFireMethod = (x)
       end)

       local function FireRemotes(...)
       local Count  = 0
       local args = {...}
       for _, v in ipairs(game:GetDescendants()) do
             if v:IsA("RemoteEvent") or v:IsA("UnreliableRemoteEvent") then
                  Count = Count + 1
                  task.spawn(function()
                        pcall(function()
                                v:FireServer(table.unpack(args))
                        end)
                  end)

             elseif v:IsA("RemoteFunction") then
                  Count = Count + 1
                  task.spawn(function()
                          pcall(function()
                                  v:InvokeServer(table.unpack(args))
                          end)
                  end)

             elseif v:IsA("BindableEvent") then
                  if BindableRemoteEventToggle then
                       Count = Count + 1
                       task.spawn(function()
                             pcall(function()
                                     v:Fire(table.unpack(args))
                             end)
                       end)
                  end

             elseif v:IsA("BindableFunction") then
                  if BindableFunctionToggle then
                       Count = Count + 1
                       task.spawn(function()
                            pcall(function()
                                   v:Invoke(table.unpack(args)) 
                            end)
                       end)
                  end
            end
      end       
            if getgenv().Wygay_NotificationRemotes then
                    discord:Notification("Success","Fired "..Count.." Remotes","Okay!")
             end
       end

       local function _FireRemotes(...)
       local _Count  = 0
       local _args = {...}
       for _, v in ipairs(game:GetDescendants()) do
             if v:IsA("RemoteEvent") or v:IsA("UnreliableRemoteEvent") then
                  _Count = _Count + 1
                  task.spawn(function()
                        pcall(function()
                                v:FireServer(unpack(_args))
                        end)
                  end)

             elseif v:IsA("RemoteFunction") then
                  _Count = _Count + 1
                  task.spawn(function()
                          pcall(function()
                                v:InvokeServer(unpack(_args))
                        end)
                  end)

             elseif v:IsA("BindableEvent") then
                  if BindableRemoteEventToggle then
                     _Count = _Count + 1
                         task.spawn(function()
                               pcall(function()
                                    v:Fire(unpack(_args))
                               end)
                        end)
                  end

             elseif v:IsA("BindableFunction") then
                  if BindableRemoteFunctionToggle then
                  _Count = _Count + 1
                         task.spawn(function()
                               pcall(function()
                                    v:Invoke(unpack(_args)) 
                               end)
                         end)
                  end
             end
       end
            if getgenv().Wygay_NotificationRemotes then
                    discord:Notification("Success","Fired ".._Count.." Remotes","Okay!")
            end
       end

       local function __FireRemotes(Remote1,...)
       local __args = {...}
       if Remote1:IsA("RemoteEvent") or Remote1:IsA("UnreliableRemoteEvent") then
           task.spawn(function()
                pcall(function()
                      Remote1:FireServer(unpack(__args))
                end)
           end)

       elseif Remote1:IsA("RemoteFunction") then
           task.spawn(function()
                pcall(function()
                      Remote1:InvokeServer(unpack(__args))
                end)
           end)

       elseif Remote1:IsA("BindableEvent") then
           task.spawn(function()
                pcall(function()
                      Remote1:Fire(unpack(__args))
                end)
           end)

       elseif Remote1:IsA("BindableFunction") then
           task.spawn(function()
                pcall(function()
                      Remote1:Invoke(unpack(__args)) 
                end)
           end)
           end
            if getgenv().Wygay_NotificationRemotes then
                    discord:Notification("Success","Fired This Remote","Okay!")
            end
       end

       local function ___FireRemotes(Remote2,...)
       local ___args = {...}
       if Remote2:IsA("RemoteEvent") or Remote2:IsA("UnreliableRemoteEvent") then
           task.spawn(function()
                pcall(function()
                      Remote2:FireServer(table.unpack(___args))
                end)
           end)

       elseif Remote2:IsA("RemoteFunction") then
           task.spawn(function()
                pcall(function()
                      Remote2:InvokeServer(table.unpack(___args))
                end)
       end)

       elseif Remote2:IsA("BindableEvent") then
           task.spawn(function()
                pcall(function()
                      Remote2:Fire(table.unpack(___args))
                end)
           end)

       elseif Remote2:IsA("BindableFunction") then
           task.spawn(function()
                pcall(function()
                      Remote2:Invoke(table.unpack(___args)) 
                end)
           end)
       end
            if getgenv().Wygay_NotificationRemotes then
                    discord:Notification("Success","Fired This Remote","Okay!")
            end
       end

-- Function "FireRemotes" for unpack.table (all)
-- Function "_FireRemotes" for unpack (all)
-- Function "__FireRemotes" for unpack (one)
-- Function "___FireRemotes" for table.unpack (one)
-- Use "_FireRemotes" for Bulk Purchase and "FireRemotes" for usual
-- Use "__FireRemotes" for Bulk Purchase and "___FireRemotes" for usual

       Remotes:Button("Fire All Remotes",function()
       local method = getgenv().Wygay_RemoteFireMethod

         if method == "No Arguments/Blank" then 
             FireRemotes()
         elseif method == "LocalPlayer" then 
             FireRemotes(game.Players.LocalPlayer)
         elseif method == "Your Username" then 
              FireRemotes(tostring(game.Players.LocalPlayer))
         elseif method == "Your UserId" then 
              FireRemotes(game.Players.LocalPlayer.UserId)
         elseif method == "UGC Item ID" then
              FireRemotes(getgenv().Wygay_UgcId)
         elseif method == "UGC Item ID, LocalPlayer" then
              FireRemotes(getgenv().Wygay_UgcId,game.Players.LocalPlayer)
         elseif method == "LocalPlayer, UGC Item ID" then
              FireRemotes(game.Players.LocalPlayer,getgenv().Wygay_UgcId)
         elseif method == "'UGC' as a string" then 
              FireRemotes("UGC")
         elseif method == "'PromptPurchase' as a string, UGC Item Id" then 
              FireRemotes("PromptPurchase",getgenv().Wygay_UgcId)
         elseif method == "'PromptAssetPurchase' as a string, UGC Item Id" then 
              FireRemotes("PromptAssetPurchase",getgenv().Wygay_UgcId)
         elseif method == "UGC Item ID, 'true' boolean" then
              FireRemotes(getgenv().Wygay_UgcId,true)
         elseif method == "UGC Item ID, 'false' boolean" then
              FireRemotes(getgenv().Wygay_UgcId,false)
         elseif method == "UGC Item ID, Your UserId" then
              FireRemotes(getgenv().Wygay_UgcId,game.Players.LocalPlayer.UserId)
         elseif method == "'true' boolean" then 
              FireRemotes(true)
         elseif method == "'false' boolean" then 
              FireRemotes(false)
         elseif method == "UGC Item Id, MarketplaceProductType" then 
              FireRemotes(getgenv().Wygay_UgcId,Enum.MarketplaceProductType.AvatarAsset)
         elseif method == "MarketplaceProductType, UGC Item Id" then 
              FireRemotes(Enum.MarketplaceProductType.AvatarAsset,getgenv().Wygay_UgcId)
         elseif method == "UGC Item ID, InfoType" then
              FireRemotes(getgenv().Wygay_UgcId,Enum.InfoType.Asset)
         elseif method == "InfoType, UGC Item ID" then
              FireRemotes(Enum.InfoType.Asset,getgenv().Wygay_UgcId)
        elseif method == "literal lua code to prompt item" then
              FireRemotes('game:GetService("MarketplaceService"):PromptPurchase(game.Players.'..LocalName..','..getgenv().Wygay_UgcId..')')
        elseif method == "UGC Item ID, 0" then
              FireRemotes(getgenv().Wygay_UgcId,0)
        elseif method == "UGC Item Id, negative value" then
              FireRemotes(getgenv().Wygay_UgcId,-9999999999999999)
        elseif method == "Positive value" then
              FireRemotes(9999999999999999)
        elseif method == "Negative value" then
              FireRemotes(-9999999999999999)
         elseif method == "loadstring prompt item" then 
              FireRemotes("loadstring('game:GetService(\"MarketplaceService\"):PromptPurchase(game.Players."..LocalName..","..getgenv().Wygay_UgcId..")')()")
         elseif method == "Bulk Purchase Function 1, (Ugc Item Id)" then
              _FireRemotes({[1] = {[1] = {Id = tostring(getgenv().Wygay_UgcId),Type = Enum.MarketplaceProductType.AvatarAsset}},[2] = {} })
         elseif method == "Bulk Purchase Function 2, (Ugc Item Id, nil)" then
              _FireRemotes({[1] = {[1] = {Id = getgenv().Wygay_UgcId,Type = Enum.MarketplaceProductType.AvatarAsset}},[2] = {Id = nil,Type = Enum.MarketplaceProductType.AvatarAsset},[3] = {Id = nil,Type = Enum.MarketplaceProductType.AvatarAsset} })
         elseif method == "Bulk Purchase Function 3, (UGC Item Id, Fake Ids)" then 
               _FireRemotes({[1] = {[1] = {Id = getgenv().Wygay_UgcId,Type = Enum.MarketplaceProductType.AvatarAsset}},[2] = {Id = 137525346725198,Type = Enum.MarketplaceProductType.AvatarAsset},[3] = {Id = 77554705161930,Type = Enum.MarketplaceProductType.AvatarAsset} })
         end
   end)

    Remotes:Button("Fire All Remotes on All Methods",function()
       getgenv().Wygay_NotificationRemotes = false
       task.spawn(function()
         pcall(function()
            if not getgenv().Wygay_UgcId then 
               discord:Notification("Error","Enter a ugc id","Okay")
               return
            end
            FireRemotes()
            FireRemotes(game.Players.LocalPlayer)
            FireRemotes(tostring(game.Players.LocalPlayer))
            FireRemotes(game.Players.LocalPlayer.UserId)
            FireRemotes(getgenv().Wygay_UgcId)
            FireRemotes(getgenv().Wygay_UgcId,game.Players.LocalPlayer)
            FireRemotes(game.Players.LocalPlayer,getgenv().Wygay_UgcId)
            FireRemotes("UGC")
            FireRemotes("PromptPurchase",getgenv().Wygay_UgcId)
            FireRemotes("PromptAssetPurchase",getgenv().Wygay_UgcId)
            FireRemotes(getgenv().Wygay_UgcId,true)
            FireRemotes(getgenv().Wygay_UgcId,false)
            FireRemotes(getgenv().Wygay_UgcId,game.Players.LocalPlayer.UserId)
            FireRemotes(true)
            FireRemotes(false)
            FireRemotes(getgenv().Wygay_UgcId,Enum.MarketplaceProductType.AvatarAsset)
            FireRemotes(Enum.MarketplaceProductType.AvatarAsset,getgenv().Wygay_UgcId)
            FireRemotes(getgenv().Wygay_UgcId,Enum.InfoType.Asset)
            FireRemotes(Enum.InfoType.Asset,getgenv().Wygay_UgcId)
            FireRemotes(getgenv().Wygay_UgcId,0)
            FireRemotes(getgenv().Wygay_UgcId,-9999999999999999)
            FireRemotes(9999999999999999)
            FireRemotes(-9999999999999999)
            _FireRemotes({[1] = {[1] = {Id = tostring(getgenv().Wygay_UgcId),Type = Enum.MarketplaceProductType.AvatarAsset}},[2] = {} })
            _FireRemotes({[1] = {[1] = {Id = getgenv().Wygay_UgcId,Type = Enum.MarketplaceProductType.AvatarAsset}},[2] = {Id = nil,Type = Enum.MarketplaceProductType.AvatarAsset},[3] = {Id = nil,Type = Enum.MarketplaceProductType.AvatarAsset} })
            _FireRemotes({[1] = {[1] = {Id = getgenv().Wygay_UgcId,Type = Enum.MarketplaceProductType.AvatarAsset}},[2] = {Id = 137525346725198,Type = Enum.MarketplaceProductType.AvatarAsset},[3] = {Id = 77554705161930,Type = Enum.MarketplaceProductType.AvatarAsset} })
            FireRemotes("loadstring('game:GetService(\"MarketplaceService\"):PromptPurchase(game.Players."..LocalName..","..getgenv().Wygay_UgcId..")')()")
            FireRemotes('game:GetService("MarketplaceService"):PromptPurchase(game.Players.'..LocalName..','..getgenv().Wygay_UgcId..')') -- 26
         end)
         discord:Notification("Success","Fired All Remotes On All Methods","Okay!")
         getgenv().Wygay_NotificationRemotes = true
       end)
    end)

if not BindableRemoteEventToggle then
Remotes:Toggle("Enable BindableRemoteEvent",false,function(state)
if state then 
BindableRemoteEventToggle = true 
else
BindableRemoteEventToggle = false
end
end)
end

if not BindableFunctionToggle then
Remotes:Toggle("Enable BindableFunction",false,function(state)
if state then
BindableFunctionToggle = true
else 
BindableFunctionToggle = false
end
end)
end

Remotes:Toggle("Loop Fire All Remotes",false,function(state)
if state then
getgenv().Wygay_NotificationRemotes = false
local method = getgenv().Wygay_RemoteFireMethod
getgenv().Wygay_Loop = true
while getgenv().Wygay_Loop do 
if method == "No Arguments/Blank" then 
FireRemotes()
elseif method == "LocalPlayer" then 
FireRemotes(game.Players.LocalPlayer)
elseif method == "Your Username" then 
FireRemotes(tostring(game.Players.LocalPlayer))
elseif method == "Your UserId" then 
FireRemotes(game.Players.LocalPlayer.UserId)
elseif method == "UGC Item ID" then
FireRemotes(getgenv().Wygay_UgcId)
elseif method == "UGC Item ID, LocalPlayer" then
FireRemotes(getgenv().Wygay_UgcId,game.Players.LocalPlayer)
elseif method == "LocalPlayer, UGC Item ID" then
FireRemotes(game.Players.LocalPlayer,getgenv().Wygay_UgcId)
elseif method == "'UGC' as a string" then 
FireRemotes("UGC")
elseif method == "'PromptPurchase' as a string, UGC Item Id" then 
FireRemotes("PromptPurchase",getgenv().Wygay_UgcId)
elseif method == "'PromptAssetPurchase' as a string, UGC Item Id" then 
FireRemotes("PromptAssetPurchase",getgenv().Wygay_UgcId)
elseif method == "UGC Item ID, 'true' boolean" then
FireRemotes(getgenv().Wygay_UgcId,true)
elseif method == "UGC Item ID, 'false' boolean" then
FireRemotes(getgenv().Wygay_UgcId,false)
elseif method == "UGC Item ID, 'false' boolean" then
FireRemotes(getgenv().Wygay_UgcId,false)
elseif method == "UGC Item ID, Your UserId" then
FireRemotes(getgenv().Wygay_UgcId,game.Players.LocalPlayer.UserId)
elseif method == "'true' boolean" then 
FireRemotes(true)
elseif method == "'false' boolean" then 
FireRemotes(false)
elseif method == "UGC Item Id, MarketplaceProductType" then 
FireRemotes(getgenv().Wygay_UgcId,Enum.MarketplaceProductType.AvatarAsset)
elseif method == "MarketplaceProductType, UGC Item Id" then 
FireRemotes(Enum.MarketplaceProductType.AvatarAsset,getgenv().Wygay_UgcId)
elseif method == "UGC Item ID, InfoType" then
FireRemotes(getgenv().Wygay_UgcId,Enum.InfoType.Asset)
elseif method == "InfoType, UGC Item ID" then
FireRemotes(Enum.InfoType.Asset,getgenv().Wygay_UgcId)
elseif method == "literal lua code to prompt item" then
FireRemotes('game:GetService("MarketplaceService"):PromptPurchase(game.Players.'..LocalName..','..getgenv().Wygay_UgcId..')')
elseif method == "UGC Item ID, 0" then
FireRemotes(getgenv().Wygay_UgcId,0)
elseif method == "UGC Item Id, negative value" then
FireRemotes(getgenv().Wygay_UgcId,-9999999999999999)
elseif method == "Positive value" then
FireRemotes(9999999999999999)
elseif method == "Negative value" then
FireRemotes(-9999999999999999)
elseif method == "loadstring prompt item" then 
FireRemotes("loadstring('game:GetService(\"MarketplaceService\"):PromptPurchase(game.Players."..LocalName..","..getgenv().Wygay_UgcId..")')()")
elseif method == "Bulk Purchase Function 1, (Ugc Item Id)" then
_FireRemotes({[1] = {[1] = {Id = tostring(getgenv().Wygay_UgcId),Type = Enum.MarketplaceProductType.AvatarAsset}},[2] = {} })
elseif method == "Bulk Purchase Function 2, (Ugc Item Id, nil)" then
_FireRemotes({[1] = {[1] = {Id = getgenv().Wygay_UgcId,Type = Enum.MarketplaceProductType.AvatarAsset}},[2] = {Id = nil,Type = Enum.MarketplaceProductType.AvatarAsset},[3] = {Id = nil,Type = Enum.MarketplaceProductType.AvatarAsset} })
elseif method == "Bulk Purchase Function 3, (UGC Item Id, Fake Ids)" then 
_FireRemotes({[1] = {[1] = {Id = getgenv().Wygay_UgcId,Type = Enum.MarketplaceProductType.AvatarAsset}},[2] = {Id = 137525346725198,Type = Enum.MarketplaceProductType.AvatarAsset},[3] = {Id = 77554705161930,Type = Enum.MarketplaceProductType.AvatarAsset} })
end
task.wait(0.01)
end
else
getgenv().Wygay_Loop = false
getgenv().Wygay_NotificationRemotes = true
end
end)

Remotes:Seperator()

Remotes:Label("\nThis will block client communication with the server.\nUseful for bypassing clientsided anticheats!\n")

Remotes:Toggle("Block All Remotes Called",false,function(state)
if state then
local mt = getrawmetatable(game)
setreadonly(mt,false)
local old = mt.__namecall
mt.__namecall = newcclosure(function(self,...)
local method = getnamecallmethod()
local class = self.ClassName
if (class == "RemoteEvent" and method == "FireServer") or
(class == "RemoteFunction" and method == "InvokeServer") or
(class == "BindableEvent" and method == "Fire") or
(class == "BindableFunction" and method == "Invoke") or
(class == "UnstableRemoteEvent" and method == "FireServer") then
return nil
end
return old(self,...)
end)
else 
mt.__namecall = old
end
setreadonly(mt,true)
end)

for _, v in ipairs(game:GetDescendants()) do
if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") or v:IsA("UnstableRemoteEvent") or v:IsA("BindableEvent") or v:IsA("BindableFunction") then
table.insert(_Remotes,v.Name)
table.insert(__Remotes,v)
end
end

Remotes:Dropdown("What Remote Do You Want Fired",_Remotes,function(x)
local ndx = table.find(_Remotes,x)
getgenv().Wygay_SelectRemote = __Remotes[ndx]
end)

Remotes:Toggle("Loop Fire This Remote",false,function(state)
getgenv().Wygay_LoopFireRemote = state
if state then
getgenv().Wygay_NotificationRemotes = false
if getgenv().Wygay_SelectRemote then
local method = getgenv().Wygay_RemoteFireMethod
if not method then discord:Notification("Failed","Select Remote Arguments","Okay!") return end
while getgenv().Wygay_LoopFireRemote and task.wait() do

if method == "No Arguments/Blank" then 
___FireRemotes(getgenv().Wygay_SelectRemote,"")
elseif method == "LocalPlayer" then 
___FireRemotes(getgenv().Wygay_SelectRemote,game.Players.LocalPlayer)
elseif method == "Your Username" then 
___FireRemotes(getgenv().Wygay_SelectRemote,tostring(game.Players.LocalPlayer))
elseif method == "Your UserId" then 
___FireRemotes(getgenv().Wygay_SelectRemote,game.Players.LocalPlayer.UserId)
elseif method == "UGC Item ID" then
___FireRemotes(getgenv().Wygay_SelectRemote,getgenv().Wygay_UgcId)
elseif method == "UGC Item ID, LocalPlayer" then
___FireRemotes(getgenv().Wygay_SelectRemote,getgenv().Wygay_UgcId,game.Players.LocalPlayer)
elseif method == "LocalPlayer, UGC Item ID" then
___FireRemotes(getgenv().Wygay_SelectRemote,game.Players.LocalPlayer,getgenv().Wygay_UgcId)
elseif method == "'UGC' as a string" then 
___FireRemotes(getgenv().Wygay_SelectRemote,"UGC")
elseif method == "'PromptPurchase' as a string, UGC Item Id" then 
___FireRemotes(getgenv().Wygay_SelectRemote,"PromptPurchase",getgenv().Wygay_UgcId)
elseif method == "'PromptAssetPurchase' as a string, UGC Item Id" then 
___FireRemotes(getgenv().Wygay_SelectRemote,"PromptAssetPurchase",getgenv().Wygay_UgcId)
elseif method == "UGC Item ID, 'true' boolean" then
___FireRemotes(getgenv().Wygay_SelectRemote,getgenv().Wygay_UgcId,true)
elseif method == "UGC Item ID, 'false' boolean" then
___FireRemotes(getgenv().Wygay_SelectRemote,getgenv().Wygay_UgcId,false)
elseif method == "UGC Item ID, InfoType" then
___FireRemotes(getgenv().Wygay_SelectRemote,getgenv().Wygay_UgcId,Enum.InfoType.Asset)
elseif method == "InfoType, UGC Item ID" then
___FireRemotes(getgenv().Wygay_SelectRemote,Enum.InfoType.Asset,getgenv().Wygay_UgcId)
elseif method == "UGC Item ID, Your UserId" then
___FireRemotes(getgenv().Wygay_SelectRemote,getgenv().Wygay_UgcId,game.Players.LocalPlayer.UserId)
elseif method == "'true' boolean" then 
___FireRemotes(getgenv().Wygay_SelectRemote,true)
elseif method == "'false' boolean" then 
___FireRemotes(getgenv().Wygay_SelectRemote,false)
elseif method == "UGC Item Id, MarketplaceProductType" then 
___FireRemotes(getgenv().Wygay_SelectRemote,getgenv().Wygay_UgcId,Enum.MarketplaceProductType.AvatarAsset)
elseif method == "MarketplaceProductType, UGC Item Id" then 
___FireRemotes(getgenv().Wygay_SelectRemote,Enum.MarketplaceProductType.AvatarAsset,getgenv().Wygay_UgcId)
elseif method == "literal lua code to prompt item" then
___FireRemotes(getgenv().Wygay_SelectRemote,'game:GetService("MarketplaceService"):PromptPurchase(game.Players.'..LocalName..','..getgenv().Wygay_UgcId..')')
elseif method == "UGC Item ID, 0" then
___FireRemotes(getgenv().Wygay_SelectRemote,getgenv().Wygay_UgcId,0)
elseif method == "UGC Item Id, negative value" then
___FireRemotes(getgenv().Wygay_SelectRemote,getgenv().Wygay_UgcId,-9999999999999999)
elseif method == "Positive value" then
___FireRemotes(getgenv().Wygay_SelectRemote,9999999999999999)
elseif method == "Negative value" then
___FireRemotes(getgenv().Wygay_SelectRemote,-9999999999999999)
elseif method == "loadstring prompt item" then 
___FireRemotes(getgenv().Wygay_SelectRemote,"loadstring('game:GetService(\"MarketplaceService\"):PromptPurchase(game.Players."..LocalName..","..getgenv().Wygay_UgcId..")')()")
elseif method == "Bulk Purchase Function 1, (Ugc Item Id)" then
__FireRemotes(getgenv().Wygay_SelectRemote,{[1] = {[1] = {Id = tostring(getgenv().Wygay_UgcId),Type = Enum.MarketplaceProductType.AvatarAsset}},[2] = {} })
elseif method == "Bulk Purchase Function 2, (Ugc Item Id, nil)" then
__FireRemotes(getgenv().Wygay_SelectRemote,{[1] = {[1] = {Id = getgenv().Wygay_UgcId,Type = Enum.MarketplaceProductType.AvatarAsset}},[2] = {Id = nil,Type = Enum.MarketplaceProductType.AvatarAsset},[3] = {Id = nil,Type = Enum.MarketplaceProductType.AvatarAsset} })
elseif method == "Bulk Purchase Function 3, (UGC Item Id, Fake Ids)" then 
__FireRemotes(getgenv().Wygay_SelectRemote,{[1] = {[1] = {Id = getgenv().Wygay_UgcId,Type = Enum.MarketplaceProductType.AvatarAsset}},[2] = {Id = 137525346725198,Type = Enum.MarketplaceProductType.AvatarAsset},[3] = {Id = 77554705161930,Type = Enum.MarketplaceProductType.AvatarAsset} })
end
end
end
else
getgenv().Wygay_NotificationRemotes = true
end
end)

Remotes:Button("Fire This Remote",function()
if getgenv().Wygay_SelectRemote then
local method = getgenv().Wygay_RemoteFireMethod
if not method then discord:Notification("Failed","Select Remote Arguments","Okay!") return end

if method == "No Arguments/Blank" then 
___FireRemotes(getgenv().Wygay_SelectRemote,"")
elseif method == "LocalPlayer" then 
___FireRemotes(getgenv().Wygay_SelectRemote,game.Players.LocalPlayer)
elseif method == "Your Username" then 
___FireRemotes(getgenv().Wygay_SelectRemote,tostring(game.Players.LocalPlayer))
elseif method == "Your UserId" then 
___FireRemotes(getgenv().Wygay_SelectRemote,game.Players.LocalPlayer.UserId)
elseif method == "UGC Item ID" then
___FireRemotes(getgenv().Wygay_SelectRemote,getgenv().Wygay_UgcId)
elseif method == "UGC Item ID, LocalPlayer" then
___FireRemotes(getgenv().Wygay_SelectRemote,getgenv().Wygay_UgcId,game.Players.LocalPlayer)
elseif method == "LocalPlayer, UGC Item ID" then
___FireRemotes(getgenv().Wygay_SelectRemote,game.Players.LocalPlayer,getgenv().Wygay_UgcId)
elseif method == "'UGC' as a string" then 
___FireRemotes(getgenv().Wygay_SelectRemote,"UGC")
elseif method == "'PromptPurchase' as a string, UGC Item Id" then 
___FireRemotes(getgenv().Wygay_SelectRemote,"PromptPurchase",getgenv().Wygay_UgcId)
elseif method == "'PromptAssetPurchase' as a string, UGC Item Id" then 
___FireRemotes(getgenv().Wygay_SelectRemote,"PromptAssetPurchase",getgenv().Wygay_UgcId)
elseif method == "UGC Item ID, 'true' boolean" then
___FireRemotes(getgenv().Wygay_SelectRemote,getgenv().Wygay_UgcId,true)
elseif method == "UGC Item ID, 'false' boolean" then
___FireRemotes(getgenv().Wygay_SelectRemote,getgenv().Wygay_UgcId,false)
elseif method == "UGC Item ID, Your UserId" then
___FireRemotes(getgenv().Wygay_SelectRemote,getgenv().Wygay_UgcId,game.Players.LocalPlayer.UserId)
elseif method == "'true' boolean" then 
___FireRemotes(getgenv().Wygay_SelectRemote,true)
elseif method == "'false' boolean" then 
___FireRemotes(getgenv().Wygay_SelectRemote,false)
elseif method == "UGC Item Id, MarketplaceProductType" then 
___FireRemotes(getgenv().Wygay_SelectRemote,getgenv().Wygay_UgcId,Enum.MarketplaceProductType.AvatarAsset)
elseif method == "MarketplaceProductType, UGC Item Id" then 
___FireRemotes(getgenv().Wygay_SelectRemote,Enum.MarketplaceProductType.AvatarAsset,getgenv().Wygay_UgcId)
elseif method == "UGC Item ID, InfoType" then
___FireRemotes(getgenv().Wygay_SelectRemote,getgenv().Wygay_UgcId,Enum.InfoType.Asset)
elseif method == "InfoType, UGC Item ID" then
___FireRemotes(getgenv().Wygay_SelectRemote,Enum.InfoType.Asset,getgenv().Wygay_UgcId)
elseif method == "literal lua code to prompt item" then
___FireRemotes(getgenv().Wygay_SelectRemote,'game:GetService("MarketplaceService"):PromptPurchase(game.Players.'..LocalName..','..getgenv().Wygay_UgcId..')')
elseif method == "UGC Item ID, 0" then
___FireRemotes(getgenv().Wygay_SelectRemote,getgenv().Wygay_UgcId,0)
elseif method == "UGC Item Id, negative value" then
___FireRemotes(getgenv().Wygay_SelectRemote,getgenv().Wygay_UgcId,-9999999999999999)
elseif method == "Positive value" then
___FireRemotes(getgenv().Wygay_SelectRemote,9999999999999999)
elseif method == "Negative value" then
___FireRemotes(getgenv().Wygay_SelectRemote,-9999999999999999)
elseif method == "loadstring prompt item" then 
___FireRemotes(getgenv().Wygay_SelectRemote,"loadstring('game:GetService(\"MarketplaceService\"):PromptPurchase(game.Players."..LocalName..","..getgenv().Wygay_UgcId..")')()")
elseif method == "Bulk Purchase Function 1, (Ugc Item Id)" then
__FireRemotes(getgenv().Wygay_SelectRemote,{[1] = {[1] = {Id = tostring(getgenv().Wygay_UgcId),Type = Enum.MarketplaceProductType.AvatarAsset}},[2] = {} })
elseif method == "Bulk Purchase Function 2, (Ugc Item Id, nil)" then
__FireRemotes(getgenv().Wygay_SelectRemote,{[1] = {[1] = {Id = getgenv().Wygay_UgcId,Type = Enum.MarketplaceProductType.AvatarAsset}},[2] = {Id = nil,Type = Enum.MarketplaceProductType.AvatarAsset},[3] = {Id = nil,Type = Enum.MarketplaceProductType.AvatarAsset} })
elseif method == "Bulk Purchase Function 3, (UGC Item Id, Fake Ids)" then 
__FireRemotes(getgenv().Wygay_SelectRemote,{[1] = {[1] = {Id = getgenv().Wygay_UgcId,Type = Enum.MarketplaceProductType.AvatarAsset}},[2] = {Id = 137525346725198,Type = Enum.MarketplaceProductType.AvatarAsset},[3] = {Id = 77554705161930,Type = Enum.MarketplaceProductType.AvatarAsset} })
else 
discord:Notification("Failed","Celect Remote","Okay!")
end
end
end)

Remotes:Button("Print All Remotes (Includes Path)",function()
for i, v in ipairs(game:GetDescendants()) do
if v:IsA("RemoteEvent") then
print(i.." — RemoteEvent "..v:GetFullName())
elseif v:IsA("RemoteFunction") then
print(i.." — RemoteFunction "..v:GetFullName())
elseif v:IsA("UnreliableRemoteEvent") then
print(i.." — UnreliableRemoteEvent "..v:GetFullName())
elseif v:IsA("BindableEvent") then
print(i.." — BindableEvent "..v:GetFullName())
elseif v:IsA("BindableFunction") then
print(i.." — BindableFunction "..v:GetFullName())
end
end
local VirtualInputManager = cloneref(game:GetService("VirtualInputManager"))
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F9, false, nil)
task.wait(0.01)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.F9, false, nil)
end)

Remotes:Button("Show Number Remotes",function()
if not getgenv().Wygay_EnableNumber then
getgenv().Wygay_EnableNumber = true
Number1 = 0
Number2 = 0
Number3 = 0
Number4 = 0
Number5 = 0
Number6 = 0
for _, v in ipairs(game:GetDescendants()) do
if v:IsA("RemoteEvent") then Number1 = Number1 + 1
elseif v:IsA("RemoteFunction") then Number2 = Number2 + 1
elseif v:IsA("UnreliableRemoteEvent") then Number3 = Number3 + 1
elseif v:IsA("BindableEvent") then Number4 = Number4 + 1
elseif v:IsA("BindableFunction") then Number5 = Number5 + 1
end
end
Number6 = Number1 + Number2 + Number3 + Number4 + Number5
Remotes:Label("There are "..Number1.." RemoteEvents in this game")
Remotes:Label("There are "..Number2.." RemoteFunctions in this game")
Remotes:Label("There are "..Number3.." UnreliableRemoteEvents in this game")
Remotes:Label("There are "..Number4.." BindableEvents in this game")
Remotes:Label("There are "..Number5.." BindableFunctions in this game")
Remotes:Label("There are "..Number6.." Remotes in this game")
Remotes:Button("Copy Number RemoteEvents",function() setclipboard(Number1) end)
Remotes:Button("Copy Number RemoteFunctions",function() setclipboard(Number2) end)
Remotes:Button("Copy Number UnreliableRemoteEvents",function() setclipboard(Number3) end)
Remotes:Button("Copy Number BindableEvents",function() setclipboard(Number4) end)
Remotes:Button("Copy Number BindableFunctions",function() setclipboard(Number5) end)
Remotes:Button("Copy Number Remotes",function() setclipboard(Number6) end)
discord:Notification("Success","Remotes Counted!","Okay!")
else
discord:Notification("Failed","Remotes Already Counted!","Okay!")
end 
end)

Remotes:Seperator()

Remotes:Textbox("Do you want use your fire remotes method?","Enter your method",false, function(YourMethod)
getgenv().Wygay_YourFireRemotesMethod = YourMethod 
end)

Remotes:Toggle("I want use table in my method",false,function(state)
getgenv().Wygay_UseTableInMyFireRemotesMethod = state
end)

Remotes:Button("Fire All Remotes On My Method",function()
if not getgenv().Wygay_UseTableInMyFireRemotesMethod then
FireRemotes(tostring(getgenv().Wygay_YourFireRemotesMethod))
else
_FireRemotes(tostring(getgenv().Wygay_YourFireRemotesMethod))
end
end)

Remotes:Button("Fire selected remote on my method",function()
if not getgenv().Wygay_SelectRemote then discord:Notification("Edror","Select Remote!","Okay!") return end
if not getgenv().Wygay_UseTableInMyFireRemotesMethod then
__FireRemotes(getgenv().Wygay_SelectRemote,tostring(getgenv().Wygay_YourFireRemotesMethod))
else
___FireRemotes(getgenv().Wygay_SelectRemote,tostring(getgenv().Wygay_YourFireRemotesMethod))
end
end)

Remotes:Toggle("Loop Fire All Remotes on your method",false,function(state)
getgenv().Wygay_LoopFireAllRemotesOnYourMethod = state
if state then
getgenv().Wygay_NotificationRemotes = false
while getgenv().Wygay_LoopFireAllRemotesOnYourMethod and task.wait() do
if not getgenv().Wygay_UseTableInMyFireRemotesMethod then
FireRemotes(tostring(getgenv().Wygay_YourFireRemotesMethod))
else
_FireRemotes(tostring(getgenv().Wygay_YourFireRemotesMethod))
end
end
else
getgenv().Wygay_NotificationRemotes = true
end
end)

Remotes:Toggle("Loop Fire Selected Remote on your method",false,function(state)
getgenv().Wygay_LoopFireRemoteOnYourMethod = state
while getgenv().Wygay_LoopFireRemoteOnYourMethod and task.wait() do
if not getgenv().Wygay_UseTableInMyFireRemotesMethod then
__FireRemotes(getgenv().Wygay_SelectRemote,tostring(getgenv().Wygay_YourFireRemotesMethod))
else
___FireRemotes(getgenv().Wygay_SelectRemote,tostring(getgenv().Wygay_YourFireRemotesMethod))
end
end
end)

--[[ 
Remotes:Seperator()

Remotes:Dropdown("Another Remote Arguments...",{
      "'UGC1' in string",
      "'UGC2' in string",
      "'UGC3' in string",
      "'UGC4' in string",
      "'UGC5' in string",
      "'UGC6' in string",
      "'UGC7' in string",
      "'UGC8' in string",
      "'UGC9' in string",
      "'UGC10' in string",
      "'UGC11' in string",
      "'UGC12' in string",
      "'Reward' in string",
      "'Reward1' in string",
      "'Reward2' in string",
      "'Reward3' in string",
      "'Reward4' in string",
      "'Reward5' in string",
      "'Reward6' in string",
      "'Reward7' in string",
      "'Reward8' in string",
      "'Reward9' in string",
      "'Reward10' in string",
      "'Reward11' in string",
      "'Reward12' in string",
      },function(x)
      getgenv().Wygay_RemoteFireMethod = (x)
end)
]]--
Remotes:Seperator()
end

if SettingsWygay["Games"] then
   local Games = serv:Channel("Games")

   Games:Toggle("Anti Kick on Teleport",false,function(state)
      local mt = getrawmetatable(game)
      setreadonly(mt,false)
      if state then
         if old_namecall == nil then
            old_namecall = mt.__namecall
         end
         mt.__namecall = newcclosure(function(self,...)
            local method = getnamecallmethod()
            if self.ClassName == "TeleportService" and (method == "Teleport" or method == "TeleportToPlaceInstance") then
               return nil
            end
            return old_namecall(self,...)
         end)
      else
         if old_namecall then
            mt.__namecall = old_namecall
         end
      end
      setreadonly(mt,true)
   end)

   getgenv().Wygay_GamesMethod = "Teleport"

   Games:Dropdown("What to do with Subplace",{
         "Teleport",
         "Copy Script",
         "Copy Script and Teleport",
         "Copy Game Link",
        "Copy Subplace Id",
         "Copy Game Description",
         "Copy Time Create",
         "Copy Last Time Update",
         "Copy Creator Name",
         "Copy Content Rating",
         "Copy Creator Id",
         "Copy Creator CreatorType",
         "Copy Place Name",
         "Copy Icon URL",
         "Copy Icon Id",
         "Copy Minimum Membership Level",
         "Copy Game Genre"
      },function(x)
      getgenv().Wygay_GamesMethod = x
   end)

   Games:Label("\nBelow is a list of subplaces of this game.\nChoose the one that you want to be teleported into!")

   pcall(function()
      pp = AssetService:GetGamePlacesAsync() 
   end)

   while true do
      for _, v in ipairs(pp:GetCurrentPage()) do
         table.insert(Places,v.Name)
         table.insert(PlaceIds,v.PlaceId)
      end
      if pp.IsFinished then break end
         pp:AdvanceToNextPageAsync() 
      end
      local Select 
      Games:Dropdown("Subplaces/Hidden Games List",Places,function(x)
         local index = nil
         Select = x
         for i, v in ipairs(Places) do
            if v == x then
               index = i 
               break
            end
         end

         local function TeleportNotification()
            discord:Notification("Teleporting","Teleporting to...\n" .. x .. "\nGame ID: " .. _PlaceId,"Okay!")
         end

         if index then
            _PlaceId = PlaceIds[index]
            if getgenv().Wygay_GamesMethod == "Teleport" then
               TeleportNotification()
               TeleportService:Teleport(_PlaceId,Players.LocalPlayer)
            elseif getgenv().Wygay_GamesMethod == "Copy Script" then 
               setclipboard('game:GetService("TeleportService"):Teleport('.._PlaceId..',game.Players.LocalPlayer)')
            elseif getgenv().Wygay_GamesMethod == "Copy Script and Teleport" then
               setclipboard('game:GetService("TeleportService"):Teleport('.._PlaceId..',game.Players.LocalPlayer)')
               TeleportNotification()
               task.wait(0.3)
               TeleportService:Teleport(_PlaceId,Players.LocalPlayer)
           elseif getgenv().Wygay_GamesMethod == "Copy Subplace Id" then 
               setclipboard(_PlaceId)
           elseif getgenv().Wygay_GamesMethod == "Copy Game Link"  then
              setclipboard("http://roblox.com/games/"..tostring(_PlaceId))
           elseif getgenv().Wygay_GamesMethod == "Copy Game Description" then 
               local d_info = MarketplaceService:GetProductInfo(_PlaceId, Enum.InfoType.Asset)
               setclipboard(tostring(d_info.Description) or "nil")
            elseif getgenv().Wygay_GamesMethod == "Copy Time Create" then
               setclipboard(MarketplaceService:GetProductInfo(_PlaceId, Enum.InfoType.Asset).Created:gsub("T"," "):gsub("Z",""):gsub("%.%d+","").." UTC")
            elseif getgenv().Wygay_GamesMethod == "Copy Last Time Update" then
               setclipboard(MarketplaceService:GetProductInfo(_PlaceId, Enum.InfoType.Asset).Updated:gsub("T"," "):gsub("Z",""):gsub("%.%d+","").." UTC")
            elseif getgenv().Wygay_GamesMethod == "Copy Creator Name" then
               setclipboard(MarketplaceService:GetProductInfo(_PlaceId, Enum.InfoType.Asset).Creator.Name)
            elseif getgenv().Wygay_GamesMethod == "Copy Creator Id" then
               setclipboard((MarketplaceService:GetProductInfo(_PlaceId, Enum.InfoType.Asset).Creator or {}).Id or "N/A")
            elseif getgenv().Wygay_GamesMethod == "Copy Creator CreatorType" then
               setclipboard((MarketplaceService:GetProductInfo(_PlaceId, Enum.InfoType.Asset).Creator or {}).CreatorType or "N/A")
            elseif getgenv().Wygay_GamesMethod == "Copy Content Rating" then
               setclipboard(MarketplaceService:GetProductInfo(_PlaceId, Enum.InfoType.Asset).ContentRating or "N/A")
            elseif getgenv().Wygay_GamesMethod == "Copy Place Name" then
               setclipboard(tostring(Select))
            elseif getgenv().Wygay_GamesMethod == "Copy Icon Id" then
               setclipboard(MarketplaceService:GetProductInfo(_PlaceId, Enum.InfoType.Asset).IconImageAssetId)
            elseif getgenv().Wygay_GamesMethod == "Copy Icon URL" then
               setclipboard("https://www.roblox.com/asset/?id="..MarketplaceService:GetProductInfo(_PlaceId, Enum.InfoType.Asset).IconImageAssetId)
            elseif getgenv().Wygay_GamesMethod == "Copy Minimum Membership Level" then
               setclipboard(MarketplaceService:GetProductInfo(_PlaceId, Enum.InfoType.Asset).MinimumMembershipLevel)
            elseif getgenv().Wygay_GamesMethod == "Copy Game Genre" then
               setclipboard(MarketplaceService:GetProductInfo(_PlaceId, Enum.InfoType.Asset).Genre or "N/A")
            end
      end
   end)

   Games:Label("If you only see the main game, no other subplaces found.")
   Games:Seperator()

   Games:Textbox("Pause gameplay for a specified amount of time.","How long do you want to pause the game for? (In seconds)", true,function(x)
      local time = tonumber(x)
      if time then 
         Players.LocalPlayer.GameplayPaused = true
         task.wait(time)
         Players.LocalPlayer.GameplayPaused = false
      else
         discord:Notification("Error", "You must enter a number. (In seconds)", "Okay!")
      end
   end)

   Games:Label("Pausing the gameplay will overlay everything,\nEvery UI becomes unclickable.")

   Games:Seperator()

   Games:Toggle("Force Full Bright Lighting",false,function(state)
      local Lighting = cloneref(game:GetService("Lighting"))
      if state then 
         Light1 = Lighting.Brightness
         Light2 = Lighting.ClockTime
         Light3 = Lighting.FogEnd
         Light4 = Lighting.GlobalShadows
         Light5 = Lighting.OutdoorAmbient
            
         Lighting.Brightness = 2
         Lighting.ClockTime = 14
         Lighting.FogEnd = 100000
         Lighting.GlobalShadows = false
         Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
      else
         Lighting.Brightness = Light1
         Lighting.ClockTime = Light2
         Lighting.FogEnd = Light3
         Lighting.GlobalShadows = Light4
         Lighting.OutdoorAmbient = Light5
     end
   end)

Games:Button("Teleport To Smaller Server",function()
local server = "https://games.roblox.com/v1/games/"..PlaceId.."/servers/Public?sortOrder=Asc&limit=100"
local SmallerServer, Next
repeat 
local url = server
if Next then url = url.."&cursor="..Next end
local Servers = game:HttpGet(url,true)
local _Servers = HttpService:JSONDecode(Servers)
if _Servers.data and #_Servers.data > 0 then
for _, v in ipairs(_Servers.data) do
if v.playing < v.maxPlayers then 
if not SmallerServer or v.playing < SmallerServer.playing then
SmallerServer = v
end
end
end
end
Next = _Servers.nextPageCursor
until not Next
if SmallerServer then
discord:Notification("Teleporting","Teleporting to...\n"..PlaceId.."\nJob ID: "..SmallerServer.id,"Okay!")
TeleportService:TeleportToPlaceInstance(PlaceId,SmallerServer.id,game.Players.LocalPlayer)
else
discord:Notification("Error","Server Not Found","Okay...")
end
end)

Games:Button("Teleport To Largest Server",function()
local server = "https://games.roblox.com/v1/games/"..PlaceId.."/servers/Public?sortOrder=Asc&limit=100"
local LargestServer, Next 
repeat 
local url = server 
if Next then url = url.."&cursor="..Next end
local Servers = game:HttpGet(url,true)
local _Servers = HttpService:JSONDecode(Servers)
if _Servers.data and #_Servers.data > 0 then 
for _, v in ipairs(_Servers.data) do
if v.maxPlayers - v.playing > 0 and (not LargestServer or v.playing > LargestServer.playing) then
LargestServer = v
end
end
end
until not Next
if LargestServer then
discord:Notification("Teleporting","Teleporting to...\n"..PlaceId.."\nJob ID: "..LargestServer.id,"Okay!")
TeleportService:TeleportToPlaceInstance(PlaceId,LargestServer.id,game.Players.LocalPlayer)
else
discord:Notification("Error","Server Not Found","Okay...")
end
end)

   Games:Button("Force Close Roblox App",function()
      game:Shutdown()
   end)

   Games:Seperator()

   Games:Button("Copy Teleport To This Game",function()
      setclipboard('game:GetService("TeleportService"):Teleport('..game.PlaceId..',game.Players.LocalPlayer)')
   end)

   Games:Button("Copy Teleport To This Server",function()
      setclipboard('game:GetService("TeleportService"):TeleportToPlaceInstance('..game.PlaceId..',"'..game.JobId..'",game.Players.LocalPlayer)')
   end)

   Games:Seperator()

   Games:Label("Current Game's Place ID:\n" .. game.PlaceId)
   Games:Label("Current Game's Universe ID:\n" .. game.GameId)
   Games:Label("Current Game's Job ID: \n" .. game.JobId)
   local RootPlaceIdLabel = Games:Label("Current Game's RootPlace ID: \nYou haven't received it yet this Id")

   Games:Seperator()

   Games:Button("Get RootPlace Id",function()
      if not RootPlaceId then
         local request = request or http_request or (syn and syn.request) or (http and http.request) or (fluxus and fluxus.request)
         if not request then
            discord:Notification("Error","Your executor don't supported request function","Okay") 
            return 
         end
         local response = request({Url = "https://games.roblox.com/v1/games?universeIds="..game.GameId,Method = "GET"})
         if not response then 
            discord:Notification("Error","Http Error","Okay") 
            return 
         end
         local data = HttpService:JSONDecode(response.Body)
         if not data then 
            discord:Notification("Error","JSONDecode Error","Okay") 
            return 
         end
         RootPlaceId = data and data.data and data.data[1] and data.data[1].rootPlaceId
         if not RootPlaceId then 
            discord:Notification("Error","RootPlaceId is not found","Okay") 
            return 
         end
         if RootPlaceId then 
            RootPlaceIdLabel:Change("Current Game's RootPlace ID: \n"..RootPlaceId) 
         end
         discord:Notification("Success","RootPlaceId Success claimed!","Okay")
      else
         discord:Notification("Error","RootPlaceId always claimed","Okay")
      end
   end)

   Games:Seperator()

   Games:Button("Copy Place Id",function()
      setclipboard(game.PlaceId)
   end)

   Games:Button("Copy Universe Id",function()
      setclipboard(game.GameId)
   end)

   Games:Button("Copy Job Id",function()
      setclipboard(game.JobId)
   end)

   Games:Button("Copy RootPlace Id",function()
      if RootPlaceId then
         setclipboard(RootPlace)
      else
         discord:Notification("Error","You haven't received it yet this Id","Okay")
      end
   end)

   Games:Textbox("You can check game status with id","Enter a game id",false,function(eId)
      task.spawn(function()
         GamesId = tonumber(eId)
         if GamesId then
            local httprequest = request or http_request or (syn and syn.request) or (http and http.request) or (fluxus and fluxus.request)
            if not httprequest then 
               discord:Notification("Error","Your executor doesn't support request or allies functions","Okay.....") 
                return
           end
           local UniGame
           if UniverseCache[GamesId] then
              UniGame = UniverseCache[GamesId]
           else 
              local response = httprequest({Url = "https://apis.roblox.com/universes/v1/places/"..GamesId.."/universe",Method = "GET"})
              if not response then 
                 discord:Notification("Error","Http Error [1]","Okay")
                 return
              end
              local data = HttpService:JSONDecode(response.Body)
              if not data then
                 discord:Notification("Error","JSONDecode Error [1]","Okay")
                  return 
               end
               UniGame = data.universeId
               UniverseCache[GamesId] = UniGame
            end
            if not UniGame then 
               discord:Notification("Error","Universe Id is not found","Okay")
               return
            end
            local response2 = httprequest({Url = "https://games.roblox.com/v1/games?universeIds="..UniGame,Method = "GET"})
            if not response2 then
               discord:Notification("Error","Http Error [2]","Okay") 
               return
            end
            local data2 = HttpService:JSONDecode(response2.Body)
            if not data2 then
               discord:Notification("Error","JSONDecode Error [2]","Okay")
               return 
            end
            local GameData = data2.data and data2.data[1]
            if not GameData then 
               discord:Notification("Error","Data is not found","Okay")
               return 
            end
            if GameData.playing > 3 then 
               Status_Open = "Open" 
            else 
               Status_Open = "Close"
            end
            Status_Online = GameData.playing or "nil"
            local LastUpdate = GameData.updated
            Status_LastUpdate = GameData.updated or "nil"
            local Format = LastUpdate:sub(1,19)
            Status_LastUpdate = Format:gsub("T"," ")
            discord:Notification("Game Status","Status - "..Status_Open.."\nOnline - "..Status_Online.."\nLast Updated: \n"..Status_LastUpdate.." UTC+3","Okay!")
         else
            discord:Notification("Error!","Enter a game id!","Okay!")
         end
      end)
   end)

   Games:Button("Teleport to this game",function()
      if not GamesId then 
         discord:Notification("Error","Enter a Place Id","Okay") 
         return
      end 
     TeleportService:Teleport(GamesId,game.Players.LocalPlayer)
   end)
end

if SettingsWygay["Value Explorer"] then
   local VESection = serv:Channel("Value Explorer")
   VESection:Label("If your threadidentity > 3 level then this section is not available")
   VESection:Label("You can change or with value in value objects")

   local IntValues = {}
   local IntNames = {}
   local BoolValues = {}
   local BoolNames = {}
   local StringValues = {}
   local StringNames = {}
   local NumberValues = {}
   local NumberNames = {}

   getgenv().Wygay_LoopChangeInt = false
   getgenv().Wygay_LoopChangeBoolTrue = false
   getgenv().Wygay_LoopChangeBoolFalse = false
   getgenv().Wygay_LoopChangeString = false
   getgenv().Wygay_LoopChangeNumber = false
   getgenv().Wygay_LoopChangeAllInt = false
   getgenv().Wygay_LoopChangeAllBoolTrue = false
   getgenv().Wygay_LoopChangeAllBoolFalse = false
   getgenv().Wygay_LoopChangeAllString = false
   getgenv().Wygay_LoopChangeAllNumber = false

   task.spawn(function()
      pcall(function()
        for _, v in ipairs(game:GetDescendants()) do
           if v:IsA("IntValue") and not v:IsDescendantOf(cloneref(game:GetService("CoreGui"))) and not v:IsDescendantOf(cloneref(game:GetService("CorePackages"))) and (v:IsDescendantOf(player) or (player.Character and v:IsDescendantOf(player.Character))) then
               table.insert(IntNames,v.Name)
               table.insert(IntValues,v)
            elseif v:IsA("BoolValue") and not v:IsDescendantOf(cloneref(game:GetService("CoreGui"))) and not v:IsDescendantOf(cloneref(game:GetService("CorePackages"))) and (v:IsDescendantOf(player) or (player.Character and v:IsDescendantOf(player.Character))) then
               table.insert(BoolNames,v.Name)
               table.insert(BoolValues,v)
            elseif v:IsA("StringValue") and not v:IsDescendantOf(cloneref(game:GetService("CoreGui"))) and not v:IsDescendantOf(cloneref(game:GetService("CorePackages"))) and v:IsDescendantOf(player) and not Players:GetPlayerFromCharacter(v:FindFirstAncestorOfClass("Model")) then
               table.insert(StringNames,v.Name)
               table.insert(StringValues,v)
            elseif v:IsA("NumberValue") and not v:IsDescendantOf(cloneref(game:GetService("CoreGui"))) and not v:IsDescendantOf(cloneref(game:GetService("CorePackages"))) and v:IsDescendantOf(player) and not Players:GetPlayerFromCharacter(v:FindFirstAncestorOfClass("Model")) then
               table.insert(NumberNames,v.Name)
               table.insert(NumberValues,v)
            end
         end
      end)
   end)

   VESection:Dropdown("Select IntValue object", IntNames, function(_NewIntObj)
      local ndx = table.find(IntNames, _NewIntObj)
      getgenv().Wygay_YourIntValue = IntValues[ndx]
   end)

   VESection:Textbox("Enter a new value in IntValue", "Enter a number", false, function(NewIntValue)
      local Int_Value = tonumber(NewIntValue)
      if not Int_Value then
         discord:Notification("Error", "Enter a number", "Okay")
         return 
      end
      getgenv().Wygay_ValueInt = Int_Value
   end)

   VESection:Button("Check current value in IntValue", function() 
      if not getgenv().Wygay_YourIntValue then 
         discord:Notification("Error", "Select a IntValue", "Okay")
         return
      end
      discord:Notification("Success", "Current value in this IntValue is '"..tostring(getgenv().Wygay_YourIntValue.Value).."'", "Okay")
   end)

   VESection:Button("Change Value In This IntValue", function()
      if not getgenv().Wygay_ValueInt then 
         discord:Notification("Error", "Enter a new value for IntValue", "Okay")
         return
      end
      if not getgenv().Wygay_YourIntValue then 
         discord:Notification("Error", "Select IntValue object", "Okay")
         return
      end
      getgenv().Wygay_YourIntValue.Value = getgenv().Wygay_ValueInt
      discord:Notification("Success", "Success change Value in IntValue object", "Okay")
   end)

   VESection:Button("Change Value In All IntValues", function()
      if not getgenv().Wygay_ValueInt then 
         discord:Notification("Error", "Enter a new value for IntValue", "Okay")
         return
      end
      for _, v in pairs(IntValues) do
         v.Value = getgenv().Wygay_ValueInt
      end
      discord:Notification("Success", "Success Change Values In all IntValue objects", "Okay")
   end)

   VESection:Toggle("Loop Change This Int Value", false, function(state)
      getgenv().Wygay_LoopChangeInt = state
      if not getgenv().Wygay_ValueInt then 
         discord:Notification("Error", "Enter a new value for IntValue", "Okay")
         return
      end
      if not getgenv().Wygay_YourIntValue then 
         discord:Notification("Error", "Select IntValue object", "Okay")
         return
      end
      while getgenv().Wygay_LoopChangeInt and task.wait() do
         getgenv().Wygay_YourIntValue.Value = getgenv().Wygay_ValueInt
      end
   end)

   VESection:Toggle("Loop Change All Int Values", false, function(state)
      getgenv().Wygay_LoopChangeAllInt = state
      if not getgenv().Wygay_ValueInt then 
         discord:Notification("Error", "Enter a new value for IntValue", "Okay")
         return
      end
      while getgenv().Wygay_LoopChangeAllInt and task.wait() do
         for _, v in pairs(IntValues) do
            v.Value = getgenv().Wygay_ValueInt
         end
      end
   end)

   VESection:Seperator()

   VESection:Dropdown("Select Bool Value object", BoolNames, function(BoolValue)
      local ndx = table.find(BoolNames, BoolValue)
      getgenv().Wygay_YourBoolValue = BoolValues[ndx]
   end)

   VESection:Button("Check current value in BoolValue", function()
      local _cCheck 
      if not getgenv().Wygay_YourBoolValue then 
         discord:Notification("Error", "Select a BoolValue", "Okay")
         return
      end
      discord:Notification("Success", "Current value in this BoolValue is '"..tostring(getgenv().Wygay_YourBoolValue.Value).."'", "Okay")
   end)

   VESection:Button("Change Value in BoolValue to true", function()
      if not getgenv().Wygay_YourBoolValue then 
         discord:Notification("Error", "Select BoolValue", "Okay")
         return
      end
      getgenv().Wygay_YourBoolValue.Value = true
      discord:Notification("Success", "Success Change BoolValue to true", "Okay")
   end)

   VESection:Button("Change Value in BoolValue to false", function()
      if not getgenv().Wygay_YourBoolValue then 
         discord:Notification("Error", "Select BoolValue", "Okay")
         return
      end
      getgenv().Wygay_YourBoolValue.Value = false
      discord:Notification("Success", "Success Change BoolValue to false", "Okay")
   end)

   VESection:Button("Change Value in All BoolValues to true", function()
      for _, v in pairs(BoolValues) do
         v.Value = true
       end
      discord:Notification("Success", "Success change All BoolValues to true", "Okay")
   end)

   VESection:Button("Change Value in All BoolValues to false", function()
      for _, v in pairs(BoolValues) do
         v.Value = false
      end
      discord:Notification("Success", "Success change All BoolValues to false", "Okay")
   end)

   VESection:Toggle("Loop Change This BoolValue To True", false, function(state)
      getgenv().Wygay_LoopChangeBoolTrue = state
      if not getgenv().Wygay_YourBoolValue then 
         discord:Notification("Error", "Select BoolValue", "Okay")
         return
      end
      while getgenv().Wygay_LoopChangeBoolTrue and task.wait() do
         getgenv().Wygay_YourBoolValue.Value = true
      end
   end)

   VESection:Toggle("Loop Change This BoolValue To False", false, function(state)
      getgenv().Wygay_LoopChangeBoolFalse = state
      if not getgenv().Wygay_YourBoolValue then 
         discord:Notification("Error", "Select BoolValue", "Okay")
         return
      end
      while getgenv().Wygay_LoopChangeBoolFalse and task.wait() do
         getgenv().Wygay_YourBoolValue.Value = false
      end
   end)

   VESection:Toggle("Loop Change All BoolValues To True", false, function(state)
      getgenv().Wygay_LoopChangeAllBoolTrue = state
      while getgenv().Wygay_LoopChangeAllBoolTrue and task.wait() do
         for _, v in pairs(BoolValues) do
            getgenv().Wygay_YourBoolValue.Value = true
         end
      end
   end)

   VESection:Toggle("Loop Change All BoolValues To False", false, function(state)
      getgenv().Wygay_LoopChangeAllBoolFalse = state
      while getgenv().Wygay_LoopChangeAllBoolFalse and task.wait() do
         for _, v in pairs(BoolValues) do
            getgenv().Wygay_YourBoolValue.Value = false
         end
      end
   end)

   VESection:Seperator()

   VESection:Dropdown("Select StringValue object", StringNames, function(StringValue)
      local ndx = table.find(StringNames, StringValue)
      getgenv().Wygay_YourStringValue = StringValues[ndx]
   end)

   VESection:Textbox("Enter a new Value In StringValue", "Enter a string", false, function(NewST)
      getgenv().Wygay_NewString = tostring(NewST)
   end)

   VESection:Button("Check current value in StringValue", function()
      if not getgenv().Wygay_YourStringValue then 
         discord:Notification("Error", "Select a StringValue", "Okay")
         return
      end
      discord:Notification("Success", "Current value in this StringValue is '"..getgenv().Wygay_YourStringValue.Value.."'", "Okay")
   end)

   VESection:Button("Change Value In This StringValue", function()
      if not getgenv().Wygay_YourStringValue then 
         discord:Notification("Error", "Select a StringValue", "Okay")
         return
      end
      if not getgenv().Wygay_NewString then 
         discord:Notification("Error", "Select a new Value In String Value", "Okay")
         return
      end
      getgenv().Wygay_YourStringValue.Value = getgenv().Wygay_NewString
      discord:Notification("Success", "Success change Value In StringValue", "Okay")
   end)

   VESection:Button("Change Value In All StringValues", function()
      if not getgenv().Wygay_NewString then 
         discord:Notification("Error", "Select a new Value In String Value", "Okay")
         return
      end
      for _, v in pairs(StringValues) do
         v.Value = getgenv().Wygay_NewString
      end
      discord:Notification("Success", "Success change Value In All StringValues", "Okay")
   end)
   
   VESection:Toggle("Loop Change Value In This StringValue Object", false, function(state)
      getgenv().Wygay_LoopChangeString = state
      if not getgenv().Wygay_YourStringValue then 
         discord:Notification("Error", "Select StringValue", "Okay")
         return
      end
      if not getgenv().Wygay_NewString then 
         discord:Notification("Error", "Select a new Value In StringValue", "Okay")
         return
      end
      while getgenv().Wygay_LoopChangeString and task.wait() do
         getgenv().Wygay_YourStringValue.Value = getgenv().Wygay_NewString 
      end
   end)
   
   VESection:Toggle("Loop Change Value In All StringValue Objects", false, function(state)
      getgenv().Wygay_LoopChangeAllString = state
      if not getgenv().Wygay_NewString then 
         discord:Notification("Error", "Select a new Value In StringValues", "Okay")
         return
      end
      while getgenv().Wygay_LoopChangeAllString and task.wait() do
         for _, v in pairs(StringValues) do
            v.Value = getgenv().Wygay_NewString 
         end
      end
   end)

   VESection:Seperator()

   VESection:Dropdown("Select NumberValue object", NumberNames, function(NumberValue)
      local ndx = table.find(NumberNames, NumberValue)
      getgenv().Wygay_YourNumberValue = NumberValues[ndx]
   end)

   VESection:Textbox("Select a new Value In NumberValue", "Enter a number", false, function(New_Int)
      local Test_Int = tonumber(New_Int)
      if not Test_Int then 
         discord:Notification("Error", "Enter a number", "Okay")
         return
      end
      getgenv().Wygay_NewNValue = Test_Int
   end)

   VESection:Button("Check current value in NumberValue", function()
      if not getgenv().Wygay_YourNumberValue then 
         discord:Notification("Error", "Select a NumberValue", "Okay")
         return
      end
      discord:Notification("Success", "Current value in this NumberValue is '"..getgenv().Wygay_YourNumberValue.Value.."'", "Okay")
   end)

   VESection:Button("Change Value In NumberValue", function()
      if not getgenv().Wygay_YourNumberValue then 
         discord:Notification("Error", "Select a NumberValue", "Okay")
         return
      end
      if not getgenv().Wygay_NewNValue then 
         discord:Notification("Error", "Enter a new Value In NumberValue", "Okay")
         return
      end
      getgenv().Wygay_YourNumberValue.Value = getgenv().Wygay_NewNValue
      discord:Notification("Success", "Success change Value In NumberValue", "Okay")
   end)

   VESection:Button("Change Values In All NumberValues", function()
      if not getgenv().Wygay_NewNValue then 
         discord:Notification("Error", "Enter a new Value In NumberValue", "Okay")
         return
      end
      for _, v in pairs(NumberValues) do
         v.Value = getgenv().Wygay_NewNValue 
      end
      discord:Notification("Success", "Success change Value In All NumberValues", "Okay")
   end)
   
   VESection:Toggle("Loop Change Value In This NumberValue Object", false, function(state)
      getgenv().Wygay_LoopChangeNumber = state
      if not getgenv().Wygay_NewNValue then 
         discord:Notification("Error", "Select NumberValue", "Okay")
         return
      end
      if not getgenv().Wygay_NewNValue then 
         discord:Notification("Error", "Select a new Value In NumberValue", "Okay")
         return
      end
      while getgenv().Wygay_LoopChangeNumber and task.wait() do
         getgenv().Wygay_YourNumberValue.Value = getgenv().Wygay_NewNValue
      end
   end)
   
   VESection:Toggle("Loop Change Value In All NumberValue Objects", false, function(state)
      getgenv().Wygay_LoopChangeAllNumber = state
      if not getgenv().Wygay_NewNValue then 
         discord:Notification("Error", "Select a new Value In NumberValues", "Okay")
         return
      end
      while getgenv().Wygay_LoopChangeAllNumber and task.wait() do
         for _, v in pairs(NumberValues) do
            v.Value = getgenv().Wygay_NewNValue
         end
      end
   end)
end

local _GTable1 = {}
local _GTable2 = {}
local Shared_Table1 = {}
local Shared_Table2 = {}
local Getgenv_Table1 = {}
local Getgenv_Table2 = {}

if SettingsWygay["ENV Explorer"] then 
local ENSection = serv:Channel("ENV Explorer")

for i, v in pairs(_G) do
if not string.find(tostring(i), "Wygay_") and type(v) ~= "function" and type(v) ~= "table" then
table.insert(_GTable1, v)
table.insert(_GTable2, tostring(i))
end
end

for i, v in pairs(shared) do
if not string.find(tostring(i), "Wygay_") and type(v) ~= "function" and type(v) ~= "table" then
table.insert(Shared_Table1, v)
table.insert(Shared_Table2, tostring(i))
end
end

if type(getgenv) == "function" and not Fake then
for i, v in pairs(getgenv()) do
if not string.find(tostring(i), "Wygay_") and type(v) ~= "function" and type(v) ~= "table" then
table.insert(Getgenv_Table1, v)
table.insert(Getgenv_Table2, tostring(i))
end
end
end

getgenv().Wygay_Your_G = nil 
getgenv().Wygay_New_G = nil
getgenv().Wygay_Your_Shared = nil
getgenv().Wygay_New_Shared  = nil
getgenv().Wygay_Your_Getgenv = nil
getgenv().Wygay_New_Getgenv  = nil

ENSection:Dropdown("Select _G object", _GTable2, function(Y_G)
getgenv().Wygay_Your_G = Y_G
end)

ENSection:Textbox("Enter a New Value In _G Object", "New Value", false, function(New_G_Value)
getgenv().Wygay_New_G = New_G_Value
end)

ENSection:Button("Check Value In This _G Object", function()
if getgenv().Wygay_Your_G then 
discord:Notification("Success", "Value in This _G object is '"..tostring(_G[getgenv().Wygay_Your_G]).."'", "Okay")
else
discord:Notification("Error", "Select _G object", "Okay")
end
end)

ENSection:Button("Change Value In This _G Object", function()
if not getgenv().Wygay_Your_G then 
discord:Notification("Error", "Select _G Object", "Okay")
return
end
if not getgenv().Wygay_New_G then 
discord:Notification("Error", "Enter a new value In _G Object", "Okay")
return
end
_G[getgenv().Wygay_Your_G] = getgenv().Wygay_New_G
discord:Notification("Success", "Success change Value In _G Object", "Okay")
end)

ENSection:Button("Change Value In All _G Objects", function()
if not getgenv().Wygay_New_G then 
discord:Notification("Error", "Enter a new value In _G Objects", "Okay")
return
end
for _, v in pairs(_GTable2) do
_G[v] = getgenv().Wygay_New_G
end
discord:Notification("Success", "Success change Value In All _G Objects", "Okay")
end)

ENSection:Seperator()

ENSection:Dropdown("Select shared object", Shared_Table2, function(Y_S)
getgenv().Wygay_Your_Shared = Y_S
end)

ENSection:Textbox("Enter a new Value In shared Object", "New Value", false, function(N_V)
getgenv().Wygay_New_Shared = N_V
end)

ENSection:Button("Check Value In This shared Object", function()
if getgenv().Wygay_Your_Shared then 
discord:Notification("Success", "Value in This shared object is '"..tostring(shared[getgenv().Wygay_Your_Shared]).."'", "Okay")
else
discord:Notification("Error", "Select shared object", "Okay")
end
end)

ENSection:Button("Change Value In This shared Object", function()
if not getgenv().Wygay_Your_Shared then 
discord:Notification("Error", "Select shared Object", "Okay")
return
end
if not getgenv().Wygay_New_Shared then 
discord:Notification("Error", "Enter a new value In shared object", "Okay")
return
end
shared[getgenv().Wygay_Your_Shared] = getgenv().Wygay_New_Shared
discord:Notification("Success", "Success change Value In shared Object", "Okay")
end)

ENSection:Button("Change Value In All shared Objects", function()
if not getgenv().Wygay_New_Shared then 
discord:Notification("Error", "Enter a new value In shared Objects", "Okay")
return
end
for _, v in pairs(Shared_Table2) do
shared[v] = getgenv().Wygay_New_Shared
end
discord:Notification("Success", "Success change Value In All shared Objects", "Okay")
end)

ENSection:Seperator()

ENSection:Label("getgenv does not exist in roblox studio!")

if not Fake and type(getgenv) == "function" then
ENSection:Dropdown("Select getgenv object", Getgenv_Table2, function(Y_GN)
getgenv().Wygay_Your_Getgenv = Y_GN
end)

ENSection:Textbox("Enter a new Value In getgenv Object", "New Value", false, function(N_GT)
getgenv().Wygay_New_Getgenv = N_GT
end)

ENSection:Button("Check Value In getgenv object", function()
if not getgenv().Wygay_Your_Getgenv then 
discord:Notification("Error", "Select getgenv object", "Okay")
return
end
discord:Notification("Success", "Value in This getgenv object is '"..tostring(getgenv()[getgenv().Wygay_Your_Getgenv]).."'", "Okay")
end)

ENSection:Button("Change Value In This getgenv Object", function()
if not getgenv().Wygay_Your_Getgenv then 
discord:Notification("Error", "Select getgenv Object", "Okay")
return
end
if not getgenv().Wygay_New_Getgenv  then 
discord:Notification("Error", "Enter a new value In getgenv object", "Okay")
return
end
getgenv()[getgenv().Wygay_Your_Getgenv] = getgenv().Wygay_New_Getgenv
discord:Notification("Success", "Success change Value In getgenv Object", "Okay")
end)

ENSection:Button("Change Value In All getgenv Objects", function()
if not getgenv().Wygay_New_Getgenv then 
discord:Notification("Error", "Enter a new value In getgenv Objects", "Okay")
return
end
for _, v in pairs(Getgenv_Table2) do
getgenv()[v] = getgenv().Wygay_New_Getgenv
end
discord:Notification("Success", "Success change Value In All getgenv Objects", "Okay")
end)

else
ENSection:Label("Your executor doesn't support getgenv function")
end

end

if SettingsWygay["Players"] then
local players = serv:Channel("Players")

players:Label("\nUses SetLocalPlayerInfo() to change your info!")

players:Textbox("Spoof as player with User ID (Client)","Enter your new User ID...",false,function(pid)
local NewId = tonumber(pid)
if NewId then 
local name = Players:GetNameFromUserIdAsync(NewId)
discord:Notification("Success","You are now "..name.." ("..NewId..")","Okay!")
Players:SetLocalPlayerInfo(NewId,name,name,Enum.MembershipType.Premium,false)
else 
discord:Notification("Error","Enter a number!","Okay!")
end
end)

players:Button("Spoof yourself as the Game Owner",function()
local name = Players:GetNameFromUserIdAsync(tonumber(game.CreatorId))
discord:Notification("Success","You are now "..name.." ("..tostring(game.CreatorId)..")","Okay!")
Players:SetLocalPlayerInfo(game.CreatorId,name,name,Enum.MembershipType.Premium,false)
end)

players:Seperator()

spawn(function()
while task.wait(0.5) do
for _, v in pairs(game.Players:GetPlayers()) do
if v ~= player and v.Character then
if getgenv().Wygay_AutoHidePlayers then
if not HidePlayers[v] then
HidePlayers[v] = v.Character.Parent
end
v.Character.Parent = nil
else
if HidePlayers[v] and v.Character.Parent == nil then
v.Character.Parent = HidePlayers[v]
end
end
end
end
end
end)

players:Toggle("Auto Hide Other Players", false, function(state)
getgenv().Wygay_AutoHidePlayers = state
end)

local GuiToggle = {}
players:Toggle("Show Hidden GUIs of LocalPlayer",false,function(state)
if state then
GuiToggle = {}
for _, v in ipairs(player.PlayerGui:GetDescendants()) do
if (v:IsA("Frame") or v:IsA("TextButton") or v:IsA("ImageButton") or v:IsA("ScrollingFrame")) and not v.Visible then
v.Visible = true
table.insert(GuiToggle,v)
end
end
else 
for _, v in pairs(GuiToggle) do
v.Visible = false
end
GuiToggle = {}
end
end)

players:Toggle("Anti AFK",false,function(state)
if state then
local VirtualUser  = cloneref(game:GetService("VirtualUser"))
Conn_1 = Players.LocalPlayer.Idled:Connect(function() 
VirtualUser:CaptureController()
VirtualUser:ClickButton2(Vector2.new())
end)
else
Conn_1:Disconnect()
end
end)
players:Seperator()

players:Textbox("You can check player with UserId","Enter a UserId",false,function(P_ID)
local PlayersId = tonumber(P_ID)
if PlayersId then
local httprequest = request or http_request or (syn and syn.request) or (http and http.request) or (fluxus and fluxus.request)
if not httprequest then discord:Notification("Error","Your Executor doesn't support request function","Okay") return end
local response1,response2,response3
task.spawn(function()
pcall(function()
response1 = httprequest({Url = "https://users.roblox.com/v1/users/"..PlayersId,Method = "GET"})
response2 = httprequest({Url = "https://friends.roblox.com/v1/users/"..PlayersId.."/followers/count",Method = "GET"})
response3 = httprequest({Url = "https://presence.roblox.com/v1/presence/users",Method = "POST",Headers = {["Content-Type"] = "application/json"},Body = HttpService:JSONEncode({userIds = {PlayersId}})})
end)
end)
local U_D = HttpService:JSONDecode(response1.Body)
local F_D = HttpService:JSONDecode(response2.Body)
local P_D = HttpService:JSONDecode(response3.Body)
local OnlineStatus= {[0] = "Offline",[1] = "Online",[2] = "In Game",[3] = "Studio"}
discord:Notification("Success","Name: "..U_D.name.."\nFallowers: "..F_D.count.."\nOnline Status: "..OnlineStatus[P_D.userPresences[1].userPresenceType],"Okay")
else
discord:Notification("Error","Enter a number!","Okay")
end
end)

players:Seperator()

players:Textbox("You can check badge with badge id","Enter a badge id",false,function(B_Id)
local BadgeId = tonumber(B_Id) 
if BadgeId then
local httprequest = request or http_request or (syn and syn.request) or (http and http.request) or (fluxus and fluxus.request)
if not httprequest then discord:Notification("Error","Your Executor doesn't support request function","Okay") return end
local response = httprequest({Url = "https://badges.roblox.com/v1/badges/"..BadgeId,Method = "GET",Headers = {["Content-Type"] = "application/json"}})
if not response then discord:Notification("Error","Http Request Error","Okay") return end
local data = HttpService:JSONDecode(response.Body)
if not data then discord:Notification("Error","JSONDecode error","Okay") return end
discord:Notification("Success","Name: "..data.name.."\nCreated: "..data.created:gsub("T"," "):gsub("%.%d+",""):gsub("%+%d+:%d+","").." UTC".."\nUpdated: "..data.updated:gsub("T"," "):gsub("%.%d+",""):gsub("%+%d+:%d+","").." UTC".."\nAwarded: "..data.statistics.awardedCount,"Okay")
else
discord:Notification("Error","Enter a number!","Okay")
end
end)

players:Seperator()
players:Button("Create Waypoint at Current Position",function()
if getgenv().Wygay_Ticket then if not player.Character:FindFirstChild("HumanoidRootPart")  then discord:Notification("Error","HumanoidRootPart  is not found","Okay!") return end getgenv().Wygay_HumPosition = player.Character.HumanoidRootPart.Position discord:Notification("Success","Create Waypoint as "..tostring(getgenv().Wygay_HumPosition),"Okay!") return end
if not player.Character:FindFirstChild("HumanoidRootPart")  then discord:Notification("Error","HumanoidRootPart  is not found","Okay!") return end
getgenv().Wygay_HumPosition = player.Character.HumanoidRootPart.Position 
discord:Notification("Success","Create Waypoint as "..tostring(getgenv().Wygay_HumPosition),"Okay!")
players:Button("Teleport to Saved Waypoint",function() if getgenv().Wygay_HumPosition then game.Players.LocalPlayer.Character:PivotTo(CFrame.new(getgenv().Wygay_HumPosition)) else discord:Notification("Error","No Waypoint  Found!","Okay") end end)
players:Button("Tween to Saved Waypoint",function() if getgenv().Wygay_HumPosition then local hum = game.Players.LocalPlayer.Character.HumanoidRootPart while (getgenv().Wygay_HumPosition-hum.Position).Magnitude > 0.1 do hum.CFrame = hum.CFrame:Lerp(CFrame.new(getgenv().Wygay_HumPosition),math.min(35 * task.wait() / (getgenv().Wygay_HumPosition-hum.Position).Magnitude,1)) end else discord:Notification("Error","No Waypoint Found!","Okay") end end)
players:Button("Move to Saved Waypoint",function() if getgenv().Wygay_HumPosition then player.Character.Humanoid:MoveTo(getgenv().Wygay_HumPosition) else discord:Notification("Error","No Waypoint  Found!","Okay") end end)
players:Button("Clear Waypoint",function() getgenv().Wygay_HumPosition = false discord:Notification("Success","Waypoint  is cleared","Okay!") end)
players:Button("Copy Waypoint Position",function() if not getgenv().Wygay_HumPosition then discord:Notification("Error","No Waypoint found","Okay!") return end setclipboard(tostring(getgenv().Wygay_HumPosition)) end)
getgenv().Wygay_Ticket = true
end)

end

if SettingsWygay["Player"] then
local PlayerSection = serv:Channel("Player")
PlayerSection:Label("Same as in the Players section, but only for you")
PlayerSection:Seperator()
PlayerSection:Label("You can change the basic attributes of the character.")

local function GetHum()
local character = player.Character
if not character then return nil end 
return character:FindFirstChildOfClass("Humanoid")
end

local SpeedSlider = PlayerSection:Slider("Player Speed",0,300,(GetHum() and GetHum().WalkSpeed) or 0,function(PlayerSpeed)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = PlayerSpeed
end)

local JumpSlider = PlayerSection:Slider("Player Jump Power",0,300,(GetHum() and (GetHum().UseJumpPower and GetHum().JumpPower or GetHum().JumpHeight)) or 0,function(PlayerJumpPower)
if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").UseJumpPower then
game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").JumpPower = PlayerJumpPower
else
game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").JumpHeight = PlayerJumpPower
end
end)

local GravitySlider = PlayerSection:Slider("Player Gravity",0,300,workspace.Gravity or 0,function(PlayerGravity)
workspace.Gravity = PlayerGravity
end)

PlayerSection:Button("Fast Settings",function()
SpeedSlider:Change(95)
JumpSlider:Change(GetHum().UseJumpPower and 60 or 40)
GravitySlider:Change(45)
end)

PlayerSection:Button("Basic Settings",function()
SpeedSlider:Change(16)
JumpSlider:Change(GetHum().UseJumpPower and 50 or 7.2)
GravitySlider:Change(196.2)
end)

PlayerSection:Seperator()

local tpwalking
local tpjumping

PlayerSection:Slider("Player Teleport Walk",0,50,0,function(speed)
if tpwalking then tpwalking:Disconnect() end
if speed == 0 then return end
local humanoid = GetHum()
if not humanoid then return end
tpwalking = RunService.Heartbeat:Connect(function(delta)
if humanoid.Parent and humanoid.MoveDirection.Magnitude > 0 then
humanoid.Parent:TranslateBy(humanoid.MoveDirection * speed * delta * 10)
end
end)
end)

PlayerSection:Slider("Player Teleport Jump",0,50,0,function(boost)
if tpjumping then tpjumping:Disconnect() end
if boost == 0 then return end
local humanoid = GetHum()
if not humanoid then return end
tpjumping = RunService.Heartbeat:Connect(function(delta)
if humanoid.Parent then
local root = humanoid.Parent:FindFirstChild("HumanoidRootPart")
if root then
local state = humanoid:GetState()
if state == Enum.HumanoidStateType.Jumping or state == Enum.HumanoidStateType.Freefall then
root.CFrame=root.CFrame + Vector3.new(0,boost * delta * 10,0)
end
end
end
end)
end)

PlayerSection:Seperator()

PlayerSection:Label("Current UserId:\n" .. LocalUserId)
PlayerSection:Label("Current Account Age:\n" .. LocalAge .. " days")

pcall(function()
PlayerSection:Label("Current Roblox Hwid:\n" .. cloneref(game:GetService("RbxAnalyticsService")):GetClientId())
end)

if type(gethwid) == "function" then
pcall(function() local _Hwid = gethwid() if #_Hwid > 58 then _Hwid = _Hwid:sub(1,58).."\n".._Hwid:sub(59) end PlayerSection:Label("Current Hwid:\n" .. _Hwid) end)
elseif type(get_hwid) == "function" then
pcall(function() local _Hwid = get_hwid() if #_Hwid > 58 then _Hwid = _Hwid:sub(1,58).."\n".._Hwid:sub(59) end PlayerSection:Label("Current Hwid:\n" .. _Hwid) end)
else
pcall(function() PlayerSection:Label("Current Hwid:\nYour Executor doesn't support gethwid or get_hwid function") end)
end

PlayerSection:Seperator()

PlayerSection:Button("Copy UserId",function()
setclipboard(LocalUserId)
end)

PlayerSection:Button("Copy Account Age",function()
setclipboard(LocalAge.." days")
end)

PlayerSection:Button("Copy Roblox Hwid",function()
pcall(function()
setclipboard(cloneref(game:GetService("RbxAnalyticsService")):GetClientId())
end)
end)

PlayerSection:Button("Copy Hwid",function()
pcall(function()
if type(gethwid) == "function" then
setclipboard(gethwid())
elseif type(get_hwid) == "function" then
setclipboard(get_hwid())
else
discord:Notification("Error","Your Executor doesn't support gethwid or get_hwid function","Okay")
end
end)
end)

PlayerSection:Seperator()

PlayerSection:Button("Copy Player Coordinates",function()
local pos
local char = player.Character
local hum = char and player.Character:FindFirstChild("HumanoidRootPart")
if hum then
pos = hum.position
local copy  = string.format("%f, %f, %f", pos.X, pos.Y, pos.Z)
setclipboard(tostring(copy))
else
local camera = workspace.Camera
if not camera then return end
pos = camera.Focus.Position
local copy  = string.format("%f, %f, %f", pos.X, pos.Y - 1.5, pos.Z)
setclipboard(tostring(copy))
end
end)

PlayerSection:Button("Copy Teleport Script",function()
local pos
local char = player.Character
local hum = char and player.Character:FindFirstChild("HumanoidRootPart")
if char and hum then
pos = hum.position
local copy = string.format("game.Players.LocalPlayer.Character:PivotTo(CFrame.new(Vector3.new(%f, %f, %f)))", pos.X, pos.Y, pos.Z)
setclipboard(tostring(copy))
else
local camera = workspace.Camera
if not camera then return end
pos = camera.Focus.Position
local copy = string.format("game.Players.LocalPlayer.Character:PivotTo(CFrame.new(Vector3.new(%f, %f, %f)))", pos.X, pos.Y - 1.5, pos.Z)
setclipboard(tostring(copy))
end
end)

PlayerSection:Button("Copy Tween Script",function()
local pos
local char = player.Character
local hum = char and player.Character:FindFirstChild("HumanoidRootPart")
if char and hum then
pos = hum.position
local copy = string.format([[local tweenInfo = TweenInfo.new(2)
local goal = {CFrame = CFrame.new(%f, %f, %f)}
local tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, tweenInfo, goal)
tween:Play()]], pos.X, pos.Y, pos.Z)
setclipboard(tostring(copy))
else
local camera = workspace.Camera
if not camera then return end
pos = camera.Focus.Position
local copy = string.format([[local tweenInfo = TweenInfo.new(2)
local goal = {CFrame = CFrame.new(%f, %f, %f)}
local tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, tweenInfo, goal)
tween:Play()]], pos.X, pos.Y - 1.5, pos.Z)
setclipboard(tostring(copy))
end
end)

PlayerSection:Button("Copy MoveTo Script",function()
local pos
local char = player.Character
local hum = char and player.Character:FindFirstChild("HumanoidRootPart")
if char and hum then
pos = hum.position
local copy = string.format([[local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
local position = "%f, %f, %f"
local humanoid = game.Players.LocalPlayer.Character.Humanoid
humanoid.WalkSpeed = 16
humanoid.JumpPower = 19
humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
humanoid:MoveTo(position)]], pos.X, pos.Y, pos.Z)
setclipboard(tostring(copy))
else
local camera = workspace.Camera
if not camera then return end
pos = camera.Focus.Position
local copy = string.format([[local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
local position = "%f, %f, %f"
local humanoid = game.Players.LocalPlayer.Character.Humanoid
humanoid.WalkSpeed = 16
humanoid.JumpPower = 19
humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
humanoid:MoveTo(position)]], pos.X, pos.Y - 1.5, pos.Z)
setclipboard(tostring(copy))
end
end)

PlayerSection:Button("Copy Lerp Script",function()
local pos
local char = player.Character
local hum = char and player.Character:FindFirstChild("HumanoidRootPart")
if char and hum then
pos = hum.position
local copy  = string.format([[local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
local goal = CFrame.new(%f, %f, %f)
for i = 0, 1, 0.05 do
hrp.CFrame = hrp.CFrame:Lerp(goal, i)
task.wait()
end]], pos.X, pos.Y, pos.Z)
setclipboard(tostring(copy))
else
local camera = workspace.Camera
if not camera then return end
pos = camera.Focus.Position
local copy  = string.format([[local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
local goal = CFrame.new(%f, %f, %f)
for i = 0, 1, 0.05 do
hrp.CFrame = hrp.CFrame:Lerp(goal, i)
task.wait()
end]], pos.X, pos.Y - 1.5, pos.Z)
setclipboard(tostring(copy))
end
end)

end

if SettingsWygay["Network"] then
   local Network = serv:Channel("Network")
   Network:Label("\nThis can bypass rate limits when firing remotes!")

   Network:Textbox("KBPS Limit ","Type a big number to have no limit...",true ,function(limit1) 
      local limit2 = tonumber(limit1)
      if limit2 then 
         cloneref(game:GetService("NetworkClient")):SetOutgoingKBPSLimit(limit2)
         discord:Notification("Success!","KBPS Limit has been set to "..tostring(limit2), "Okay!")
      else
         discord:Notification("Hold up!","KBPS Limit must be a number.","Okay!")
      end
   end)

   Network:Textbox("FPS Limit","Type a big number to have no limit...",true,function(FPS)
      local limit3 = tonumber(FPS)
      if limit3 then
        pcall(function()
           if type(setfpscap) == "function" then
              setfpscap(limit3)
           elseif type(set_fps_cap) == "function" then
              set_fps_cap(limit3)
           elseif not type(setfpscap) == "function" and not type(set_fps_cap) == "function" then
              setfflag("TaskSchedulerTargetFps",limit3)
           end 
        end)
        discord:Notification("Success!","FPS Limit has been set to "..tostring(limit3), "Okay!")
      else
         discord:Notification("Hold up!","FPS Limit must be a number.","Okay!")
      end
   end)

   Network:Button("Check FPS",function()
      local Stats = cloneref(game:GetService("Stats"))
      local FrameRateManager = Stats and Stats:FindFirstChild("FrameRateManager")
      local RenderAverage = FrameRateManager and FrameRateManager:FindFirstChild("RenderAverage")
      discord:Notification("Your FPS","Your FPS is "..1000 / RenderAverage:GetValue(),"Okay!")
   end)

   Network:Button("Increase voice chat range",function()
      pcall(function()
         setfflag("VoiceChatRollOffMaxDistance", "999999999999999")
         setfflag("VoiceChatRollOffMinDistance", "999999999999999")
         setfflag("DebugVoiceChatVariableRollOff", "False")
      end)
      discord:Notification("Success!","Success Increase voice chat range","Okay!")
   end)

   Network:Seperator()
   Network:Label("Simulates lag/delay from client -> server.")

   Network:Dropdown("Delay Intensiveness",{
      "Normal",
       "Mild",
       "Medium",
       "Severe",
  	 "Hard",
       "Very Hard", 
       "Mega Hard",
       "No Connection"
       },function(Level)
       getgenv().Wygay_LevelConnect = Level
   end)

   Network:Button("Apply Settings",function()
      local NetworkSettings = settings().Network
      if getgenv().Wygay_LevelConnect then
         if getgenv().Wygay_LevelConnect == "Normal" then
            NetworkSettings.IncomingReplicationLag = 0
         elseif getgenv().Wygay_LevelConnect == "Mild" then 
            NetworkSettings.IncomingReplicationLag = 1
         elseif getgenv().Wygay_LevelConnect == "Medium" then
            NetworkSettings.IncomingReplicationLag = 2
         elseif getgenv().Wygay_LevelConnect == "Severe" then
            NetworkSettings.IncomingReplicationLag = 3
         elseif getgenv().Wygay_LevelConnect == "Hard" then 
            NetworkSettings.IncomingReplicationLag = 5
         elseif getgenv().Wygay_LevelConnect == "Very Hard" then
            NetworkSettings.IncomingReplicationLag = 7
         elseif getgenv().Wygay_LevelConnect == "Mega Hard" then
            NetworkSettings.IncomingReplicationLag = 9
         elseif getgenv().Wygay_LevelConnect == "No Connection" then
            NetworkSettings.IncomingReplicationLag = 10
         end
         discord:Notification("Success!","Success Settings Applied","Okay!")
      else
        discord:Notification("Error","Select Connection Level","Okay!")
      end
   end)

   Network:Button("Show Average Client -> Server Ping",function()
      discord:Notification("Average Ping",math.round(Players.LocalPlayer:GetNetworkPing() * 1000).."ms","Okay!")
   end)

   Network:Seperator()

   local ipLabel = Network:Label("Your IP:\nYou need to get Ip data")
   local PosLabel = Network:Label("Your IP Coordinates:\nYou need to get Ip data")

   local MyIp = nil
   local MyCoordinates = nil

   Network:Button("Get IP Data",function()
      local httprequest = request or http_request or (syn and syn.request) or (http and http.request) or (fluxus and fluxus.request)
      if not httprequest then 
        discord:Notification("Error","Your executor don't support request","Okay...") 
        return 
     end
     local response = httprequest({Url = "http://ip-api.com/json/?fields=query,lat,lon",Method = "GET"})
     if not response then 
        discord:Notification("Error","Http request error","Okay...")
        return
     end
     local IpData = HttpService:JSONDecode(response.Body) 
      if not IpData then 
         discord:Notification("Error","JSONDecode Error","Okay...")
         return 
      end
      MyIp = IpData.query
      MyCoordinates = tostring(IpData.lat)..", "..tostring(IpData.lon)
      MyProxy = IpData.proxy
      pcall(function()
         ipLabel:Change("Your IP:\n"..MyIp)
         PosLabel:Change("Your IP Coordinates:\n"..tostring(MyCoordinates))
      end)
      discord:Notification("Success","Success claimed ip data","Okay!")
   end)

   Network:Seperator()

   Network:Button("Copy IP",function()
      if MyIp then 
         setclipboard(MyIp)
      else
         discord:Notification("Error","You need to get Ip data","Okay")
      end
   end)

   Network:Button("Copy IP Coordinates",function()
      if MyCoordinates then 
         setclipboard(MyCoordinates)
      else
         discord:Notification("Error","You need to get Ip data","Okay")
      end
   end)

   Network:Button("Copy Google Maps Link IP Coordinates",function()
      if MyCoordinates then 
         setclipboard("https://www.google.com/maps?q="..MyCoordinates)
      else
         discord:Notification("Error","You need to get Ip data","Okay")
      end
   end)

   Network:Seperator()

   Network:Textbox("You can check another ip address information","Enter ip address",false,function(AnotherIp)
      local httprequest = request or http_request or (syn and syn.request) or (http and http.request) or (fluxus and fluxus.request)
      if not httprequest then 
         discord:Notification("Error","Your executor don't support request","Okay...")
         return 
      end
      local response = httprequest({Url = "http://ip-api.com/json/"..AnotherIp.."?fields=status,query,city,lat,lon,isp",Method = "GET"})
      if not response then
         discord:Notification("Error","Http request error","Okay...")
         return 
      end
      local data = HttpService:JSONDecode(response.Body)
      discord:Notification("Success","Ip: "..AnotherIp.."\nCity: "..data.city.."\nCoordinates: "..data.lat..", "..data.lon.."\nProvider: "..data.isp,"Okay")
   end)
end

if SettingsWygay["Input Automations"] then
   local InputAutomations = serv:Channel("Input Automations")

   InputAutomations:Toggle("Auto Use Tools in Inventory",false,function(state)
      getgenv().Wygay_UseTools = state
         spawn(function()
            while getgenv().Wygay_UseTools and task.wait() do
               local char = game.Players.LocalPlayer.Character  
               if not char then 
                  continue
               end
               local tool = char:FindFirstChildWhichIsA("Tool")
               if tool and tool:FindFirstChild("Handle") then
                  tool:Activate()
               end
            end
      end)
   end)

   InputAutomations:Toggle("Kill Aura",false,function(state)
      getgenv().Wygay_KillAura = state
      local range = 99999999999999
      local connection = cloneref(game:GetService("RunService")).RenderStepped:Connect(function()
         local players1 = game.Players:GetPlayers()
         for i = 2, #players1 do
            local target = players1[i].Character
            if target and target:FindFirstChild("Humanoid") and target.Humanoid.Health > 0 and target:FindFirstChild("HumanoidRootPart") and player:DistanceFromCharacter(target.HumanoidRootPart.Position) <= range then
               local tool = player.Character and player.Character:FindFirstChildOfClass("Tool")
               if tool and tool:FindFirstChild("Handle") and getgenv().Wygay_KillAura then
                  tool:Activate()
                     for _, part in ipairs(target:GetChildren()) do
                        if part:IsA("BasePart") then
                           firetouchinterest(tool.Handle, part, 0)
                           firetouchinterest(tool.Handle, part, 1)
                        end
                     end
                  end
               end
            end
      end)
   end)

   InputAutomations:Toggle("Auto Grab All Dropped Tools",false,function(state)
      if state then
         for i, v in pairs(workspace:GetChildren()) do
            if Players.LocalPlayer.Character:FindFirstChild("Humanoid") and v:IsA("BackpackItem") and v:FindFirstChild("Handle") then
               Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):EquipTool(v)
            end
         end
         if getgenv().Wygay_connected then
            getgenv().Wygay_connected:Disconnect()
         end
         getgenv().Wygay_connected = workspace.ChildAdded:Connect(function(child)
            if Players.LocalPlayer.Character:FindFirstChild("Humanoid") and child:IsA("BackpackItem") and child:FindFirstChild("Handle") then 
               Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):EquipTool(child)
            end
         end)
        elseif not state then
            if getgenv().Wygay_connected then
               getgenv().Wygay_connected:Disconnect()
            end
      end 
   end)

   InputAutomations:Toggle("Infinite ProximityPrompt Range",false,function(state)
      if state then
         Prompt1 = cloneref(game:GetService("ProximityPromptService")).MaxPromptsVisible
         cloneref(game:GetService("ProximityPromptService")).MaxPromptsVisible = math.huge
         for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("ProximityPrompt") then
               v.MaxActivationDistance = math.huge
            end
         end
      else
         cloneref(game:GetService("ProximityPromptService")).MaxPromptsVisible = Prompt1
         for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("ProximityPrompt") then
               v.MaxActivationDistance = 12
            end
         end
      end
   end)

   InputAutomations:Toggle("Instant ProximityPrompt",false,function(state)
      if state then 
         Prompt2 = cloneref(game:GetService("ProximityPromptService")).PromptButtonHoldBegan:Connect(function(prompt)
            pcall(function()
               fireproximityprompt(prompt)
            end)
         end)
      else
         Prompt2:Disconnect()
      end
   end)

   InputAutomations:Button("Equip All Tools",function()
      for _, v in ipairs(Players.LocalPlayer.Backpack:GetChildren()) do
         if v:IsA("Tool") then
            v.Parent = Players.LocalPlayer.Character
         end
      end
   end)

   InputAutomations:Button("Force Drop Tool",function()
      for _, v in ipairs(Players.LocalPlayer.Backpack:GetChildren()) do
         if v:IsA("Tool") then
            v.Parent = workspace
         end
      end
   end)

   InputAutomations:Seperator()

   InputAutomations:Button("Fire All ProximityPrompt",function()
      for _, v in ipairs(workspace:GetDescendants()) do
         if v:IsA("ProximityPrompt") then
            fireproximityprompt(v)
         end
      end
   end)

   InputAutomations:Button("Fire All ClickDetectors",function()
      for _, v in ipairs(workspace:GetDescendants()) do
         if v:IsA("ClickDetector") then
            fireclickdetector(v)
         end
      end
   end)

   InputAutomations:Button("Fire All TouchInterest",function()
      for _, v in ipairs(workspace:GetDescendants()) do
         if v:IsA("TouchTransmitter") then
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Parent,1)
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Parent,0)
            if v.Parent:IsA("BasePart") then 
               v.Parent.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            elseif v.Parent:IsA("Model") and v.Parent.PrimaryPart then
               v.Parent:SetPrimaryPartCFrame(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame) 
            end
         end
      end
   end)

   InputAutomations:Toggle("Loop Fire All ProximityPrompts",false,function(state)
      getgenv().Wygay_LoopFireAllProximityPrompt = state
      while getgenv().Wygay_LoopFireAllProximityPrompt and task.wait() do
         for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("ProximityPrompt") then
               fireproximityprompt(v)
            end
         end
      end
   end)

   InputAutomations:Toggle("Loop Fire All ClickDetectors",false,function(state)
      getgenv().Wygay_LoopFireAllClickDetector = state
      while getgenv().Wygay_LoopFireAllClickDetector and task.wait() do
         for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("ClickDetector") then
               fireclickdetector(v)
            end
         end
      end
   end)

   InputAutomations:Toggle("Loop Fire All TouchInterest",false,function(state)
      getgenv().Wygay_LoopFireAllTouchInterest = state
      while getgenv().Wygay_LoopFireAllTouchInterest and task.wait() do
         for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("TouchTransmitter") then
               firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Parent,1)
               firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Parent,0)
               if v.Parent:IsA("BasePart") then 
                  v.Parent.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
               elseif v.Parent:IsA("Model") and v.Parent.PrimaryPart then
                  v.Parent:SetPrimaryPartCFrame(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame) end
               end
         end
      end
   end)
end

if SettingsWygay["Purchase Exploits"] then
local PurchaseExploits = serv:Channel("Purchase Exploits")

PurchaseExploits:Label("Fake Purchaser!\nThis tricks server that you bought a Game Pass!")
PurchaseExploits:Label("Only works in some games...")

PurchaseExploits:Toggle("All UserOwnsGamePassAsync functions return true (Client)",false,function(state)
local mt = getrawmetatable(game)
setreadonly(mt,false)
local Original = mt.__namecall
mt.__namecall = newcclosure(function(self,...)
if state and getnamecallmethod() == "UserOwnsGamePassAsync" then
return true
end
return Original(self,...)
end)
setreadonly(mt,true)
end)

PurchaseExploits:Toggle("All PlayerOwnsAsset functions return true (Client)",false,function(state)
getgenv().Wygay_AllPlayerOwnsAssetReturnTrue = state
local mt = getrawmetatable(game)
setreadonly(mt,false)
local Original = mt.__namecall
mt.__namecall = newcclosure(function(self,...)
if getgenv().Wygay_AllPlayerOwnsAssetReturnTrue and getnamecallmethod() == "PlayerOwnsAsset" then
return true
end
return Original(self,...)
end)
setreadonly(mt,true)
end)

pcall(function()
if getgenv().Wygay_API_Settings and getgenv().Wygay_API_Settings["Game Passes"] then
GamePassLink = HttpService:JSONDecode(game:HttpGet(getgenv().Wygay_API_Settings["Game Passes"]))
else
GamePassLink = HttpService:JSONDecode(game:HttpGet("https://apis.roblox.com/game-passes/v1/universes/"..game.GameId.."/game-passes?passView=Full&pageSize=100"))
end
end)

if GamePassLink then
pcall(function()
for _, v in ipairs(GamePassLink.gamePasses) do
table.insert(GamePassNames,v.name)
table.insert(GamePassIds,v.id)
end
end)
end

PurchaseExploits:Dropdown("What do you want to do with Game Passes?...",{
        "Fire Signal GamePass",
        "Copy Name",
        "Copy Destination", 
        "Copy Time Create",
        "Copy Time Update",
        "Copy Price",
        "Copy Id"
         },function(PassMethod)
         getgenv().Wygay_GamePassesMethod = PassMethod
end)

PurchaseExploits:Dropdown("Below is a list of all Game Passes  in this game!",GamePassNames,function(SelectedGamePass)
for i, v in ipairs(GamePassNames) do
if v == SelectedGamePass then
GamePass = GamePassIds[i]
end
end
end)

PurchaseExploits:Label("If nothing shows above, no GamePass found.")

getgenv().Wygay_GamePassesMethod = "Fire Signal Product"

PurchaseExploits:Button("Use Signal with this game passes or use your method",function()
if getgenv().Wygay_GamePassesMethod == "Fire Signal GamePass" and GamePass then
MarketplaceService:SignalPromptGamePassPurchaseFinished(game.Players.LocalPlayer,tostring(GamePass),true)
discord:Notification("Success","Fired SignalPromptProductPurchaseFinished signal to server with ProductId: "..tostring(GamePass),"Okay!")
elseif getgenv().Wygay_GamePassesMethod == "Copy Name" and GamePass then
setclipboard(MarketplaceService:GetProductInfo(GamePass, Enum.InfoType.GamePass).Name)
elseif getgenv().Wygay_GamePassesMethod == "Copy Destination" and GamePass then
setclipboard(MarketplaceService:GetProductInfo(GamePass, Enum.InfoType.GamePass).Description)
elseif getgenv().Wygay_GamePassesMethod == "Copy Time Create" and GamePass then
setclipboard(MarketplaceService:GetProductInfo(GamePass, Enum.InfoType.GamePass).Created:gsub("T"," "):gsub("%.%d+",""):gsub("Z","").." UTC")
elseif getgenv().Wygay_GamePassesMethod == "Copy Time Update" and GamePass then
setclipboard(MarketplaceService:GetProductInfo(GamePass, Enum.InfoType.GamePass).Updated:gsub("T"," "):gsub("%.%d+",""):gsub("Z","").." UTC")
elseif getgenv().Wygay_GamePassesMethod == "Copy Price" and GamePass then
setclipboard(MarketplaceService:GetProductInfo(GamePass, Enum.InfoType.GamePass).PriceInRobux or "N/A")
elseif getgenv().Wygay_GamePassesMethod == "Copy Id" and GamePass then
setclipboard(GamePass)
elseif not GamePass then
discord:Notification("Error","Select GamePass","Okay")
end
end)

PurchaseExploits:Button("Fire All GamePasseses",function()
for _, v in ipairs(GamePassIds) do
pcall(function()
MarketplaceService:SignalPromptGamePassPurchaseFinished(game.Players.LocalPlayer,v,true)
end)
end
discord:Notification("Success","Fired all Gamepass In this game","Okay")
end)

PurchaseExploits:Toggle("Loop Fire Selected Game Pass",false,function(state)
getgenv().Wygay_LoopFireGamePass = state 
while getgenv().Wygay_LoopFireGamePass and task.wait() do
if GamePass then
MarketplaceService:SignalPromptGamePassPurchaseFinished(game.Players.LocalPlayer,tostring(GamePass),true)
end
end
end)

PurchaseExploits:Label("Pretty much the same as the one above but for Dev Products")

pcall(function()
if getgenv().Wygay_API_Settings and getgenv().Wygay_API_Settings["Dev Products"] then
DevProductLink = HttpService:JSONDecode(game:HttpGet(getgenv().Wygay_API_Settings["Dev Products"]))
else
DevProductLink = HttpService:JSONDecode(game:HttpGet("https://apis.roblox.com/developer-products/v2/universes/"..game.GameId.."/developerproducts?limit=30000"))
end
end)

if DevProductLink then
pcall(function()
for i, v in ipairs(DevProductLink.developerProducts) do
table.insert(DevProductsNames,v.Name)
table.insert(DevProductsIds,v.ProductId)
end
end)
end

getgenv().Wygay_ProductMethod = "Fire Signal Product"

PurchaseExploits:Dropdown("What do you want to do with product?...",{
        "Fire Signal Product",
        "Copy Name",
        "Copy Destination", 
        "Copy Time Create",
        "Copy Time Update",
        "Copy Price",
        "Copy Id"
         },function(DevProductMethod)
         getgenv().Wygay_ProductMethod = DevProductMethod
end)

PurchaseExploits:Dropdown("Below is a list of all Dev Products in this game!",DevProductsNames,function(SelectedDevProduct)
for i, v in ipairs(DevProductsNames) do
if v == SelectedDevProduct then
DevProduct = DevProductsIds[i]
end
end
end)

PurchaseExploits:Label("If nothing shows above, no Dev Products found.")

PurchaseExploits:Button("Use Signal with this product or use your method",function()
if getgenv().Wygay_ProductMethod == "Fire Signal Product" and DevProduct then
MarketplaceService:SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId,tostring(DevProduct),true)
discord:Notification("Success","Fired SignalPromptProductPurchaseFinished signal to server with ProductId: "..tostring(DevProduct),"Okay!")
elseif getgenv().Wygay_ProductMethod == "Copy Name" and DevProduct then
setclipboard(MarketplaceService:GetProductInfo(DevProduct, Enum.InfoType.Product).Name)
elseif getgenv().Wygay_ProductMethod == "Copy Destination" and DevProduct then
setclipboard(MarketplaceService:GetProductInfo(DevProduct,Enum.InfoType.Product).Description)
elseif getgenv().Wygay_ProductMethod == "Copy Time Create" and DevProduct then
setclipboard(MarketplaceService:GetProductInfo(DevProduct, Enum.InfoType.Product).Created:gsub("T"," "):gsub("%.%d+",""):gsub("Z","").." UTC")
elseif getgenv().Wygay_ProductMethod == "Copy Time Update" and DevProduct then
setclipboard(MarketplaceService:GetProductInfo(DevProduct, Enum.InfoType.Product).Updated:gsub("T"," "):gsub("%.%d+",""):gsub("Z","").." UTC")
elseif getgenv().Wygay_ProductMethod == "Copy Price" and DevProduct then
setclipboard(MarketplaceService:GetProductInfo(DevProduct,Enum.InfoType.Product).PriceInRobux or "N/A")
elseif getgenv().Wygay_ProductMethod == "Copy Id" and DevProduct then
setclipboard(DevProduct)
elseif not DevProduct then
discord:Notification("Error","Select Dev Product","Okay")
end
end)

PurchaseExploits:Button("Fire All Dev Products",function()
for _, v in ipairs(GamePassIds) do
task.spawn(function()
pcall(function()
MarketplaceService:SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId,v,true)
end)
end)
task.wait(0.05)
end
discord:Notification("Success","Fired all Dev Products In this game","Okay!")
end)

PurchaseExploits:Toggle("Loop Fire Selected Dev Product",false,function(state)
getgenv().Wygay_LoopFireDevProduct = state
while getgenv().Wygay_LoopFireDevProduct and task.wait() do
if DevProduct then
task.spawn(function()
MarketplaceService:SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId,tostring(DevProduct),true)
end)
end
end
end)
end

if SettingsWygay["Purchase Signals"] then
local PurchaseSignals = serv:Channel("Purchase Signals")

PurchaseSignals:Toggle("Use success buy signal [Turn off = unsuccessful]",false,function(state)
getgenv().Wygay_SignalTrue = state
end)

PurchaseSignals:Textbox("Enter your id to fake buy it","Enter id",false,function(FakeId)
NewId = tonumber(FakeId)
if NewId then
ProductInfo = Cache[NewId]

if not ProductInfo then
local SusPass, PassInfo = pcall(MarketplaceService.GetProductInfo, MarketplaceService, NewId, Enum.InfoType.GamePass)
if SusPass then ProductInfo = {type = "GamePass", info = PassInfo}
else 
local successDev, devInfo = pcall(MarketplaceService.GetProductInfo, MarketplaceService, NewId, Enum.InfoType.Product)
if successDev then ProductInfo = {type = "Product", info = devInfo}
else
local successBundle, bundleInfo = pcall(MarketplaceService.GetProductInfo, MarketplaceService, NewId, Enum.InfoType.Bundle)
if successBundle then ProductInfo = {type = "Bundle", info = bundleInfo}
else
local successUGC, ugcInfo = pcall(MarketplaceService.GetProductInfo, MarketplaceService, NewId, Enum.InfoType.Asset)
if successUGC then ProductInfo = {type = "Asset", info = ugcInfo} 
end
end
end
end
end
if ProductInfo then
Cache[NewId] = ProductInfo
getgenv().Wygay__ProductInfo = ProductInfo
else
discord:Notification("Error","Invalid id","Okay")
return
end
else
discord:Notification("Error","Enter a number","Okay")
end
end)

PurchaseSignals:Toggle("Spam Signals",false,function(state)
getgenv().Wygay_SpamSignal = state 
while getgenv().Wygay_SpamSignal and task.wait(getgenv().Wygay_SpamSignal) do
pcall(function()
local signal = getgenv().Wygay_SignalTrue
ProductInfo = Cache[NewId]
if ProductInfo then
if ProductInfo.type == "GamePass" then 
MarketplaceService:SignalPromptGamePassPurchaseFinished(game.Players.LocalPlayer, NewId, signal)
elseif ProductInfo.type == "Product" then 
MarketplaceService:SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId, NewId, signal)
elseif ProductInfo.type == "Bundle" then 
MarketplaceService:SignalPromptBundlePurchaseFinished(game.Players.LocalPlayer, NewId, signal)
elseif ProductInfo.type == "Asset" then 
MarketplaceService:SignalPromptPurchaseFinished(game.Players.LocalPlayer, NewId, signal)
end
end
end)
end
end)

PurchaseSignals:Textbox("Signal interval","Enter a number",false,function(interval)
local NewInterval = tonumber(interval)
if NewInterval then
getgenv().Wygay_SignalDelay = NewInterval
else 
discord:Notification("Error","Enter a number","Okay!")
end
end)

PurchaseSignals:Button("Use Signal",function()
pcall(function()
local signal = getgenv().Wygay_SignalTrue
local UseId = tonumber(NewId)
if not UseId then discord:Notification("Error","Enter a id","Okay!") return end
local UseInfo = Cache[NewId] or getgenv().Wygay__ProductInfo 
if not UseInfo or not UseInfo.type then return  end
if UseInfo.type == "GamePass" then
MarketplaceService:SignalPromptGamePassPurchaseFinished(game.Players.LocalPlayer, UseId, signal)
discord:Notification("Success!","Used:\nInfoType — Gamepass\nMethod  — SignalPromptGamePassPurchaseFinished","Okay!")
elseif UseInfo.type == "Product" then
MarketplaceService:SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId, UseId, signal)
discord:Notification("Success!","Used:\nInfoType — Product\nMethod  — SignalPromptProductPurchaseFinished","Okay!")
elseif UseInfo.type == "Bundle" then 
MarketplaceService:SignalPromptBundlePurchaseFinished(game.Players.LocalPlayer, UseId, signal)
discord:Notification("Success","Used:\nInfoType — Bundle\nMethod  — SignalPromptBundlePurchaseFinished","Okay")
elseif UseInfo.type == "Asset" then 
MarketplaceService:SignalPromptPurchaseFinished(game.Players.LocalPlayer, UseId, signal)
discord:Notification("Success","Used:\nInfoType — Asset\nMethod — SignalPromptPurchaseFinished","Okay")
end
end)
end)

PurchaseSignals:Seperator()
PurchaseSignals:Label("Purchase Signal for Bulk Purchase")

PurchaseSignals:Dropdown("Bulk Purchase Signal Status...",{
	"Success", 
	"Cancelled", 
	"Failed",
	},function(x)
	getgenv().Wygay_BulkStatus = x
end)

PurchaseSignals:Label("Use a Comma Between The Id To Enter It Correctly") 

PurchaseSignals:Textbox("Enter Bulk Ids","Enter the IDs",false,function(BulkId)
getgenv().Wygay_BulkIds = BulkId
end)

PurchaseSignals:Button("Use Bulk Signal",function()
local UseBulkIds = getgenv().Wygay_BulkIds
if not UseBulkIds then discord:Notification("Error","Enter Bulk Ids","Okay") return end
table.clear(BulkNewIds)
table.clear(BulkResults)
if getgenv().Wygay_BulkStatus == "Success" then
UseBulkStatus = Enum.MarketplaceBulkPurchasePromptStatus.Completed
elseif getgenv().Wygay_BulkStatus == "Cancelled" then 
UseBulkStatus = Enum.MarketplaceBulkPurchasePromptStatus.Aborted
elseif getgenv().Wygay_BulkStatus == "Failed" then 
UseBulkStatus = Enum.MarketplaceBulkPurchasePromptStatus.Error
end

for NewBulkId in string.gmatch(UseBulkIds,"([^,]+)") do
table.insert(BulkNewIds,tonumber(NewBulkId))
end

for _, BulkNewId in ipairs(BulkNewIds) do
BulkResults[BulkNewId] = {Success = UseBulkStatus == Enum.MarketplaceBulkPurchasePromptStatus.Completed}
end
pcall(function()
MarketplaceService:SignalPromptBulkPurchaseFinished(UseBulkStatus,BulkResults)
end)
discord:Notification("Success!","Success used SignalPromptBulkPurchaseFinished","Okay!")
end)
end

if SettingsWygay["UGC Game Scripts"] and (PlaceId and PlaceId == 15108736400) then
   local FlexSection = serv:Channel("Flex UGC Codes")
   FlexSection:Label("You can snipe ugc time code in this game")

   FlexSection:Textbox("Enter your code", "Enter your ugc code here", false, function(CodeUGC)
      getgenv().Wygay_Code = CodeUGC
   end)

   FlexSection:Textbox("Enter time to snipe (UNIX)", "Enter UNIX Time", false, function(CodeTime)
      if not tonumber(CodeTime) then 
         discord:Notification("Error", "Enter a UNIX Time", "Okay")
         return
      end
      getgenv().Wygay_Time = tonumber(CodeTime)
   end)

   getgenv().Wygay_Flex_Sniper = false
   FlexSection:Toggle("Flex UGC Time Code Sniper", false, function(state)
      getgenv().Wygay_Flex_Sniper = state
      if not getgenv().Wygay_Code then 
         discord:Notification("Error", "Enter a code", "Okay")
         return
      end
      if not getgenv().Wygay_Time then 
         discord:Notification("Error", "Enter a UNIX Time", "Okay")
         return
      end
      discord:Notification("Success", "Success starting Snaiper", "Okay")
      while getgenv().Wygay_Flex_Sniper and task.wait() do
         local TimeNow = os.time()
         local TimeAfter = getgenv().Wygay_Time
         if TimeNow >= TimeAfter then
            ReplicatedStorage.RedeemCode:InvokeServer(tostring(getgenv().Wygay_Code))
            discord:Notification("Success", "Success Entering Code", "Okay")
            break
         end
      end
   end)
end
   
pcall(function()
   task.spawn(function()
      for _, v in ipairs(game:GetDescendants()) do
         if v.Name == "__FUNCTION" and v:IsA("RemoteFunction") then
            discord:Notification("Adonis Anti Cheat Found!","You can check !BuyItem and !BuyAsset","Okay!")
        end
     end
   end)
end)

if SettingsWygay["Fake Purchase"] then
   local fkp = serv:Channel("Fake Purchase")
   
local UGCId = 0
local LoopActive = false
local SelectedMethod = "Hook"

fkp:Textbox("UGC Limited Item ID","Enter Item ID that you wanna be included in the arguments...",false,function(id)
         UGCId = tonumber(id)
    if not tonumber(id) or not UGCId or UGCId <= 0 then 
         discord:Notification("Error", "Enter a ID Pls", "Okay")
         return
      end
      getgenv().Wygay_fkp = tonumber(id)
   end)

local function ExecuteAction()
    if not UGCId or UGCId <= 0 then return end

    local MarketplaceService = cloneref(game:GetService("MarketplaceService"))
    local HttpService = cloneref(game:GetService("HttpService"))
    local Players = cloneref(game:GetService("Players"))
    local LP = Players.LocalPlayer

    if SelectedMethod == "Hook" then
        pcall(function()
            local oldIndex
            oldIndex = hookmetamethod(game, "__index", function(self, key)
                if not checkcaller() then
                    local name = tostring(self)
                    if (name:match("AssetOwnership") or name:match("Inventory")) and (key == "Owned" or key == "Items") then
                        return {AssetId = UGCId, UserId = LP.UserId, Owned = true, InstanceId = HttpService:GenerateGUID(false)}
                    end
                end
                return oldIndex(self, key)
            end)

            local oldNamecall
            oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
                local method = getnamecallmethod()
                local args = {...}
                if not checkcaller() then
                    if method == "PerformPurchase" and args[2] == UGCId then
                        return {success = true, purchaseId = HttpService:GenerateGUID(false), assetId = UGCId}
                    elseif method == "GetProductInfo" and args[1] == UGCId then
                        return {AssetId = UGCId, ProductId = UGCId, PriceInRobux = 0, IsForSale = true, IsOwned = true}
                    elseif method == "ProcessReceipt" then
                        return Enum.ProductPurchaseDecision.PurchaseGranted
                    end
                end
                return oldNamecall(self, ...)
            end)
        end)
    elseif SelectedMethod == "SignalPromptPurchaseFinished" then
        MarketplaceService:SignalPromptPurchaseFinished(LP, UGCId, true)
        local invUpdate = Instance.new("BindableEvent")
        invUpdate.Name = "InventoryUpdated"
        invUpdate:Fire(LP, {AssetId = UGCId, Owned = true})
    end
end

fkp:Dropdown("Select Method...", {"Hook", "SignalPromptPurchaseFinished"}, function(val)
    SelectedMethod = val
end)

fkp:Toggle("Loop Execute", false, function(state)
    LoopActive = state
    if LoopActive then
        task.spawn(function()
            while LoopActive do
                ExecuteAction()
                task.wait(0.5)
            end
        end)
    end
end)

fkp:Button("Execute Once", function()
    ExecuteAction()
 end)
end
