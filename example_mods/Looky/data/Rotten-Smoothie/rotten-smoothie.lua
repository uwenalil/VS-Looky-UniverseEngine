

function onStepHit()
	if curStep == 1312 then
		for i = 0,3 do
			setPropertyFromGroup('strumLineNotes', i, 'alpha', 0) 
		end

        noteTweenX('Movement X 0', 4, defaultOpponentStrumX2, 0.00000000001)
    	noteTweenX('Movement X 1', 5, defaultOpponentStrumX3, 0.00000000001)
    	noteTweenX('Movement X 2', 6, defaultPlayerStrumX0, 0.00000000001)
    	noteTweenX('Movement X 3', 7, defaultPlayerStrumX1, 0.00000000001)
	end
    if curStep == 1816 then
		for i = 0,3 do
			setPropertyFromGroup('strumLineNotes', i, 'alpha', 1) 
		end

        noteTweenX('Movement X 0', 4, defaultPlayerStrumX0, 0.00000000001)
        noteTweenX('Movement X 1', 5, defaultPlayerStrumX1, 0.00000000001)
        noteTweenX('Movement X 2', 6, defaultPlayerStrumX2, 0.00000000001)
        noteTweenX('Movement X 3', 7, defaultPlayerStrumX3, 0.00000000001)
	end
end