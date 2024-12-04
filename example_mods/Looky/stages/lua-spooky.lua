function onCreate()
	-- Sprites
	if not lowQuality then
		makeAnimatedLuaSprite('halloweenSKY', 'backgrounds/spooky/halloween_sky', -200, -100);
		addAnimationByPrefix('halloweenSKY', 'halloween_sky', 'halloweem sky0', 24, false);
		addAnimationByPrefix('halloweenSKY', 'halloweem sky lightning strike', 'halloweem sky lightning strike', 24, false);
		setLuaSpriteScrollFactor('halloweenSKY', 1.0, 1.0);
		
		makeAnimatedLuaSprite('halloweenCLOUDS', 'backgrounds/spooky/halloween_clouds', -400, -100);
		addAnimationByPrefix('halloweenCLOUDS', 'halloween_clouds', 'halloweem clouds0', 24, false);
		addAnimationByPrefix('halloweenCLOUDS', 'halloweem clouds lightning strike', 'halloweem clouds lightning strike', 24, false);
		setProperty('halloweenCLOUDS.velocity.x', 5);
		
		makeAnimatedLuaSprite('halloweenCLOUDS2', 'backgrounds/spooky/halloween_clouds', -1200, -100);
		addAnimationByPrefix('halloweenCLOUDS2', 'halloween_clouds', 'halloweem clouds0', 24, false);
		addAnimationByPrefix('halloweenCLOUDS2', 'halloweem clouds lightning strike', 'halloweem clouds lightning strike', 24, false);
		setProperty('halloweenCLOUDS2.velocity.x', 5);
		
		makeAnimatedLuaSprite('halloweenTREE', 'backgrounds/spooky/halloween_tree', -200, -100);
		addAnimationByPrefix('halloweenTREE', 'halloween_tree', 'halloweem tree0', 24, false);
		addAnimationByPrefix('halloweenTREE', 'halloweem tree lightning strike', 'halloweem tree lightning strike', 24, false);
		setLuaSpriteScrollFactor('halloweenTREE', 0.9, 0.9);
		
		makeAnimatedLuaSprite('halloweenBG', 'backgrounds/spooky/halloween_bg', -200, -100);
		addAnimationByPrefix('halloweenBG', 'halloween_bg', 'halloweem bg0', 24, false);
		addAnimationByPrefix('halloweenBG', 'halloweem bg lightning strike', 'halloweem bg lightning strike', 24, false);
		
				makeAnimatedLuaSprite('halloweenSTAIRS', 'backgrounds/spooky/halloween_stairs', -380, -100);
		addAnimationByPrefix('halloweenSTAIRS', 'halloween_stairs', 'halloweem stairs0', 24, false);
		addAnimationByPrefix('halloweenSTAIRS', 'halloweem stairs lightning strike', 'halloweem stairs lightning strike', 24, false);
		setLuaSpriteScrollFactor('halloweenSTAIRS', 0.9, 0.9);
	else
		makeLuaSprite('halloweenBG', 'backgrounds/spooky/halloween_bg_low', -200, -100);
	end
	
	makeLuaSprite('halloweenWhite', nil, -200, -100)
	setScrollFactor('halloweenWhite', 0, 0)
	makeGraphic('halloweenWhite', screenWidth * 3, screenHeight * 3, 'FFFFFF')
	setProperty('halloweenWhite.alpha', 0)
	setBlendMode('halloweenWhite', 'add')
	
	-- Adding
	addLuaSprite('halloweenSKY', false);
	addLuaSprite('halloweenCLOUDS', false);
	addLuaSprite('halloweenCLOUDS2', false);
	addLuaSprite('halloweenTREE', false);
	addLuaSprite('halloweenBG', false);
	addLuaSprite('halloweenSTAIRS', true);
	addLuaSprite('halloweenWhite', true);
	
	-- Precaching
	precacheSound('thunder_1')
	precacheSound('thunder_2')
end

local lightningStrikeBeat = 0
local lightningOffset = 8
function onBeatHit()
	if getRandomBool(10) and curBeat > lightningStrikeBeat + lightningOffset then
		lightningStrikeShit()
	end
end

function lightningStrikeShit()
	lightningStrikeBeat = curBeat
	lightningOffset = getRandomInt(8, 24)
	if not lowQuality then
		objectPlayAnimation('halloweenSKY', 'halloweem sky lightning strike')
		objectPlayAnimation('halloweenCLOUDS', 'halloweem clouds lightning strike')
		objectPlayAnimation('halloweenCLOUDS2', 'halloweem clouds lightning strike')
		objectPlayAnimation('halloweenTREE', 'halloweem tree lightning strike')
		objectPlayAnimation('halloweenBG', 'halloweem bg lightning strike')
		objectPlayAnimation('halloweenSTAIRS', 'halloweem stairs lightning strike')
		end
	soundName = string.format('thunder_%i', getRandomInt(1, 2));
	playSound(soundName, 1, 'thunder_%i');
	characterPlayAnim('gf', 'scared');
	characterPlayAnim('boyfriend', 'scared');
	if cameraZoomOnBeat then
		setProperty('camGame.zoom', getProperty('camGame.zoom') + 0.015)
		setProperty('camHUD.zoom', getProperty('camHUD.zoom') + 0.03)
		
		if not getProperty('camZooming') then
			doTweenZoom('cG', 'camGame', getProperty('defaultCamZoom'), 0.5, 'linear')
			doTweenZoom('cH', 'camHUD', 1, 0.5, 'linear')
		end
	end
	if flashingLights then
		setProperty('halloweenWhite.alpha', 0.4)
		doTweenAlpha('hWA', 'halloweenWhite', 0.5, 0.075, 'linear')
	end
end

function onTweenCompleted(t)
	if t == 'hWA' then
		doTweenAlpha('hWA0', 'halloweenWhite', 0, 0.25, 'linear')
	end
end