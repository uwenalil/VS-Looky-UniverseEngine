function onEvent(n,v1,v2)


	if n == 'Flashes Camera' then

	   makeLuaSprite('flash', 'ffffff', 0, 0);
        makeGraphic('flash',1280,720,'ffffff')
	      addLuaSprite('flash', true);
	      setLuaSpriteScrollFactor('flash',0,0)
	      setProperty('flash.scale.x',3)
	      setProperty('flash.scale.y',3)
	      setProperty('flash.alpha',0)
		setProperty('flash.alpha',1)
		doTweenAlpha('flTw','flash',0,v1,'linear')
	end



end