-- The first event mabe by me(Scarlet Eye) --
function onEvent(name, value1, value2)
	if name == 'DarkEffect' then
		if value1 then -- begining
		makeLuaSprite('D', 'Effect', -360, -320)
	    setObjectCamera('D', 'camGame')
	    setObjectOrder('D', 5)
	    scaleObject('D', 2,2)
	    addLuaSprite('D', true)
	    doTweenAlpha('D', 'D', 1, value1, 'quadInIn');
	end
	    if value2 then -- end
	    makeLuaSprite('D', 'Effect', -360, -320)
	    setObjectCamera('D', 'camGame')
	    setObjectOrder('D', 5)
	    scaleObject('D', 2,2)
	    addLuaSprite('D', true)
		doTweenAlpha('D', 'D', 0, value2, 'quadInOut');
	    end
	end
end