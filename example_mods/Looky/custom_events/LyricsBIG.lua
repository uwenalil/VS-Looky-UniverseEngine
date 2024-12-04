function onEvent(name, value1, value2)
    local var string = (value1)
    local var color = (value2)
    if name == "LyricsBIG" then

        makeLuaText('captions', 'Lyrics go here', 1500, -100, -50)
        setTextString('captions',  '' .. string)
        setTextFont('captions', 'vcr.ttf')
        setTextColor('FFFFFF', FFFFFF)
        setTextSize('captions', 350);
        addLuaText('captions')
	setObjectCamera('captions', 'object');
        setTextAlignment('captions', 'center')
        --removeLuaText('captions', true)
        
    end
end

