function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the a
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'superposition' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'superposition'); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false);
			end
		end
	end
	--debugPrint('Script started!')
end

function onUpdate( elapsed )
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'superposition' then --Doesn't let Dad/Opponent notes get ignored
				
					setPropertyFromGroup('unspawnNotes', i, 'offsetY', -55);


			end
	end
end
