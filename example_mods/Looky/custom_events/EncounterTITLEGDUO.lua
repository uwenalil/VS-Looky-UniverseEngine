--made by ItsAizakku

function onCreatePost()
    makeLuaText('GabrielDUO', '', screenWidth, 430, 430);
    setTextSize('GabrielDUO', 100);
    setObjectCamera('GabrielDUO', 'Object');
    setTextAlignment('GabrielDUO', 'center');
    addLuaText('GabrielDUO');
	setTextBorder('GabrielDUO', 10, '000000');
	setTextColor('GabrielDUO', 'FF0000');
end

function onEvent(name, value1, value2)
    if name == 'EncounterTITLEGDUO' then
        setTextString('GabrielDUO', value1);

        if value2 ~= '' then
           setTextFont('GabrielDUO', 'ariblk.ttf');
        else
            setTextFont('GabrielDUO', value2);
        end
    end
end
