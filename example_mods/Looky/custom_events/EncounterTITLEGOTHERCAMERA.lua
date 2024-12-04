--made by ItsAizakku

function onCreatePost()
    makeLuaText('other', '', screenWidth, 0, 290);
    setTextSize('other', 120);
    setObjectCamera('other', 'other');
    setTextAlignment('other', 'center');
    addLuaText('other');
	setTextBorder('other', 10, '000000');
	setTextColor('other', 'FF0000');
end

function onEvent(name, value1, value2)
    if name == 'EncounterTITLEGOTHERCAMERA' then
        setTextString('other', value1);

        if value2 ~= '' then
           setTextFont('other', 'ariblk.ttf');
        else
            setTextFont('other', value2);
        end
    end
end
