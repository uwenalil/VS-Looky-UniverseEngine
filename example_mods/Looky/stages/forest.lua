function onCreate()
	-- background smurf

	makeLuaSprite('forest', 'smurfBG', -980, -1250);
	scaleObject('forest', 0.8, 0.8); 

	makeLuaSprite('arbu', 'arbustos', -980, -1250);
	scaleObject('arbu', 0.8, 0.8); 

	addLuaSprite('forest', false);
	addLuaSprite('arbu', false);

	setProperty('camZooming', true)
end