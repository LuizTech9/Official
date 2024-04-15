--[[
Some parts of script is borrowed, not including the metatable im made.
If Some parts is owned by you, tell me in my youtube channel with video the current script to me make myself.

Don't worry if there was a case problem in my script, im will check in my commnets with your report bug!
]]

local Library = loadstring(game:HttpGet("https://pastebin.com/raw/vff1bQ9F"))()
local Window = Library.CreateLib("Hitbox expander", "Sentinel")

--// Variables
getgenv().HitboxSettings = {
    HitboxToggle = false,
    HitboxSize = 5,
    HitboxTransparency = 0.55
}
--// Variables additional and main
local HitboxStatus = getgenv().HitboxSettings.HitboxToggle
local HitboxSize = getgenv().HitboxSettings.HitboxSize
local HitboxTransparency = getgenv().HitboxSettings.HitboxTransparency

local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Hitbox")

Section:NewToggle("Toggle", "Toggles the hitbox on or off.", function(state)
    HitboxStatus = state
end)

Section:NewSlider("Size", "Increases the size of hitbox.", 25, 4, function(size)
    HitboxSize = size
end)

Section:NewTextBox("Transparency", "Adjust the transparency of hitbox", function(transparency)
    HitboxTransparency = transparency
end)

--// Support of the gui.
local Details = Window:NewTab("Details") do
    local Section_D = Details:NewSection("GUI Version");
    
    Section_D:NewLabel("0.0.1")
    Section_D:NewLabel("User is on supported game: Not Available")
end

game:GetService('RunService').RenderStepped:Connect(function()
    for _, player in ipairs(game:GetService('Players'):GetPlayers()) do
        if player.Name ~= game:GetService('Players').LocalPlayer.Name then
            pcall(function()
                if HitboxStatus then
                    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        player.Character.HumanoidRootPart.Size = Vector3.new(HitboxSize, HitboxSize, HitboxSize)
                        player.Character.HumanoidRootPart.Transparency = HitboxTransparency
                        player.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really black")
                        player.Character.HumanoidRootPart.Material = "Neon"
                        player.Character.HumanoidRootPart.CanCollide = false
                    end
                else
                    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        player.Character.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
                        player.Character.HumanoidRootPart.Transparency = 1
                        player.Character.HumanoidRootPart.BrickColor = BrickColor.new("Medium stone grey")
                        player.Character.HumanoidRootPart.Material = "Plastic"
                        player.Character.HumanoidRootPart.CanCollide = false
                    end
                end
            end)
        end
    end
end)
