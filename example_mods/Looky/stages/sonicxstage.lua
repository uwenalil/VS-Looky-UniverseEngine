function onCreate()
	-- background shit
	makeLuaSprite('xsky', 'xsky', -1400, -580);
	setLuaSpriteScrollFactor('xsky', 0.1, 0.1);
	scaleObject('xsky', 0.77, 0.77);
	
	makeLuaSprite('HILLS', 'HILLS', -270, -180);
	setLuaSpriteScrollFactor('HILLS', 0.4, 0.4);
	
	makeLuaSprite('xhills', 'xhills', -270, -180);
	setLuaSpriteScrollFactor('xhills', 0.55, 0.4);
	
	makeLuaSprite('xfloor', 'xfloor', -330, -84);
	setLuaSpriteScrollFactor('xfloor', 1, 1);
	
	makeLuaSprite('xflowey', 'xflowey', -330, -114);
	setLuaSpriteScrollFactor('xflowey', 1, 1);
	
	makeLuaSprite('xflowey1', 'xflowey1', -740, 120);
	setLuaSpriteScrollFactor('xflowey1', 1, 1);
	
	if not lowQuality then

	makeAnimatedLuaSprite('xhands', 'xhands', 200, -62);
	luaSpriteAddAnimationByPrefix('xhands', 'HandsAnimated', 'HandsAnimated'); 
	setLuaSpriteScrollFactor('xhands', 1, 1);
	scaleObject('xhands', 0.45, 0.45);
		
	makeAnimatedLuaSprite('xeye', 'xeye', -100, 300);
	luaSpriteAddAnimationByPrefix('xeye', 'EyeAnimated', 'EyeAnimated'); 
	setLuaSpriteScrollFactor('xeye', 1, 1);
	scaleObject('xeye', 1.5, 1.5);
		
	makeAnimatedLuaSprite('xtreea', 'xtreea', 1100, -180);
	luaSpriteAddAnimationByPrefix('xtreea', 'TreeAnimated', 'TreeAnimated'); 
	setLuaSpriteScrollFactor('xtreea', 1, 1);
	scaleObject('xtreea', 1.6, 1.6);
		
	end
	
	addLuaSprite('xsky', false);
	addLuaSprite('HILLS', false);
	addLuaSprite('xhills', false);
	addLuaSprite('xfloor', false);
	addLuaSprite('xflowey', false);
	addLuaSprite('xflowey1', false);
	addLuaSprite('xhands', false);
	addLuaSprite('xtreea', false);
	addLuaSprite('xeye', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end