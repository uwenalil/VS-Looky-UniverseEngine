function onEvent(name, value1, value2)
    local var string = (value1)
    local var color = (value2)
    if name == "THONKLYRICS" then

        makeLuaText('captions', 'Lyrics go here', 1000, 150, 320)
        setTextString('captions',  '' .. string)
        setTextFont('captions', 'Sweets_Smile.ttf')
        setTextColor('FFFFFF', FFFFFF)
        setTextSize('captions', 60);
        addLuaText('captions')
	setObjectCamera('captions', 'object');
        setTextAlignment('captions', 'center')
        --removeLuaText('captions', true)
        
    end
end

