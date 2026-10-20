
local plr = game.Players.LocalPlayer
plr.Character.Archivable = true
local UserInputService = game:GetService("UserInputService")
local lock = true
local lock2 = true
local Using = false
local onSound = script.TimeStopOnSound
local offSound = script.TimeStopOffSound
local Using2 = false
local TS 
local TimeOut = false
local End = false
local CoolTime = 0.1
local CoolTime2 = 5
local ChCLs = {}
local WS = 16
local JP = 50
local humanoid = plr.Character:FindFirstChild("Humanoid")



plr.Character:FindFirstChild("Humanoid").Died:Connect(function()
	for i,v in ipairs(ChCLs) do



		v:Destroy()
	


	end
	table.clear(ChCLs)

	game.Lighting.ColorCorrection.TintColor = Color3.fromRGB(255, 255, 255)
	game.Lighting.ColorCorrection.Saturation = 0
	plr.Character:FindFirstChild("Humanoid").WalkSpeed = WS
	plr.Character:FindFirstChild("Humanoid").UseJumpPower = false
	plr.Character:FindFirstChild("Humanoid").JumpPower = JP
	script.TimeOFF:FireServer()
	script:Destroy()
	
	
	
	
end)

script.LE:FireServer(End)
		

script.LE.OnClientEvent:Connect(function(End)
	
	
	
	if End == true then
		
		for i,v in ipairs(ChCLs) do



			v:Destroy()



		end
		table.clear(ChCLs)

		game.Lighting.ColorCorrection.TintColor = Color3.fromRGB(255, 255, 255)
		game.Lighting.ColorCorrection.Saturation = 0
		plr.Character:FindFirstChild("Humanoid").WalkSpeed = WS
		plr.Character:FindFirstChild("Humanoid").UseJumpPower = false
		plr.Character:FindFirstChild("Humanoid").JumpPower = JP
		script.TimeOFF:FireServer()
		script:Destroy()
		
	end
	
end)




