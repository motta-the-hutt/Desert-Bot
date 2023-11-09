local wheel = {}

local addr_drift = 0x6FFA
local bad_drift = 0x88

local left_safety_rail = 0x42
local right_safety_rail = 0x8A

wheel.is_drift_bad = function ()
  if memory.readbyte(addr_drift) > right_safety_rail then
    return true
  end
  
  return false
end

wheel.update_drift = function ()
  local input = input.get()
  if input["J1 B5"] and bad_drift < right_safety_rail then
	--bad_drift = bad_drift + 0x01
	joypad.set({A=true, Right=true}, 1)
  end
  if input["J1 B4"] and bad_drift > left_safety_rail then
	--bad_drift = bad_drift - 0x01
	joypad.set({A=true, Left=true}, 1)
  end
end

return wheel