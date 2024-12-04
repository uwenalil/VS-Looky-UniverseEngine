function onCreate()
	-- background shit
	makeLuaSprite('SunkBG', 'SunkBG', -470, -300);
	setLuaSpriteScrollFactor('SunkBG', 1, 1);
		
	
	addLuaSprite('SunkBG', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end