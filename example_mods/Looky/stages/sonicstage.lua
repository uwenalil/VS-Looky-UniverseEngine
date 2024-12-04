function onCreate()
	-- background shit
	makeLuaSprite('sky', 'sky', -300, -60);
	setLuaSpriteScrollFactor('sky', 0.1, 0.1);

	makeLuaSprite('floor2', 'floor2', -300, -180);
	setLuaSpriteScrollFactor('floor2', 0.8, 0.8);
	
	makeLuaSprite('floor1', 'floor1', -265, -100);
	setLuaSpriteScrollFactor('floor1', 1, 1);
	if not lowQuality then
	
		makeLuaSprite('HILLS', 'HILLS', -270, -110);
		setLuaSpriteScrollFactor('HILLS', 0.4, 0.4);
		
		makeLuaSprite('sticklol', 'sticklol', -357, -100);
		setLuaSpriteScrollFactor('sticklol', 1, 1);
		
		makeLuaSprite('eggman', 'eggman', -357, -100);
		setLuaSpriteScrollFactor('eggman', 1, 1);
		
		makeLuaSprite('knuckle', 'knuckle', 230, -100);
		setLuaSpriteScrollFactor('knuckle', 1, 1);
		
		makeLuaSprite('frontgrass', 'frontgrass', -300, -30);
		setLuaSpriteScrollFactor('frontgrass', 1.2, 1.2);
		
	end
	
	addLuaSprite('sky', false);
	addLuaSprite('HILLS', false);
	addLuaSprite('floor2', false);
	addLuaSprite('floor1', false);
	addLuaSprite('sticklol', false);
	addLuaSprite('eggman', false);
	addLuaSprite('knuckle', false);
	addLuaSprite('frontgrass', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end