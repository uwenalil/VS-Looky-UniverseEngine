-- Event notes hooks
function onEvent(name,value1,value2)
	if name == 'Arrow flip' then
		reversed = tonumber(value1);
		speed = tonumber(value2);
		if reversed == 1 then
			for i=0,3 do
				noteTweenX('unFlipThing'..i, i + 4, _G['defaultPlayerStrumX'..i], speed, 'smoothStepOut')
			end
		else
			for i=0,3 do
				noteTweenX('flipThing'..i, i + 4, _G['defaultPlayerStrumX'..remapToRange(i, 0, 3, 3, 0)], speed, 'smoothStepOut')
			end
		end
	end
end

function remapToRange(value, start1, stop1, start2, stop2)
	return start2 + (value - start1) * ((stop2 - start2) / (stop1 - start1))
end


