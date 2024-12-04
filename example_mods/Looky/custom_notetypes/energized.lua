function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is the note it is
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'energized' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'mechanics/energized'); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'missHealth', 0);
			end
		end
	end
	--debugPrint('Script started!')
end

function noteMiss(id, direction, noteType, isSustainNote)
    if noteType == "energized" then
        	setProperty('songSpeed', getProperty('songSpeed') + 0.2);
	end
end
