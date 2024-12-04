function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an desviation note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'bullet' then
			setPropertyFromGroup("unspawnNotes", i, "rgbShader.mult", 0.0)
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'hous/lobotomy/logodomy/BulletMario_NOTE_assets'); --Change texture
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has no penalties
		end
	end
	--debugPrint('Script started!')
	function goodNoteHit(id, i, noteType, isSustainNote)
		if noteType == 'bullet' then
			setProperty('health', getProperty('health') + 0.1);
		precacheSound('gunshot');
		playSound('gunshot', 1);
		characterPlayAnim('boyfriend', 'singUP-alt', true);
	end
end
end
function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'bullet' then
		setProperty('health', getProperty('health')-1)
	end
end