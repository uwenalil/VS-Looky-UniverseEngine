-- The first event mabe by me(Scarlet Eye) --
function onEvent(name, value1, value2)
	if name == 'FlashTransparente' then
		if value1 then -- begining
		makeLuaSprite('flash', 'FlashTransparente', 0, 0)
	    setObjectCamera('flash', 'object')
	    setObjectOrder('flash', 5)
	    addLuaSprite('flash', true)
	    doTweenAlpha('flash', 'flash', 1, value1, 'quadInOut');
	end
	    if value2 then -- end
	    makeLuaSprite('flash', 'FlashTransparente', 0, 0)
	    setObjectCamera('flash', 'other')
	    setObjectOrder('flash', 5)
	    addLuaSprite('flash', true)
		doTweenAlpha('flash', 'flash', 0, value2, 'quadInOut');
	    end
	end
end