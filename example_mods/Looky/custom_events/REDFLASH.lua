function onEvent(n,v1,v2)


	if n == 'REDFLASH' then

	   makeLuaSprite('flash', 'ff0000', 0, 0);
        makeGraphic('flash',1280,720,'ff0000')
	      addLuaSprite('flash', true);
	      setObjectCamera('flash', 'camGame')
	      setLuaSpriteScrollFactor('flash',0,0)
	      setProperty('flash.scale.x',3)
	      setProperty('flash.scale.y',3)
	      setProperty('flash.alpha',0)
		setProperty('flash.alpha',1)
		doTweenAlpha('flTw','flash',0,v1,'linear')
	end



end