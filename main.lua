local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Fcyksa TR x Jiro Hub",
   LoadingTitle = "Fcyksa TR x Jiro Hub",
   LoadingSubtitle = "by faksatrs",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "FcyksaJiro",
      FileName = "FishItConfig"
   },
   Theme = "Green", -- Warna Hijau Ghibli
   CloseSideBarTitle = "Jiro Hub", -- Nama saat menu ditutup
   CloseSideBarIcon = 4483362458,
})

-- [[ TAB FISHING ]]
local FishingTab = Window:CreateTab("Fishing", 4483362458)

FishingTab:CreateSection("Main Features")

FishingTab:CreateToggle({
   Name = "Blatant Fishing",
   CurrentValue = false,
   Callback = function(Value)
      _G.AutoFish = Value
      if Value then
         task.spawn(function()
            local vInput = game:GetService("VirtualInputManager")
            while _G.AutoFish do
               task.wait(0.5)
               vInput:SendMouseButtonEvent(500, 500, 0, true, game, 0)
               task.wait(0.1)
               vInput:SendMouseButtonEvent(500, 500, 0, false, game, 0)
               task.wait(1.9)
            end
         end)
      end
   end,
})

-- [[ TAB AUTOMATION ]]
local AutoTab = Window:CreateTab("Automation", 4483362458)

AutoTab:CreateToggle({
   Name = "Auto Sell Fish",
   CurrentValue = false,
   Callback = function(Value)
      _G.AutoSell = Value
      -- Logika Auto Sell bisa kamu tambahkan di sini sesuai remote game
   end,
})

-- [[ TAB PLAYER ]]
local PlayerTab = Window:CreateTab("Player", 4483362458)

PlayerTab:CreateSlider({
   Name = "Walkspeed",
   Range = {16, 300},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "WS", 
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

PlayerTab:CreateButton({
   Name = "Infinite Jump",
   Callback = function()
      game:GetService("UserInputService").JumpRequest:Connect(function()
          game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
      end)
   end,
})

-- [[ TAB MISC ]]
local MiscTab = Window:CreateTab("Misc", 4483362458)

MiscTab:CreateButton({
   Name = "Anti-AFK",
   Callback = function()
      local vu = game:GetService("VirtualUser")
      game:GetService("Players").LocalPlayer.Idled:Connect(function()
         vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
         wait(1)
         vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
      end)
      Rayfield:Notify({Title = "Success", Content = "Anti-AFK Enabled", Duration = 3})
   end,
})

MiscTab:CreateButton({
   Name = "Destroy UI",
   Callback = function()
      Rayfield:Destroy()
   end,
})
