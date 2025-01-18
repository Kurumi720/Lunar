local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Lunar Trade Scam",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Best Blox Fruit Trade Scam",
   LoadingSubtitle = "by Kurumi",
   Theme = "Ocean", -- Check https://docs.sirius.menu/rayfield/configuration/themes
 
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface
 
   ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "Big Hub"
   },
 
   Discord = {
       Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
       Invite = "discord.gg/U66Qpj8bGJ", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
 
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

 -- 變數
 local autoAccept = true
 local antiJump = true
 local freezeTrade = true

 -- 函數
 local function calculateTradeValueDifference(trade)
    -- 你的計算邏輯在這裡
    -- 返回交易價值差距的百分比，比如返回 30 表示差距是30%
    return 30
end

 local function autoAcceptTrade(trade)
   if autoAccept then
      local valueDifference = calculateTradeValueDifference(trade)
         if valueDifference >= 0 and valueDifference <= 40 then
           local args = {
            [1] = "accept"
         }
         game:GetService("ReplicatedStorage").Remotes.TradeFunction:InvokeServer(unpack(args))
      end
   end
end

-- 假設你有一個條件來判斷何時自動同意，比如玩家送出交易請求時。
game:GetService("Players").PlayerAdded:Connect(function(player)
   player.RequestedTrade:Connect(function(trade)
      autoAcceptTrade(trade)
   end)
end)


 -- 分頁
 local Tab = Window:CreateTab("Trade", 4483362458) -- Title, Image
 local Section = Tab:CreateSection("Main")
 
 -- 按鈕模塊
local Toggle = Tab:CreateToggle({
   Name = "Anti-Jump",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      antiJump = Value -- 更新 autoAccept 的值
   end,
})

local Toggle = Tab:CreateToggle({
   Name = "Auto Accept",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      autoAccept = Value -- 更新 autoAccept 的值
   end,
})

local Toggle = Tab:CreateToggle({
   Name = "Freeze Trade",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      freezeTrade = Value -- 更新 autoAccept 的值
   end,
})

local Button = Tab:CreateButton({
   Name = "Start Trade Scam",
   Callback = function()
   -- The function that takes place when the button is pressed
   end,
})
 -- 分頁2
 local Tab = Window:CreateTab("Settings", 4483362458) -- Title, Image
 local Section = Tab:CreateSection("Main")
 -- 按鈕模塊2
 
 local ColorPicker = Tab:CreateColorPicker({
   Name = "Color Picker",
   Color = Color3.fromRGB(255,255,255),
   Flag = "ColorPicker1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
       print(Value)
       -- The variable (Value) is a Color3fromRGB value based on which color is selected
   end
})



Rayfield:LoadConfiguration()