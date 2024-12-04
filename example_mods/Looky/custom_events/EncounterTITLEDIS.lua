--made by ItsAizakku

function onCreatePost()
    makeLuaText('Disclaimer', '', screenWidth, 0, 0);
    setTextSize('Disclaimer', 70);
    setObjectCamera('Disclaimer', 'camGame');
    setTextAlignment('Disclaimer', 'center');
    addLuaText('Disclaimer');
	setTextBorder('Disclaimer', 25, '000000');
	setTextColor('Disclaimer', 'FFFFFF');
end

function onEvent(name, value1, value2)
    if name == 'EncounterTITLEDIS' then
        setTextString('Disclaimer', value1);

        if value2 ~= '' then
           setTextFont('Disclaimer', 'vcr.ttf');
        else
            setTextFont('Disclaimer', value2);
        end
    end
end
