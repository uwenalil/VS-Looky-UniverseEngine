function onEvent(name, value1, value2)
    local var string = (value1)
    local var color = (value2)
    if name == "Text2" then

        makeLuaText('Right', 'Lyrics go here', 400, 900, 320)
        setTextString('Right',  '' .. string)
        setTextFont('Right', 'm42.ttf')
        setTextColor('FFFFFF')
        setTextSize('Right', 40);
        addLuaText('Right')
	setObjectCamera('Right', 'object');
        setTextAlignment('Right', 'center')
        --removeLuaText('Right', true)
        
    end
end

