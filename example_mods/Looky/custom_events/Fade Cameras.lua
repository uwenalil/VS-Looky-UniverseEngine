local tweennumberuh = 0
local tweenduration = 1
local tweenease = 'linear'
function onEvent(name, v1,v2)
	if name == "Fade Cameras Part 2" then
		tweenduration = v1
		tweenease = v2
	end
	if name == "Fade Cameras" then
		doTweenAlpha('FadeShit'..tweennumberuh, v1, v2, tweenduration, tweenease);
		tweennumberuh = tweennumberuh + 1
	end
end