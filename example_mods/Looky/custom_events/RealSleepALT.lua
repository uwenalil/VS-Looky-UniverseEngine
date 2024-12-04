--made by ItsAizakku

function onCreatePost()
    makeLuaText('subtitlesCenterRed', '', screenWidth, 0, 320);
    setTextSize('subtitlesCenterRed', 50);
    setObjectCamera('subtitlesCenterRed', 'camGame');
    setTextAlignment('subtitlesCenterRed', 'center');
    addLuaText('subtitlesCenterRed');
	setTextBorder('subtitlesCenterRed', 3, '000000');
	setTextColor('subtitlesCenterRed', 'FF0000');
end

function onEvent(name, value1, value2)
    if name == 'RealSleepALT' then
        setTextString('subtitlesCenterRed', value1);

        if value2 ~= '' then
           setTextFont('subtitlesCenterRed', 'HelpMe.ttf');
        else
            setTextFont('subtitlesCenterRed', value2);
        end
    end
end
