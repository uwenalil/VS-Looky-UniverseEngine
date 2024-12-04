--made by ItsAizakku

function onCreatePost()
    makeLuaText('dialogues', '', screenWidth, -260, 200);
    setTextSize('dialogues', 100);
    setObjectCamera('dialogues', 'camGame');
    setTextAlignment('dialogues', 'center');
    addLuaText('dialogues');
	setTextBorder('dialogues', 5, '000000');
	setTextColor('dialogues', 'FFFFFF');
end

function onEvent(name, value1, value2)
    if name == 'AltTextForDialogues' then
        setTextString('dialogues', value1);

        if value2 ~= '' then
           setTextFont('dialogues', 'vcr.ttf');
        else
            setTextFont('dialogues', value2);
        end
    end
end
