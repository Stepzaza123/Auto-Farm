_G.Farm = true
function CheckQuest()
   local Lv = game.Players.LocalPlayer.Data.Level.Value
    if Lv == 1 or Lv <= 9999 then
    Ms = "Bandit [Lv. 5]"
    NM = "Bandit"
    LQ = 1
    NQ = "BanditQuest1"
    CQ = CFrame.new(1059.0523681640625, 16.424299240112305, 1547.887451171875)
    end
end


function TP(P)
    Distance = (P.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if Distance < 10 then
        Speed = 1000
    elseif Distance < 170 then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
        Speed = 350
    elseif Distance < 1000 then
        Speed = 350
    elseif Distance >= 1000 then
        Speed = 300
    end
    game:GetService("TweenService"):Create(
        game.Players.LocalPlayer.Character.HumanoidRootPart,
        TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
        {CFrame = P}
    ):Play()
end

spawn(function()
   while task.wait() do
       if _G.Farm then
           CheckQuest()
           if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                TP(CQ)
                wait(0.9)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NQ,LQ)
                elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == Ms then
                        TP(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
                        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                    end
                end
            end
        end
    end
end)

