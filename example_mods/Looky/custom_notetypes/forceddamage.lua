function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is the note it is
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'forceddamage' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'mechanics/forceddamage'); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false);
			end
		end
	end
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false


function opponentNoteHit(id, direction, noteType, isSustainNote)
    if noteType == "forceddamage" then
        	setProperty('health', getProperty('health') - 0.1);
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    if noteType == "forceddamage" then
        	setProperty('health', getProperty('health') - 0.1);
	end
end

function noteMis(id, direction, noteType, isSustainNote)
    if noteType == "forceddamage" then
        	setProperty('health', getProperty('health') - 0.1);
	end
end