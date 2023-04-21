local tower = 'Marksman'

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "OVC: TD EXPLOIT", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local Main = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local towersSec = Main:AddSection({
	Name = "Spawn any tower"
})

towersSec:AddDropdown({
    Name = "Towers",
    Default = 'Marksman',
    Options = {'Bandit' ,'Raygunner' ,'Anchiams' ,'Beamer','DigitalCasher' ,'Gunner' ,'Ice Breaker' ,'Marksman' ,'Sniper','Healer','LazerRiot'},
    Callback = function(Value)
        tower = Value
    end 
})
towersSec:AddButton({
    Name = 'Spawn Tower',
    Callback = function()
        local pos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position


        args = {
            [1] = {
                ["SelectedPerks"] = {},
                ["Gold"] = 410,
                ["OwnedPerks"] = {},
                ["OwnedTowers"] = {
                    [1] = tower
                },
                ["SelectedTowers"] = {
                    [1] = tower
                }
            },
            [2] = tower,
            [3] = CFrame.new(pos.x,pos.y - 1,pos.z) * CFrame.Angles(-0, 0, -0),
            [4] = Vector3.new(pos.x,pos.y - 1,pos.z)
        }

        game:GetService("ReplicatedStorage").Functions.SpawnTower:InvokeServer(unpack(args))
      end    
})

local skipSec = Main:AddSection({
	Name = "Force Skip"
})

skipSec:AddButton({
    Name = 'Force Round Skip',
    Callback = function()
        local Children = game:GetService("Players"):GetChildren()

        for i = 1, #Children do
            local args = {
            [1] = Children[i]
        }
           game:GetService("ReplicatedStorage").Events.SuccessSkipWave:FireServer(unpack(args))
        end
        
        OrionLib:MakeNotification({
        	Name = "Skipped a wave!",
        	Content = "Succesuflly skipped a wave",
        	Image = "rbxassetid://4483345998",
        	Time = 2
        })
      end    
})
OrionLib:Init()
