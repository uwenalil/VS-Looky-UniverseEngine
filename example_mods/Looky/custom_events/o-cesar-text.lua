function onEvent(name, value1, value2)
    local var string = (value1)
    local var color = (value2)
    if name == "o-cesar-text" then

        makeLuaText('captions2', 'Lyrics go here', 910, 450, 350)
        setTextString('captions2',  '' .. string)
        setTextFont('captions2', 'Sweets_Smile.ttf')
        setTextColor('FFFFFF', FFFFFF)
        setTextSize('captions2', 60);
        addLuaText('captions2')
	    setObjectCamera('captions2', 'object');
        setTextAlignment('captions2', 'center')
        --removeLuaText('captions', true)
        
    end
end

