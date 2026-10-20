local plr = game.Players.LocalPlayer
local lock = true
local Camera = game.Workspace.CurrentCamera
local TweenService = game:GetService("TweenService")
local DiedGui = script:WaitForChild("DiedGui")
local DiedSound = script:WaitForChild("DiedSound")


local Achievement = require(game.ReplicatedStorage.Achievement)
local tweeninfo = TweenInfo.new(
	3,
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.Out,
	0,
	false,
	0
	
	
)
local a = {
	
	BackgroundTransparency = 0,
	TextTransparency = 0,
	
}
local DieCamaera = game.Workspace.Cameras:WaitForChild("DieCamera")
local RunService = game:GetService("RunService")





	local humanoid = plr.Character:WaitForChild("Humanoid")




	lock = true

	humanoid.BreakJointsOnDeath = false
	
	
script:FindFirstChild("H_win"):GetPropertyChangedSignal("Value"):Connect(function()	
	
	
	if script:FindFirstChild("H_win").Value == 2 and plr:FindFirstChild("BoolValue"):FindFirstChild("G").Value == false then
		
		game.ReplicatedStorage.Guiadd3:FireServer()
		
	end
	
	
end)


script:FindFirstChild("T_win"):GetPropertyChangedSignal("Value"):Connect(function()	


	if script:FindFirstChild("T_win").Value == 1 and plr:FindFirstChild("BoolValue"):FindFirstChild("N").Value == false then

		game.ReplicatedStorage.Guiadd5:FireServer()

	end


end)

plr.Character:FindFirstChild("Humanoid").Died:Connect(function()
		

		
	if lock == true then
		lock = false
	
		
		plr.leaderstats.Died.Value += 1
		if plr.leaderstats.Died.Value == 10 and plr:FindFirstChild("BoolValue"):FindFirstChild("Z").Value == false then
			
		   game.ReplicatedStorage.Guiadd2:FireServer()
			
		end
		
		local DioRN = math.random(1,2)
		
	
		
		if DioRN == 1 and plr:FindFirstChild("BoolValue"):FindFirstChild("D1").Value == false then
		
			game.ReplicatedStorage.Guiadd4:FireServer()
			
		end
		
		print("Died")
	
		local Pos = plr.Character:FindFirstChild("Torso").CFrame
		local CL = DieCamaera:Clone()
		CL.Parent = workspace
		CL.CFrame = Pos * CFrame.new(0,8,3)
		Camera.CameraType = Enum.CameraType.Scriptable
		Camera.CFrame = CL.CFrame

		
		humanoid.RequiresNeck = false
		humanoid:ChangeState(Enum.HumanoidStateType.Physics)
		script.RemoteEvent:FireServer(Pos)
		RunService.Heartbeat:Connect(function()
			if not CL.Parent then return end

			
			local torso = plr.Character:FindFirstChild("Torso")
			if not torso then return end
			
		   local poC = CL.CFrame.Position
			Camera.CFrame = CL.CFrame
			CL.CFrame = CL.CFrame:Lerp(
				CFrame.lookAt(poC, plr.Character:FindFirstChild("Torso").Position),
				0.05
			)
		  
		end)
	
		wait(2)
		DiedSound:Play()
		local DiedGuiClone = DiedGui:Clone()
		DiedGuiClone.Parent = plr.PlayerGui
		local BeforeP = plr.Character:FindFirstChild("Humanoid")
		TweenService:Create(DiedGuiClone.TextLabel,tweeninfo,a):Play()
		game.Debris:AddItem(DiedGuiClone,3)
		print("1")
		wait(2.5)
	    CL:Destroy()
		Camera.CameraType = Enum.CameraType.Custom
		Camera.CameraSubject = humanoid
		print("2")
	end

	
  end)

