function onEvent(name, value1, value2)
    local var string = (value1)
    local var color = (value2)
    if name == "THONKTEXTL" then

        makeLuaText('Left', 'Lyrics go here', 400, -200, 320)
        setTextString('Left',  '' .. string)
        setTextFont('Left', 'Sweets_Smile.ttf')
        setTextColor('FFFFFF')
        setTextSize('Left', 60);
        addLuaText('Left')
	setObjectCamera('Left', 'object');
        setTextAlignment('Left', 'center')
        --removeLuaText('Left', true)
        
    end
end

