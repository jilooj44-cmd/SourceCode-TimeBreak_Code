local TimeStopM = {}


local function TimeStopM(Type,An,Target,gyro,TimeScale,Power,TimeStop,plr)
	
	
if plr ~= nil then
	
		if Type == "RunService" and plr.TimeStop.Value == true then

			TimeScale = 0.3

			return TimeScale

		elseif Type == "RunService" and plr.TimeStop.Value == false then
			
			TimeScale = 1

			return TimeScale

		end







		if Type == "BodyVelocity" and plr.TimeStop.Value == true  then

			An.Velocity = Target * Power * 3/10


		elseif Type == "BodyVelocity" and plr.TimeStop.Value == false then

			An.Velocity = Target * Power

		end


	end

end
	



return TimeStopM
