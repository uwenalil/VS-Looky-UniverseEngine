-- The first event mabe by me(Scarlet Eye) --
function onEvent(name, value1, value2)
	if name == 'ThornsEffect' then
		if value1 then -- begining
		makeLuaSprite('T', 'thornseffect', -360, -320)
	    setObjectCamera('T', 'camGame')
	    setObjectOrder('T', 5)
	    scaleObject('T', 2,2)
	    addLuaSprite('T', true)
	    doTweenAlpha('T', 'T', 1, value1, 'quadInIn');
	end
	    if value2 then -- end
	    makeLuaSprite('T', 'thornseffect', -360, -320)
	    setObjectCamera('T', 'camGame')
	    setObjectOrder('T', 5)
	    scaleObject('T', 2,2)
	    addLuaSprite('T', true)
		doTweenAlpha('T', 'T', 0, value2, 'quadInOut');
	    end
	end
end