

spawn(function()
    while wait() do
        pcall(function()
            if getgenv().Config["Instant Kill"] then
                local player = game.Players.LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                sethiddenproperty(player, "SimulationRadius", 112412400000)
                sethiddenproperty(player, "MaxSimulationRadius", 112412400000)
                for _, v in pairs(game.Workspace[getgenv().Config["Folder Mon"]]:GetDescendants()) do
                    if v:IsA("Humanoid") and v.Parent and v.Parent:IsA("Model") then
                        local npcPosition = v.Parent:FindFirstChild("HumanoidRootPart") and v.Parent.HumanoidRootPart.Position
                        local playerPosition = character:FindFirstChild("HumanoidRootPart") and character.HumanoidRootPart.Position
                        if npcPosition and playerPosition and (npcPosition - playerPosition).Magnitude <= getgenv().Config["Radius"] then
                            if v.Health < v.MaxHealth then
                                wait(.1)
                                v.Health = 0
                            end
                        end
                    end
                end
            end
        end)
    end
end)
