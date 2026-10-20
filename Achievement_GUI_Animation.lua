local Achievement= {}


local function Achievement(Gui)
	
	
	local TweenService = game:GetService("TweenService")
	local tweenInfoGui = TweenInfo.new(1.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, 0, false, 0)
	local A = {

		Size = UDim2.new(0, 402,0, 137),
		Position = UDim2.new(0.771, 0,0.774, 0)

	}
	local B = {

		Size = UDim2.new(0, 0,0, 137),
		Position = UDim2.new(1, 0,0.774, 0)


	}
 task.spawn(function()	
	
	Gui.Frame.Size = UDim2.new(0, 0,0, 137)
		Gui.Frame.Position = UDim2.new(1, 0,0.774, 0)
		
	local Anim1 = TweenService:Create(Gui.Frame, tweenInfoGui, A):Play()

	 wait(2.5)
	 
	 local Anim2 = TweenService:Create(Gui.Frame, tweenInfoGui, B):Play()

      game.Debris:AddItem(Gui,1.5)
	end)
end

return Achievement
