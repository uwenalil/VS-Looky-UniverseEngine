--made by ItsAizakku

function onCreatePost()
    makeLuaText('Subs', '', screenWidth, 0, 600);
    setTextSize('Subs', 50);
    setObjectCamera('Subs', 'other');
    setTextAlignment('Subs', 'center');
    addLuaText('Subs');
	setTextBorder('Subs', 5, '000000');
	setTextColor('Subs', 'FFFFFF');
end

function onEvent(name, value1, value2)
    if name == 'AltTextForSubs' then
        setTextString('Subs', value1);

        if value2 ~= '' then
           setTextFont('Subs', 'vcr.ttf');
        else
            setTextFont('Subs', value2);
        end
    end
end
