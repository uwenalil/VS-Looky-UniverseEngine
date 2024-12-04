function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'rocknote' then
			setPropertyFromGroup("unspawnNotes", i, "rgbShader.mult", 0.0)
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'hous/lobotomy/rock/rocknote');
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false);
		end
	end
	function goodNoteHit(id, i, noteType, isSustainNote)
		if not isSustainNote then
		if noteType == 'rocknote' then
			setProperty('health', getProperty('health') + 0.01);
		precacheSound('hitouchie');
		playSound('hitouchie', 0.5);
		if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
			setProperty('dad.specialAnim', true);
			playAnim("dad", "hurt1", true)
		end
		if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
			setProperty('dad.specialAnim', true);
			playAnim("dad", "hurt2", true)
		end
		if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
			setProperty('dad.specialAnim', true);
			playAnim("dad", "hurt1", true)
		end
		if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
			setProperty('dad.specialAnim', true);
			playAnim("dad", "hurt2", true)
		end
	end
end
end
end
function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'rocknote' then
		setProperty('health', getProperty('health')-0.5)
	end
end