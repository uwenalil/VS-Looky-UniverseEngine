-- The first event mabe by me(Scarlet Eye) --
function onEvent(name, value1, value2)
	if name == 'EncounterWINDOWLIGHT' then
		if value1 then -- begining
		makeLuaSprite('WL', 'WINDOWLIGHT', 0, -320)
	    setObjectCamera('WL', 'object')
	    setObjectOrder('WL', 10)
	    scaleObject('WL', 0.5)
	    addLuaSprite('WL', true)
	    doTweenAlpha('WL', 'B', 1, value1, 'quadInIn');
	end
	    if value2 then -- end
	    makeLuaSprite('WL', 'WINDOWLIGHT', -360, -320)
	    setObjectCamera('WL', 'object')
	    setObjectOrder('WL', 10)
	    scaleObject('WL', 0.5)
	    addLuaSprite('WL', true)
		doTweenAlpha('WL', 'WL', 0, value2, 'quadInOut');
	    end
	end
end