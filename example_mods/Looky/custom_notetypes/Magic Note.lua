function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is the note it is
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Magic Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'mechanics/MAGIC'); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true)
				setPropertyFromGroup('unspawnNotes', i, 'missHealth', 0)
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

local shakey = 0
local shake = false

function goodNoteHit(id, direction, noteType, isSustainNote)
    if noteType == "Magic Note" then
		shakey = 100
		doTweenAngle('Cam1', 'camGame', getRandomInt(-360,360), 0.001, 'linear')
		doTweenAngle('Cam2', 'camHUD', getRandomInt(-360,360), 0.001, 'linear')
		doTweenAngle('FixCam1', 'camGame', 0, 3, 'sineOut')
		doTweenAngle('FixCam2', 'camHUD', 0, 3, 'sineOut')
		shake = true
	end
end

function onUpdate(elapsed)
	if shake == true then
		setPropertyFromClass("openfl.Lib", "application.window.x", 330 + getRandomInt(shakey * -1,shakey))
		setPropertyFromClass("openfl.Lib", "application.window.y", 170 + getRandomInt(shakey * -1,shakey))
		setPropertyFromClass("FlxG", "fullscreen", false)
		if shakey <= 0 then
			shakey = 0
			shake = false
		else
			shakey = shakey - 1
		end
	end
end