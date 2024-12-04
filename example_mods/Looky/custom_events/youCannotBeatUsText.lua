-- SETTINGS --

borderThing = 0
-- 0 is default for YCBU Text, just like Unbeatable. If you wish to make it borderness, make it to 1!
-- The highest you can do is 4.

setFont = "PressStart2P.ttf"
-- Only fonts it has (in default) is PressStart2P.ttf and Pixel Emulator.otf, you can add multiple fonts too!

setY = 480 -- 480 is default.
-- If you think that the font you put seems to be wrong, you need to adjust the font Y.

setSize = 40 -- 40 is default for NES.
-- If you think that the font you put seems to be wrong, you need to adjust the font size.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------

function onCreate()
	  makeLuaSprite('blackLYRIC', 'blackLYRIC', 0, 0);
        makeGraphic('blackLYRIC',1280, 100, '000000')
	  addLuaSprite('blackLYRIC', false);
        setObjectCamera('blackLYRIC', 'other');
	setProperty('blackLYRIC.y', 450)
	setProperty('blackLYRIC.alpha', 0)

	makeLuaText('ONE LYRIC AND YOURE GONE', (value1), 1250, 0, setY)
	setTextAlignment('ONE LYRIC AND YOURE GONE', 'center')
	addLuaText('ONE LYRIC AND YOURE GONE')
	setTextSize('ONE LYRIC AND YOURE GONE', setSize)
	setTextFont('ONE LYRIC AND YOURE GONE', setFont)
    	setTextBorder('ONE LYRIC AND YOURE GONE', borderThing, '000000')
	setObjectCamera('ONE LYRIC AND YOURE GONE', "other")
end

function onEvent(name, value1, value2)
	if name == 'youCannotBeatUsText' then
		setTextString('ONE LYRIC AND YOURE GONE', (value1));
		setProperty('blackLYRIC.alpha', 0.3)
		setTextColor('ONE LYRIC AND YOURE GONE', "F77E63");
		runTimer('whitey', 0.1)
	end

	if value1 == ' ' then
	setProperty('blackLYRIC.alpha', 0)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'whitey' then
	setTextColor('ONE LYRIC AND YOURE GONE', "FFFFFF");
	end
end