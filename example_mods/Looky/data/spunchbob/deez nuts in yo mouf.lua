local angleshit = 1.5;
local anglevar = 1.5;
function onBeatHit()
    if curBeat > 108 and curBeat < 235 then
        if curBeat % 2 == 0 then
            angleshit = anglevar;
        else
            angleshit = -anglevar;
        end
        setProperty('camGame.angle',angleshit*3)
        doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.002, 'circOut')
        doTweenX('ttrn', 'camGame', -angleshit*8, crochet*0.001, 'linear')
    end
end