--made by ItsAizakku

function onCreatePost()
    makeLuaText('Gabriel', '', screenWidth, 0, 290);
    setTextSize('Gabriel', 120);
    setObjectCamera('Gabriel', 'Object');
    setTextAlignment('Gabriel', 'center');
    addLuaText('Gabriel');
	setTextBorder('Gabriel', 10, '000000');
	setTextColor('Gabriel', 'FF0000');
end

function onEvent(name, value1, value2)
    if name == 'EncounterTITLEG' then
        setTextString('Gabriel', value1);

        if value2 ~= '' then
           setTextFont('Gabriel', 'ariblk.ttf');
        else
            setTextFont('Gabriel', value2);
        end
    end
end
