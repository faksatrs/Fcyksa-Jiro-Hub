local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = JiroHub:CreateWindow({
   Name = "Fcyksa TR x Jiro Hub",
   LoadingTitle = "The Wind Rises...",
   LoadingSubtitle = "by Fcyksa TR",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "FcyksaJiro",
      FileName = "FishItConfig"
   },
   Theme = "Green", -- Memperbaiki warna agar menjadi Hijau Ghibli
   
   -- MEMPERBAIKI NAMA SAAT CLOSE MENU
   CloseSideBarTitle = "Jiro Hub", -- Mengganti teks 'Rayfield' saat menu ditutup
   CloseSideBarIcon = 4483362458  -- Ikon estetik saat menu ditutup
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

-- TAB TAMBAHAN BIAR MENU TIDAK KOSONG
local MiscTab = Window:CreateTab("Misc", 4483362458)
MiscTab:CreateButton({
   Name = "Anti-AFK",
   Callback = function()
      -- Fitur agar tidak terkena kick saat diam lama
      local vu = game:GetService("VirtualUser")
      game:GetService("Players").LocalPlayer.Idled:Connect(function()
         vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
         wait(1)
         vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
      end)
   end,
})
