function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is a Markov Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Camo Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'mechanics/CAMO'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0.023'); --Default value is: 0.023, health gained on hit
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0.0475'); --Default value is: 0.0475, health lost on miss
		end
	end
	--debugPrint('Script started!')
end