function onEvent(name,v1,v2)
	if name == "health drain" then
		function opponentNoteHit()
			if v1 ~= "on" and v1 ~= "off" then
				v1 = "on"
			end
			if v2 == "" then
				v2 = "0.023, 0.5"
			end
			local drain = split(v2, ",")
			if v1 == 'on' then
				health = getProperty('health')
				if getProperty('health') > tonumber(drain[2]) then
					setProperty('health', health - tonumber(drain[1]));
				end
			end
			if v1 == 'off' then
				print()
			end
		end
	end
end
function split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, tostring(match));
    end
    return result;
end