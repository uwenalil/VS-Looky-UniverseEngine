function RGBToHexConverter(array)
	return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end

function Split(s, delimiter)
	-- cool stuff Unholy
	local result = {}
	for match in (s..delimiter):gmatch('(.-)'..delimiter) do
		table.insert(result, stringTrim(tostring(match)))
	end
	return result
end

function onEvent(n, v1, v2)
    if n == 'Change Icon' or n == 'Change_Icon' then --discord shit :skull:
		local tableee = Split(v1, ', ')
		local tableee = Split(v1, ',')

		icon = tableee[1]
		name = tableee[2]
		color = tableee[3]

        tableee[1] = tonumber(tableee[1]);
        tableee[2] = tonumber(tableee[2]);
        tableee[3] = tonumber(tableee[3]);

        runHaxeCode([[
            game.icon]] .. icon .. [[.changeIcon(']] .. name .. [[');
        ]])


		if icon == 'P1' then
			setHealthBarColors(RGBToHexConverter(getProperty("dad.healthColorArray")), color)
		elseif icon == 'P2' then
			setHealthBarColors(color, RGBToHexConverter(getProperty("boyfriend.healthColorArray")))
		end
    end
end