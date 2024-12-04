function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is the note it is
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Beer Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'mechanics/BEERNOTE_assets'); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
				setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true);
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

local scoremult = 0
local drainmult = 0
local initialHealthLoss = 1

function goodNoteHit(id, direction, noteType, isSustainNote)
    if noteType == "Beer Note" then
		playSound('beerhit', 0.9)
        drainmult = drainmult + 2
		scoremult = scoremult + 2
		if intitialHealthLoss == 1 then
			initialHealthLoss = getProperty('healthLoss')
		end
		setProperty('healthLoss', initialHealthLoss * math.min(drainmult, 1))
	end
	setScore(getScore() + 350 * math.min(scoremult, 1))
end