UserInputService.InputBegan:Connect(function(input,GPE)
	
	 
	if input.KeyCode == Enum.KeyCode.E and not GPE and lock == true and Using == false then
		
		lock = false
		TimeOut = true
		game.Lighting.ColorCorrection.Saturation = -1
	    onSound:Play()
		wait(0.1)
		game.Lighting.ColorCorrection.TintColor = Color3.fromRGB(8, 255, 247)
		
		
		local function CharacterClone()
			task.spawn(function()

				local ChCL = plr.Character:Clone()
				 table.insert(ChCLs, ChCL)
                 ChCL:FindFirstChild("Humanoid").DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
				
				local Highlight = Instance.new("Highlight",ChCL)
				Highlight.FillColor = Color3.fromRGB(0, 153, 255)
				Highlight.FillTransparency = 0
				Highlight.DepthMode = Enum.HighlightDepthMode.Occluded
				Highlight.OutlineColor = Color3.fromRGB(41, 237, 255)

				for i,v in pairs(ChCL:GetChildren()) do


					if  v.ClassName == "Part" then


						v.Anchored = true
						v.CanCollide = false
						v.CanTouch = false
						v.CanQuery = false
						if v.Name == "Head" then

							for i,t in ipairs(v:GetChildren()) do

								if t.ClassName == "Attachment" then
									if t:FindFirstChild("BillboardGui") then

										t:Destroy()
									end
								end
							end

						end
					elseif v.ClassName == "Script" or v.ClassName == "LocalScript" or v.ClassName == "Humanoid" then


						v:Destroy()

					end



				end
				ChCL.Parent = game.Workspace
				ChCL:PivotTo(plr.Character:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0,2,0))
				local lg = 3
			  local RunService = game:GetService("RunService")
				local CF = plr.Character:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0,1.5,lg) 
				local CP = plr.Character:FindFirstChild("HumanoidRootPart").Position
				local R
				
		

			 R = RunService.Heartbeat:Connect(function(dt)
					
					
			if Using == true or plr.Character:FindFirstChild("Humanoid").Health < 0 then
				
					R:Disconnect()
					
					
				end
			
					if ChCL ~= nil and Using == false and plr.Character:FindFirstChild("Humanoid").Health > 0 then
						
						
						ChCL:PivotTo(ChCL.PrimaryPart.CFrame:Lerp(CF,10 * dt))
				      		
					end
				
					
				
				

					
			
			  end)
			 

			end)
	  end
	   
	  script.TimeON:FireServer()
	
		 
	task.spawn(function()
			
		local Max = plr.PlayerGui.SkillBar.Frame.Energy.MaxA.Value
			local UseEN = 3

			for i=UseEN,Max do

				wait(0.1)
				if TimeOut == false or plr.PlayerGui.SkillBar.Frame.Energy.A.Value <= 0 then
				break
				
				elseif plr.PlayerGui.SkillBar.Frame.Energy.A.Value - UseEN < 0  then
					
					script.exTime:FireServer(UseEN)
				break
				end
				script.Time:FireServer(UseEN)
			end	
			
			if Using == false and lock == false then
			
				Using = true
				TimeOut = false
			
				wait(0.1)
			

				plr.Character:FindFirstChild("Humanoid").WalkSpeed = 5
				plr.Character:FindFirstChild("Humanoid").UseJumpPower = true
				plr.Character:FindFirstChild("Humanoid").JumpPower = 10
				for i,v in ipairs(ChCLs) do
					wait(0.0001)


					v:Destroy()




				end
				table.clear(ChCLs)
				game.Lighting.ColorCorrection.TintColor = Color3.fromRGB(255, 255, 255)
				game.Lighting.ColorCorrection.Saturation = -1
				offSound:Play()
				wait(0.1)  
				game.Lighting.ColorCorrection.Saturation = 0
				plr.Character:FindFirstChild("Humanoid").WalkSpeed = WS
				plr.Character:FindFirstChild("Humanoid").UseJumpPower = false
				plr.Character:FindFirstChild("Humanoid").JumpPower = JP
				script.TimeOFF:FireServer()




				wait(CoolTime)
				Using = false
				lock = true
			
		   end	
			
			
	  end)
	  
		while Using == false  do
			wait(0.1)
	
			
			if plr.Character:FindFirstChild("Humanoid").Health <= 0 then 
			   
				break
				end
			
			
		 if plr.Character:FindFirstChild("Humanoid").MoveDirection.Magnitude > 0   then
			
			CharacterClone()
			
		  end	
			
			
		end
	


	



	elseif   input.KeyCode == Enum.KeyCode.E and not GPE and lock == false  and Using == false  then
		
		Using = true
		TimeOut = false
	
		wait(0.1)
		
		
		
		plr.Character:FindFirstChild("Humanoid").WalkSpeed = 5
		plr.Character:FindFirstChild("Humanoid").UseJumpPower = true
		plr.Character:FindFirstChild("Humanoid").JumpPower = 10
		for i,v in ipairs(ChCLs) do
		wait(0.0001)
		
		
			v:Destroy()
		
		
			
			
		end
		table.clear(ChCLs)
		game.Lighting.ColorCorrection.TintColor = Color3.fromRGB(255, 255, 255)
		game.Lighting.ColorCorrection.Saturation = -1
		offSound:Play()
		wait(0.1)
		game.Lighting.ColorCorrection.Saturation = 0
	
		plr.Character:FindFirstChild("Humanoid").WalkSpeed = WS
		plr.Character:FindFirstChild("Humanoid").UseJumpPower = false
		plr.Character:FindFirstChild("Humanoid").JumpPower = JP
		script.TimeOFF:FireServer()

		
		

		wait(CoolTime)
	
		Using = false
		lock = true
	   
	end
	
	
       	
	 
	
	
	
end)