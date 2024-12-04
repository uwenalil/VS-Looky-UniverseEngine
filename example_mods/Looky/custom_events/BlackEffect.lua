-- The first event mabe by me(Scarlet Eye) --
function onEvent(name, value1, value2)
	if name == 'BlackEffect' then
		if value1 then -- begining
		makeLuaSprite('black', 'Black', 0, 0)
	    setObjectCamera('black', 'object')
	    setObjectOrder('black', 5)
	    addLuaSprite('black', true)
	    doTweenAlpha('black', 'black', 1, value1, 'quadInOut');
	end
	    if value2 then -- end
	    makeLuaSprite('black', 'Black', 0, 0)
	    setObjectCamera('black', 'other')
	    setObjectOrder('black', 5)
	    addLuaSprite('black', true)
		doTweenAlpha('black', 'black', 0, value2, 'quadInOut');
	    end
	end
end