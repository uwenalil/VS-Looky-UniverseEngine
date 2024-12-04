function onEvent(name, value1, value2)
    local var string = (value1)
    local var color = (value2)
    if name == "THONKTEXTR" then

        makeLuaText('Right', 'Lyrics go here', 400, 1100, 320)
        setTextString('Right',  '' .. string)
        setTextFont('Right', 'Sweets_Smile.ttf')
        setTextColor('FFFFFF')
        setTextSize('Right', 60);
        addLuaText('Right')
	setObjectCamera('Right', 'object');
        setTextAlignment('Right', 'center')
        --removeLuaText('Right', true)
        
    end
end

