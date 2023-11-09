memory.usememorydomain("68K RAM")

local HORN = require "horn"
local WHEEL = require "wheel"

local addr_distance = 0x6FDC
local target_distance = 0x09E340
local addr_score_timer = 0x7139
local driving = true
local press_start = false

local function reached_target()
  if memory.read_u32_be(addr_distance) == target_distance then
    driving = false
  end
end

local function start_next_trip()
  if memory.readbyte(addr_score_timer) == 1 then
    joypad.set({Start=true}, 1)
    press_start = true
  end

  if press_start and memory.readbyte(addr_score_timer) == 0 then
    joypad.set({Start=true}, 1)
    driving = true
    press_start = false
  end
end

while true do

  gui.text(17,55,"Score: " .. memory.readbyte(0x7137))

  if driving then
    if WHEEL.is_drift_bad() then
      joypad.set({A=true, Left=true}, 1)
	elseif HORN.get_horn_decision() then
	  HORN.play_tune()
    else
      joypad.set({A=true, Left=false}, 1)
    end
	WHEEL.update_drift()
    reached_target()
  else
    start_next_trip()
  end
  --console.write(joypad.get())
  emu.frameadvance()
end

