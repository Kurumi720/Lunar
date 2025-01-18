local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Lunar Trade Scam",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Best Trade Scam Script",
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
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Kurumi",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Admin"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})
-- *********** 變數 ***********
local autoAccept = true




-- *********** 函數 ***********
-- 這是一個假設的 function，用於計算交易價值差距
local function calculateTradeValueDifference(trade)
    -- 你的計算邏輯在這裡
    -- 返回交易價值差距的百分比，比如返回 30 表示差距是30%
    return 30
end

local function autoAcceptTrade(trade)
    if autoAccept then
        local valueDifference = calculateTradeValueDifference(trade)
        if valueDifference < 40 then
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


-- *********** 分頁 ***********
 local PlayerTab = Window:CreateTab("Trade", 4483362458) -- Title, Image

-- 啟用禁用類型按鈕
local Toggle = Tab:CreateToggle({
   Name = "Anti-Jump",
   CurrentValue = false,
   Flag = "t", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   -- The function that takes place when the toggle is pressed
   -- The variable (Value) is a boolean on whether the toggle is true or false
   end,
})

local Toggle = Tab:CreateToggle({
   Name = "Auto Accept",
   CurrentValue = false,
   Flag = "ts", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      getgenv() = Value
      autoaccept()
   end,
})

local Toggle = Tab:CreateToggle({
   Name = "Freeze Trade",
   CurrentValue = false,
   Flag = "tse", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   -- The function that takes place when the toggle is pressed
   -- The variable (Value) is a boolean on whether the toggle is true or false
   end,
})