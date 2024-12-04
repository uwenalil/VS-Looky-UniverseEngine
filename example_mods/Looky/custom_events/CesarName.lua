function onEvent(name, value1, value2)
    local var string = (value1)
    local var color = (value2)
    if name == "CesarName" then

        makeLuaText('captions2', 'Lyrics go here', 1000, 415, 120)
        setTextString('captions2',  '' .. string)
        setTextFont('captions2', 'VCR_OSD_MONO_1.001.ttf')
        setTextColor('FFFFFF', FFFFFF)
        setTextSize('captions2', 35);
        addLuaText('captions2')
	setObjectCamera('captions2', 'object');
        setTextAlignment('captions2', 'center')
        --removeLuaText('captions', true)
        
    end
end

