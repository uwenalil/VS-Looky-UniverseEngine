function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is a Hellclown Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Hellclown Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'mechanics/FIRE'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'mechanics/Smoke'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'offsetX', -120); --Changes the offset X
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
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
function goodNoteHit(id, noteData, noteType, isSustainNote)
	--Check if the note is a Hellclown Note
	if noteType == 'Hellclown Note' then
		playSound('burnSound', 1);
		setProperty('health', getProperty('health') - 0.3); --Harm the player if hit
	end
end