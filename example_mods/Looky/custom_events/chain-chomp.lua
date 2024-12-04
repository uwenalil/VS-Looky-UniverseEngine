function onEvent(name, value1, value2)
	if name == 'chain-chomp' then
		doTweenAngle('speen', 'camGame', getProperty('camGame.angle') + 180, 0.15)
		cancelTween('boing')
		setProperty('camHUD.y', -100)
		doTweenY('boing', 'camHUD', 0, 0.25, 'bounceIn')
	end
end