-- The first event mabe by me(Scarlet Eye) --
function onEvent(name, value1, value2)
	if name == 'AltEffect' then
		if value1 then -- begining
		makeLuaSprite('Alt', 'AlternateEFFECT', 0, 0)
	    setObjectCamera('Alt', 'object')
	    setObjectOrder('Alt', 5)
	    addLuaSprite('Alt', true)
	    doTweenAlpha('Alt', 'Alt', 1, value1, 'quadInOut');
	end
	    if value2 then -- end
	    makeLuaSprite('Alt', 'AlternateEFFECT', 0, 0)
	    setObjectCamera('Alt', 'other')
	    setObjectOrder('Alt', 5)
	    addLuaSprite('Alt', true)
		doTweenAlpha('Alt', 'Alt', 0, value2, 'quadInOut');
	    end
	end
end