function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is the note it is
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'blackhole' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'mechanics/blackhole'); --Change texture

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

local demise = false
local chaos = 0
local chaos2 = 0

function goodNoteHit(id, direction, noteType, isSustainNote)
    if noteType == "blackhole" then
        	demise = true
		chaos = chaos + 0.1
		chaos2 = chaos2 + 1
	setPropertyFromClass("openfl.Lib", "application.window.borderless", true)
	end
end

function onUpdate(elapsed)
	if demise == true then
		setPropertyFromClass("openfl.Lib", "application.window.width", getPropertyFromClass("openfl.Lib","application.window.width") - 1)
		setPropertyFromClass("openfl.Lib", "application.window.height", getPropertyFromClass("openfl.Lib","application.window.height") - 0.1)
		setPropertyFromClass("openfl.Lib", "application.window.x", getPropertyFromClass("openfl.Lib","application.window.x") + 0.5)
		setPropertyFromClass("openfl.Lib", "application.window.y", getPropertyFromClass("openfl.Lib","application.window.y") + 0.5)
		noteTweenAngle('death',7, getRandomInt(chaos2 * -1,chaos2),0.01,'linear')
		noteTweenAngle('death2',6, getRandomInt(chaos2 * -1,chaos2),0.01,'linear')
		noteTweenAngle('death3',5, getRandomInt(chaos2 * -1,chaos2),0.01,'linear')
		noteTweenAngle('death4',4, getRandomInt(chaos2 * -1,chaos2),0.01,'linear')
		noteTweenAngle('death11',0, getRandomInt(chaos2 * -1,chaos2),0.01,'linear')
		noteTweenAngle('death22',1, getRandomInt(chaos2 * -1,chaos2),0.01,'linear')
		noteTweenAngle('death33',2, getRandomInt(chaos2 * -1,chaos2),0.01,'linear')
		noteTweenAngle('death44',3, getRandomInt(chaos2 * -1,chaos2),0.01,'linear')
		noteTweenX('die',4,getPropertyFromGroup('playerStrums', 0, 'x') + getRandomInt(chaos2 * -1,chaos2),0.01,'linear')
		noteTweenX('die2',5,getPropertyFromGroup('playerStrums', 1, 'x') + getRandomInt(chaos2 * -1,chaos2),0.01,'linear')
		noteTweenX('die3',6,getPropertyFromGroup('playerStrums', 2, 'x') + getRandomInt(chaos2 * -1,chaos2),0.01,'linear')
		noteTweenX('die4',7,getPropertyFromGroup('playerStrums', 3, 'x') + getRandomInt(chaos2 * -1,chaos2),0.01,'linear')
		noteTweenX('die11',0,getPropertyFromGroup('opponentStrums', 0, 'x') + getRandomInt(chaos2 * -1,chaos2),0.01,'linear')
		noteTweenX('die22',1,getPropertyFromGroup('opponentStrums', 1, 'x') + getRandomInt(chaos2 * -1,chaos2),0.01,'linear')
		noteTweenX('die33',2,getPropertyFromGroup('opponentStrums', 2, 'x') + getRandomInt(chaos2 * -1,chaos2),0.01,'linear')
		noteTweenX('die44',3,getPropertyFromGroup('opponentStrums', 3, 'x') + getRandomInt(chaos2 * -1,chaos2),0.01,'linear')
		doTweenAngle('Cam1', 'camGame', chaos, 0.001, 'linear')
		doTweenAngle('Cam2', 'camHUD', chaos * 0.5, 0.001, 'linear')
		chaos = chaos * 1.02
		chaos2 = chaos2 + 1
		setProperty('songSpeed', getProperty('songSpeed') - 0.001)
		setPropertyFromClass("FlxG", "fullscreen", false)
	end
end