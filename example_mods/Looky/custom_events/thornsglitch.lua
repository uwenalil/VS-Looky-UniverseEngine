function onCreate()
	precacheSound('simplejumpsound');
	makeAnimatedLuaSprite('glitch', 'thornsglitch', -50, 0);
	setObjectCamera('glitch', 'camGame');
	setScrollFactor('glitch', 0, 0);
	scaleObject('creep', 45)
	addAnimationByPrefix('glitch', 'tssssssss', 'screenSTATIC', 40, true)
	setProperty('glitch.visible', false)
	addLuaSprite('glitch',true)
end

function onEvent(name, value1, value2)
    if name == "thornsglitch" then
		setProperty('glitch.alpha', value1);
		playSound('simplejumpsound', 0.7)
		setProperty('glitch.visible', true)
		runTimer('stat', value2);
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'stat' then
		setProperty('glitch.visible', false)
	end
end