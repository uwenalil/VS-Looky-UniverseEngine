function onEvent(name, value1, value2)
    local var string = (value1)
    local var color = (value2)
    if name == "Text1" then

        makeLuaText('Left', 'Lyrics go here', 400, 0, 320)
        setTextString('Left',  '' .. string)
        setTextFont('Left', 'm42.ttf')
        setTextColor('FFFFFF')
        setTextSize('Left', 40);
        addLuaText('Left')
	setObjectCamera('Left', 'object');
        setTextAlignment('Left', 'center')
        --removeLuaText('Left', true)
        
    end
end

