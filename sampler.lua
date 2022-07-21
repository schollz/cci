local Sampler={}

function Sampler:new(o)
  o=o or {}
  setmetatable(o,self)
  self.__index=self
  o:init()
  return o
end

function Sampler:set_sample_volume(fname,db)
  engine.sample_set(fname,"db",db)
end

function Sampler:play_loop(fname)
  local fade=0.005
  engine.sample_play(fname,fade,1)
end

function Sampler:stop_loop(fname)
  local fade=0.005
  engine.sample_stop(fname,fade)
end

function Sampler:linear_fade_out(fname,fade)
  engine.sample_stop(fname,fade)
end

function Sampler:linear_fade_in(fname,fade)
  engine.sample_play(fname,fade,0)
end

function Sampler:play_oneshot(fname)
  local fade=0.005
  engine.sample_play(fname,fade,0)
end


return Sampler