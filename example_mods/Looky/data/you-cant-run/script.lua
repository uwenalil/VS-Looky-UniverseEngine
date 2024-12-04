local event1 = false
local event2 = false

function onCreate()
	addCharacterToList('bfpickel_updated', 'boyfriend')
	addCharacterToList('pixelrunsonic_updated', 'dad')	
	setProperty('timeBarBG.color', FlxColor.RED)
end

function onSongStart() -- get notes position once they finally spawn
	if not middlescroll then
		for i=0, getProperty('strumLineNotes.length')-1 do
			firstStrumYPos = getPropertyFromGroup('strumLineNotes', i, 'y')
		end

		firstStrumXPos0 = getPropertyFromGroup('strumLineNotes', 0, 'x')
		firstStrumXPos1 = getPropertyFromGroup('strumLineNotes', 1, 'x')
		firstStrumXPos2 = getPropertyFromGroup('strumLineNotes', 2, 'x')
		firstStrumXPos3 = getPropertyFromGroup('strumLineNotes', 3, 'x')
		firstStrumXPos4 = getPropertyFromGroup('strumLineNotes', 4, 'x')
		firstStrumXPos5 = getPropertyFromGroup('strumLineNotes', 5, 'x')
		firstStrumXPos6 = getPropertyFromGroup('strumLineNotes', 6, 'x')
		firstStrumXPos7 = getPropertyFromGroup('strumLineNotes', 7, 'x')
		firstStrumXPos8 = getPropertyFromGroup('strumLineNotes', 8, 'x')
	end
		
end

function onUpdate(elapsed) -- to anyone asking why im using curstep its cause lua events wont work with this mod for some reason
	if not getProperty('isDead') then
		if curStep == 528 and not event1 then
			event1 = true
			setProperty('gf.alpha', 0)
			if not middlescroll then
				noteTweenX('nmove0', 0, firstStrumXPos4, 0.0001)
				noteTweenX('nmove1', 1, firstStrumXPos5, 0.0001)
				noteTweenX('nmove2', 2, firstStrumXPos6, 0.0001)
				noteTweenX('nmove3', 3, firstStrumXPos7, 0.0001)
				noteTweenX('nmove4', 4, firstStrumXPos0, 0.0001)
				noteTweenX('nmove5', 5, firstStrumXPos1, 0.0001)
				noteTweenX('nmove6', 6, firstStrumXPos2, 0.0001)
				noteTweenX('nmove7', 7, firstStrumXPos3, 0.0001)
			end
		end

		if curStep == 784 and not event2 then
			event2 = true
			setProperty('gf.alpha', 1)
			if not middlescroll then
				noteTweenX('nmove0', 0, firstStrumXPos0, 0.0001)
				noteTweenX('nmove1', 1, firstStrumXPos1, 0.0001)
				noteTweenX('nmove2', 2, firstStrumXPos2, 0.0001)
				noteTweenX('nmove3', 3, firstStrumXPos3, 0.0001)
				noteTweenX('nmove4', 4, firstStrumXPos4, 0.0001)
				noteTweenX('nmove5', 5, firstStrumXPos5, 0.0001)
				noteTweenX('nmove6', 6, firstStrumXPos6, 0.0001)
				noteTweenX('nmove7', 7, firstStrumXPos7, 0.0001)
			end
		end
	end
end