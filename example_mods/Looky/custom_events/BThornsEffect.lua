-- The first event mabe by me(Scarlet Eye) --
function onEvent(name, value1, value2)
	if name == 'BThornsEffect' then
		if value1 then -- begining
		makeLuaSprite('P', 'Bthornseffect', -360, -320)
	    setObjectCamera('P', 'camGame')
	    setObjectOrder('P', 5)
	    scaleObject('P', 2,2)
	    addLuaSprite('P', true)
	    doTweenAlpha('P', 'B', 1, value1, 'quadInIn');
	end
	    if value2 then -- end
	    makeLuaSprite('P', 'Bthornseffect', -360, -320)
	    setObjectCamera('P', 'camGame')
	    setObjectOrder('P', 5)
	    scaleObject('P', 2,2)
	    addLuaSprite('P', true)
		doTweenAlpha('P', 'P', 0, value2, 'quadInOut');
	    end
	end
end