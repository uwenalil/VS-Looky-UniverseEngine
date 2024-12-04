--made by ItsAizakku

function onCreatePost()
    makeLuaText('DuoAlt', '', screenWidth, -470, 200);
    setTextSize('DuoAlt', 150);
    setObjectCamera('DuoAlt', 'camGame');
    setTextAlignment('DuoAlt', 'center');
    addLuaText('DuoAlt');
	setTextBorder('DuoAlt', 25, '000000');
	setTextColor('DuoAlt', 'FFFFFF');
end

function onEvent(name, value1, value2)
    if name == 'EncounterTITLEADUO' then
        setTextString('DuoAlt', value1);

        if value2 ~= '' then
           setTextFont('DuoAlt', 'vcr.ttf');
        else
            setTextFont('DuoAlt	', value2);
        end
    end
end
