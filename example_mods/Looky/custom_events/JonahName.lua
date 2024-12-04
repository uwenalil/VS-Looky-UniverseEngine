function onEvent(name, value1, value2)
    local var string = (value1)
    local var color = (value2)
    if name == "JonahName" then

        makeLuaText('captions3', 'Lyrics go here', 1000, 415, 335)
        setTextString('captions3',  '' .. string)
        setTextFont('captions3', 'VCR_OSD_MONO_1.001.ttf')
        setTextColor('FFFFFF', FFFFFF)
        setTextSize('captions3', 35);
        addLuaText('captions3')
	setObjectCamera('captions3', 'object');
        setTextAlignment('captions3', 'center')
        --removeLuaText('captions', true)
        
    end
end

