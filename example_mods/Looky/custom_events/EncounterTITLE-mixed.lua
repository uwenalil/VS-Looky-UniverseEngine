function onEvent(name, value1, value2)
    local var string = (value1)
    local var color = (value2)
    if name == "EncounterTITLE-mixed" then

        makeLuaText('captions2', 'Lyrics go here', 2000, -360, 400)
        setTextString('captions2',  '' .. string)
        setTextFont('captions2', 'vcr.ttf')
        setTextColor('FFFFFF', FFFFFF)
        setTextSize('captions2', 200);
        addLuaText('captions2')
	setObjectCamera('captions2', 'object');
        setTextAlignment('captions2', 'center')
        --removeLuaText('captions', true)
        
    end
end

