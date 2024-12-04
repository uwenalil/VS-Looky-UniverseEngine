function onCreate()
	-- background shit

	makeLuaSprite('back', 'encounter bg/back', -80, -150);
	scaleObject('back', 1.2, 1.2);
	addLuaSprite('back', false);

	makeLuaSprite('Door1', 'encounter bg/Door1', -25, -80);
	scaleObject('Door1', 1.05, 1.1);
	addLuaSprite('Door1', false);

	makeLuaSprite('Door2', 'encounter bg/Door2', -25, -80);
	scaleObject('Door2', 1.05, 1.1);
	addLuaSprite('Door2', false);
	doTweenAlpha('door2Gone', 'Door2', 0, 0.001, linear)

	makeLuaSprite('Door3', 'encounter bg/Door3', -25, -80);
	scaleObject('Door3', 1.05, 1.1);
	addLuaSprite('Door3', false);
	doTweenAlpha('door3Gone', 'Door3', 0, 0.001, linear)

	makeLuaSprite('doorOpen', 'encounter bg/DoorOpen', -25, -80);
	scaleObject('doorOpen', 1.05, 1.1);
	addLuaSprite('doorOpen', false);
	doTweenAlpha('door4Gone', 'doorOpen', 0, 0.001, linear)

	makeLuaSprite('win1', 'encounter bg/Window1', 100, -60);
	addLuaSprite('win1', false);

	makeLuaSprite('win2', 'encounter bg/Window2', 100, -60);
	addLuaSprite('win2', false);
	doTweenAlpha('win2Gone', 'win2', 0, 0.001, linear)

	makeAnimatedLuaSprite('police', 'encounter bg/PoliceLights', 360, -20);
	scaleObject('police', 0.8, 0.8);
	addLuaSprite('police', false);
	addAnimationByPrefix('police', 'a', 'lights', 15, true);
	addAnimationByPrefix('police', 'idle', 'lights0000', 15, true);
	doTweenAlpha('policeGone', 'police', 0, 0.0001, linear);
	objectPlayAnimation('police','idle',false)

	makeLuaSprite('cor', 'encounter bg/Curtains', 50, -100);
	scaleObject('cor', 1.05, 1.1);
	addLuaSprite('cor', false);

	makeLuaSprite('co', 'encounter bg/Coach', 250, -100);
	scaleObject('co', 1.05, 1.1);
	addLuaSprite('co', false);

end


