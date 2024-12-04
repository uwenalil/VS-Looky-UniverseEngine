function onCreate()
	-- background shit
	makeLuaSprite('stageback', 'backgrounds/stage/stageback', -900, -800);
	scaleObject('stageback', 1.3, 1.3);

	makeLuaSprite('stagefront', 'backgrounds/stage/stagefront', -1300, 500);
	scaleObject('stagefront', 1.6, 1.6);

	makeLuaSprite('stagecurtains', 'backgrounds/stage/stagecurtains', -1400, -900);
	setLuaSpriteScrollFactor('stagecurtains', 1.3, 1.3);
	scaleObject('stagecurtains', 1.7, 1.7);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('stagelight_left', 'backgrounds/stage/stage_light', -425, -800);
		setLuaSpriteScrollFactor('stagelight_left', 1.9, 1.9);
		scaleObject('stagelight_left', 2.1, 2.1);
		
		makeLuaSprite('stagelight_right', 'backgrounds/stage/stage_light', 1525, -800);
		setLuaSpriteScrollFactor('stagelight_right', 1.9, 1.9);
		scaleObject('stagelight_right', 2.1, 2.1);
		setPropertyLuaSprite('stagelight_right', 'flipX', true); --mirror sprite horizontally

		makeAnimatedLuaSprite('audience_front', 'backgrounds/stage/audience_front', -1200, -500);
        	luaSpriteAddAnimationByPrefix('audience_front', 'audience_front', 'frontbop', '28')
		setLuaSpriteScrollFactor('audience_front', 0.9, 0.9);
		scaleObject('audience_front', 1.5, 1.5);

		makeAnimatedLuaSprite('audience_mid', 'backgrounds/stage/audience_mid', -1200, -500);
        	luaSpriteAddAnimationByPrefix('audience_mid', 'audience_mid', 'midbop', '14')
		setLuaSpriteScrollFactor('audience_mid', 0.9, 0.9);
		scaleObject('audience_mid', 1.5, 1.5);

		makeAnimatedLuaSprite('audience_back', 'backgrounds/stage/audience_back', -1200, -500);
        	luaSpriteAddAnimationByPrefix('audience_back', 'audience_back', 'backbop', '24')
		setLuaSpriteScrollFactor('audience_back', 0.9, 0.9);
		scaleObject('audience_back', 1.5, 1.5);
	end

	addLuaSprite('stageback', false);
	addLuaSprite('stagefront', false);
	addLuaSprite('suitcase', false);
	addLuaSprite('stagecurtains', false);
	addLuaSprite('stagelight_left', false);
	addLuaSprite('stagelight_right', false);
	addLuaSprite('audience_front', true);
	addLuaSprite('audience_mid', true);
	addLuaSprite('audience_back', true);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end