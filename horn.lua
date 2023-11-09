local horn = {}

-- Play a little tune on the horn
horn.play_tune = function ()
local count = 0;
while count <= 162 do
  gui.text(17,55,"Score: " .. memory.readbyte(0x7137))
  -- "Thanks"
  if count < 2 then
	count = count + 1
	joypad.set({Start=true}, 1)
  elseif count < 30 then
	count = count + 1
	joypad.set({Start=false}, 1)

  -- "for the"
  elseif count < 32 then
	count = count + 1
	joypad.set({Start=true}, 1)
  elseif count < 45 then
	count = count + 1
	joypad.set({Start=false}, 1)
  elseif count < 47 then
	count = count + 1
	joypad.set({Start=true}, 1)
  elseif count < 60 then
	count = count + 1
	joypad.set({Start=false}, 1)
	
  -- "donut"	
  elseif count < 62 then
	count = count + 1
	joypad.set({Start=true}, 1)
  elseif count < 90 then
	count = count + 1
	joypad.set({Start=false}, 1)
  elseif count < 92 then
	count = count + 1
	joypad.set({Start=true}, 1)
  elseif count < 120 then
	count = count + 1
	joypad.set({Start=false}, 1)
	
  -- "goodbye"
  elseif count < 122 then
	count = count + 1
	joypad.set({B=true}, 1)
  elseif count < 148 then
	count = count + 1
	joypad.set({B=false}, 1)
  elseif count < 150 then
	count = count + 1
	joypad.set({B=true}, 1)
  elseif count < 163 then
	count = count + 1
	joypad.set({B=false}, 1)
  end 

  emu.frameadvance()
end
end

-- 1/3600 chance to play horn each frame
--horn.get_horn_decision = function ()
--  local rando = math.random(360000)
--  if rando % 3600 == 1 then
--	return true
--  else
--	return false
--  end
--end

-- Listens for someone to press start
horn.get_horn_decision = function ()
  return input.get()["J1 B6"]
end

return horn