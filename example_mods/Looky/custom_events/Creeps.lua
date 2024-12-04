function onCreate()
	precacheSound('simplejumpsound');
	makeAnimatedLuaSprite('creep', 'screenstatic', 0, 0);
	setObjectCamera('creep', 'other');
	setScrollFactor('creep', 0, 0);
	addAnimationByPrefix('creep', 'tssssssss', 'screenSTATIC', 40, true)
	setProperty('creep.visible', false)
	addLuaSprite('creep',true)
end

function onEvent(name, value1, value2)
    if name == "Creeps" then
		setProperty('creep.alpha', value1);
		playSound('simplejumpsound', 0.7)
		setProperty('creep.visible', true)
		runTimer('stat', value2);
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'stat' then
		setProperty('creep.visible', false)
	end
end