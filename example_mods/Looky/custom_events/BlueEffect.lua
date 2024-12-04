-- The first event mabe by me(Scarlet Eye) --
function onEvent(name, value1, value2)
	if name == 'BlueEffect' then
		if value1 then -- begining
		makeLuaSprite('B', 'BlueEffect', -360, -320)
	    setObjectCamera('B', 'camGame')
	    setObjectOrder('B', 5)
	    scaleObject('B', 2,2)
	    addLuaSprite('B', true)
	    doTweenAlpha('B', 'B', 1, value1, 'quadInIn');
	end
	    if value2 then -- end
	    makeLuaSprite('B', 'BlueEffect', -360, -320)
	    setObjectCamera('B', 'camGame')
	    setObjectOrder('B', 5)
	    scaleObject('B', 2,2)
	    addLuaSprite('B', true)
		doTweenAlpha('B', 'B', 0, value2, 'quadInOut');
	    end
	end
end