function onEvent(name, value1, value2)
    local var string = (value1)
    local var color = (value2)
    if name == "EncounterTITLE" then

        makeLuaText('captions', 'Lyrics go here', 2000, -360, 200)
        setTextString('captions',  '' .. string)
        setTextFont('captions', 'vcr.ttf')
        setTextColor('FFFFFF', FFFFFF)
        setTextSize('captions', 200);
        addLuaText('captions')
	setObjectCamera('captions', 'object');
        setTextAlignment('captions', 'center')
        --removeLuaText('captions', true)
        
    end
end

