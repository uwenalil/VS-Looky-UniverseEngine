-- The first event mabe by me(Scarlet Eye) --
function onEvent(name, value1, value2)
	if name == 'ENCLogo' then
		if value1 then -- begining
		makeLuaSprite('red', 'ENCOUNTERZMIXED', 0, 0)
	    setObjectCamera('red', 'object')
	    setObjectOrder('red', 5)
	    addLuaSprite('red', true)
	    doTweenAlpha('red', 'Red', 1, value1, 'quadInOut');
	end
	    if value2 then -- end
	    makeLuaSprite('red', 'ENCOUNTERZMIXED', 0, 0)
	    setObjectCamera('red', 'other')
	    setObjectOrder('red', 5)
	    addLuaSprite('red', true)
		doTweenAlpha('red', 'red', 0, value2, 'quadInOut');
	    end
	end
end