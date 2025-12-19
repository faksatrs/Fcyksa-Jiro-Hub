local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Fcyksa TR x Jiro Hub",
   LoadingTitle = "The Wind Rises...",
   LoadingSubtitle = "by Fcyksa TR",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "FcyksaJiro",
      FileName = "FishItConfig"
   },
   Theme = "Green" 
})

local Tab = Window:CreateTab("Fishing", 4483362458)

Tab:CreateSection("Blatant Features [BETA]")

Tab:CreateToggle({
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
