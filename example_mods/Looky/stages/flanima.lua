local directory = 'backgrounds/flanima/';

function onCreate()
	luaDebugMode = true;
	makeLuaSprite('wall', directory..'wall', -600, -300);
	addLuaSprite('wall', false);
	
	makeLuaSprite('floor', directory..'floor', -780, -250);
	scaleObject('floor', 1.1, 1.1);
	addLuaSprite('floor', false);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('spotlights', directory..'spotlights', -625, -150);
		setProperty('spotlights.visible', false);
		addLuaSprite('spotlights', true);

		makeLuaSprite('curtains', directory..'curtains', -500, -200);
		setScrollFactor('curtains', 1.3, 1.3);
		scaleObject('curtains', 0.9, 0.9);
		setProperty('curtains.visible', false);
		addLuaSprite('curtains', true);
	end

	makeLuaSprite('noway', nil, -600, -300);
	makeGraphic('noway', 2600, 1600, 'CBFD56');
	addLuaSprite('noway', false);

	makeLuaSprite('loading', directory..'loading', 1150, 880);
	addLuaSprite('loading', true);
end