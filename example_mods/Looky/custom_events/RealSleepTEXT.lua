function onEvent(name, value1, value2)
    local var string = (value1)
    local var color = (value2)
    if name == "RealSleepTEXT" then

        makeLuaText('captions', 'Lyrics go here', 500, 400, 320)
        setTextString('captions',  '' .. string)
        setTextFont('captions', 'm42.ttf')
        setTextColor('FFFFFF')
        setTextSize('captions', 30);
        addLuaText('captions')
	setObjectCamera('captions', 'object');
        setTextAlignment('captions', 'center')
        --removeLuaText('captions', true)
        
    end
end

