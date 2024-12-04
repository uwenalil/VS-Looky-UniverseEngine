-- The first event mabe by me(Scarlet Eye) --
function onEvent(name, value1, value2)
	if name == 'REC' then
		if value1 then -- begining
		makeLuaSprite('REC', 'REC', 0, 0)
	    setObjectCamera('REC', 'camGame')
	    setObjectOrder('REC', 5)
   	    scaleObject('REC', 1)
	    addLuaSprite('REC', true)
	    doTweenAlpha('REC', 'REC', 1, value1, 'quadInOut');
	end
	    if value2 then -- end
	    makeLuaSprite('REC', 'REC', 0, 0)
	    setObjectCamera('REC', 'object')
	    setObjectOrder('REC', 5)
   	    scaleObject('REC', 1)
	    addLuaSprite('REC', true)
		doTweenAlpha('REC', 'REC', 0, value2, 'quadInOut');
	    end
	end
end