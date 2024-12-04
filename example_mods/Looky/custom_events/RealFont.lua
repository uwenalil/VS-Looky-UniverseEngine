function onEvent(name, value1, value2)
    local var string = (value1)
    local var color = (value2)
    if name == "RealFont" then

        makeLuaText('captions', 'Lyrics go here', 280, 500, 340)
        setTextString('captions',  '' .. string)
        setTextFont('captions', 'm42.ttf')
        setTextColor('FFFFFF')
        setTextSize('captions', 10);
        addLuaText('captions')
	setObjectCamera('captions', 'object');
        setTextAlignment('captions', 'center')
        --removeLuaText('captions', true)
        
    end
end

