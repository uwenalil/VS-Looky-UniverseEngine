function onEvent(name, value1, value2)
    local var string = (value1)
    local var color = (value2)
    if name == "MarkName" then

        makeLuaText('captions1', 'Lyrics go here', 1000, -150, 120)
        setTextString('captions1',  '' .. string)
        setTextFont('captions1', 'VCR_OSD_MONO_1.001.ttf')
        setTextColor('FFFFFF', FFFFFF)
        setTextSize('captions1', 35);
        addLuaText('captions1')
	setObjectCamera('captions1', 'object');
        setTextAlignment('captions1', 'center')
        --removeLuaText('captions', true)
        
    end
end

