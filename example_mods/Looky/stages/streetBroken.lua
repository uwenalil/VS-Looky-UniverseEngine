function onCreate()

	makeLuaSprite('BG', 'suicideStreet/streetBroken', -1000, -200)
	scaleLuaSprite('BG', 1, 1)
	setScrollFactor('BG', 1, 1)
	addLuaSprite('BG', false)

	makeAnimatedLuaSprite('Filter', 'suicideStreet/filter', 0, 0)
	addAnimationByPrefix('Filter', 'filter', 'pantalla', 24, true);
	playAnim('Filter', 'filter', true);
	scaleLuaSprite('Filter', 0.75, 0.75)
	setScrollFactor('Filter', 1, 1)
	setObjectCamera('Filter', 'other');
	addLuaSprite('Filter', false)
end
