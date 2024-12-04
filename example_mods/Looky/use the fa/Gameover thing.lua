function onSongStart()
doTweenY('e', 'gf.scale', 2, 1, 'linear')
    StretchyTime()
end

function StretchyTime()
doTweenX('bfScaleTweenX', 'boyfriend.scale', 2, 1, 'elasticInOut')
doTweenY('bfScaleTweenY', 'boyfriend.scale', 2, 1, 'elasticInOut')
end