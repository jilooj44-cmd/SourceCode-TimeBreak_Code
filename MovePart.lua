local SKill1 = {}




local function SKill1(Part,plr,TimeScale)
	local Skill2 = require(script.Parent.SKill2)
	local RunService = game:GetService("RunService")
	local TimeStopM = require(game.ReplicatedStorage.TimeStopM)
	local OutTime = 3
	local Speed = 35
	local Speed2 = Speed/2
	local lock = true
	local TimeStopBall = false
	local A 
	local TouchH = false
	local Lock = true
	local lock2 = true
	
	
	Part.Touched:Connect(function(hit)
		
		
		if hit.Parent:FindFirstChild("Humanoid") and lock == true then
			 
			hit.Parent:FindFirstChild("Humanoid").Health = 0
			
		end
		
	end)
	
	A = RunService.Heartbeat:Connect(function(dt)
        
		if TimeStopBall == true then return end

          
		if lock == true then



			if plr ~= nil then

				TimeScale =	TimeStopM("RunService",nil,nil,nil,TimeScale,nil,nil,plr)
			end
           
			Part.Size = Part.Size + Vector3.new(Speed * dt * TimeScale,0,0)
			Part.CFrame = Part.CFrame * CFrame.new(Speed2 * dt * TimeScale,0,0)
		


			if Part.Size.X > 38.8 then
                
				lock = false
				TouchH = true
			 

			end		
		elseif lock == false then
			
		
			task.delay(3,function()
				
			end)
			
				if plr ~= nil then

					TimeScale =	TimeStopM("RunService",nil,nil,nil,TimeScale,nil,nil,plr)
				end
                 
				Part.Size = Part.Size + Vector3.new(-Speed * dt * TimeScale,0,0)
				Part.CFrame = Part.CFrame * CFrame.new(-Speed2 * dt * TimeScale,0,0)

				if Part.Size.X < 20.2  then
					A:Disconnect()



				end
		
	
		end	
	end)

 task.spawn(function()
		if Part.Parent.Name == "P1"  then

			while TouchH == false do
				wait()
			
			end
			
		script.Parent.Parent.Touched:Connect(function(hit)
			
			if hit.Parent:FindFirstChild("Humanoid") and lock2 == true then
				lock2 = false
					script.Parent.Parent.Parent.Skillex1.Transparency = 0
					script.Parent.Parent.Parent.Skillex1.CanCollide = true
					Skill2(script.Parent.Parent.Parent["P1[2]"].Part,plr,TimeScale)
			end
			
			
		end)	

			


		end


 end)
 
end


return SKill1
