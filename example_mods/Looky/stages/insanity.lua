function onCreate()
	makeLuaSprite('bgFIX', 'bgFIX', -100, -607);
	setGraphicSize('bgFIX', getProperty('bgFIX.width') * 6);
	setProperty('bgFIX.antialiasing', false)

	makeLuaSprite('fg', 'fg', -100, -607);
	setGraphicSize('fg', getProperty('fg.width') * 6);
	setProperty('fg.antialiasing', false)
	
	makeLuaSprite('sonicDead', 'sonicDead', 760, 650);
	setGraphicSize('sonicDead', getProperty('sonicDead.width') * 6);
	setProperty('sonicDead.antialiasing', false)

	makeLuaSprite('bars', 'bars', 0, 0);
	setProperty('bars.antialiasing', false)
	setObjectCamera('bars', 'other')
	
	makeLuaSprite('tails', 'tails', 0, 0);
	setProperty('tails.antialiasing', false)
	setObjectCamera('tails', 'other')

	addLuaSprite('bgFIX', false);
	addLuaSprite('fg', false);
	addLuaSprite('sonicDead', true);
	addLuaSprite('bars', true);
	addLuaSprite('tails', true);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end