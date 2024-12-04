--made by ItsAizakku

function onCreatePost()
    makeLuaText('Thatcher', '', screenWidth, 0, 290);
    setTextSize('Thatcher', 120);
    setObjectCamera('Thatcher', 'other');
    setTextAlignment('Thatcher', 'center');
    addLuaText('Thatcher');
	setTextBorder('Thatcher', 10, '000000');
	setTextColor('Thatcher', 'FFFF00');
end

function onEvent(name, value1, value2)
    if name == 'EncounterTITLET' then
        setTextString('Thatcher', value1);

        if value2 ~= '' then
           setTextFont('Thatcher', 'ariblk.ttf');
        else
            setTextFont('Thatcher', value2);
        end
    end
end
