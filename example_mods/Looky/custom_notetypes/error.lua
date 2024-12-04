function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is the note it is
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'error' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'mechanics/error'); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
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

local glitch = 0

function goodNoteHit(id, direction, noteType, isSustainNote)
    if noteType == "error" then
        	glitch = 3
	end
end

function onUpdate(elapsed)
	if glitch == 0 then
		glitch = 0
	else
		setPropertyFromClass("openfl.Lib", "application.window.width", getRandomInt(1,2000))
		setPropertyFromClass("openfl.Lib", "application.window.height", getRandomInt(1,2000))
		setPropertyFromClass("openfl.Lib", "application.window.x", getRandomInt(-500,500))
		setPropertyFromClass("openfl.Lib", "application.window.y", getRandomInt(-500,500))
		doTweenAngle('rando1', 'camGame', getRandomInt(-360,360), 0.001, 'linear')
		doTweenAngle('rando2', 'camHUD', getRandomInt(-360,360), 0.001, 'linear')
		setPropertyFromClass("openfl.Lib", "application.window.title", "An error has occurred")
		glitch = glitch - 1
	end
end