-- Same code of "ToPhilly", this is just not to get confused
function onEvent(name, value1, value2)
	if name == 'WithSpooky' then
		duration = tonumber(value1);
		if duration < 0 then
			duration = 0;
		end

		targetAlpha = tonumber(value2);
		if duration == 0 then
        setProperty('sky.alpha', targetAlpha);
        setProperty('city.alpha', targetAlpha);
        setProperty('light.alpha', targetAlpha);
        setProperty('behindTrain.alpha', targetAlpha);
        setProperty('street.alpha', targetAlpha);
		else
			doTweenAlpha('skyFadeEventTween', 'sky', targetAlpha, duration, 'linear');
                                                doTweenAlpha('cityFadeEventTween', 'city', targetAlpha, duration, 'linear');
			doTweenAlpha('lightFadeEventTween', 'light', targetAlpha, duration, 'linear');
                                                doTweenAlpha('behindTrainFadeEventTween', 'behindTrain', targetAlpha, duration, 'linear');
			doTweenAlpha('streetFadeEventTween', 'street', targetAlpha, duration, 'linear');
		end
		-- ñ
	end
end