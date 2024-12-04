--made by ItsAizakku

function onCreatePost()
    makeLuaText('Alternate', '', screenWidth, 0, 290);
    setTextSize('Alternate', 250);
    setObjectCamera('Alternate', 'camGame');
    setTextAlignment('Alternate', 'center');
    addLuaText('Alternate');
	setTextBorder('Alternate', 25, '000000');
	setTextColor('Alternate', 'FFFFFF');
end

function onEvent(name, value1, value2)
    if name == 'EncounterTITLEA' then
        setTextString('Alternate', value1);

        if value2 ~= '' then
           setTextFont('Alternate', 'vcr.ttf');
        else
            setTextFont('Alternate', value2);
        end
    end
end
