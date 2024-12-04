function onUpdate(elapsed)
songPos = getSongPosition()
local currentBeat = (songPos/3000)*(curBpm/18)

        noteTweenY('a', 4, defaultPlayerStrumY0 - 50*math.sin((currentBeat+4*1.25)*math.pi), 0.6)
        noteTweenY('b', 5, defaultPlayerStrumY1 - 50*math.sin((currentBeat+5*1.25)*math.pi), 0.6)
        noteTweenY('c', 6, defaultPlayerStrumY2 - 50*math.sin((currentBeat+6*1.25)*math.pi), 0.6)
        noteTweenY('d', 7, defaultPlayerStrumY3 - 50*math.sin((currentBeat+7*1.25)*math.pi), 0.6)

        noteTweenY('e', 0, defaultOpponentStrumY0 + 50*math.sin((currentBeat+4*2.25)*math.pi), 0.6)
        noteTweenY('f', 1, defaultOpponentStrumY1 + 50*math.sin((currentBeat+5*2.25)*math.pi), 0.6)
        noteTweenY('g', 2, defaultOpponentStrumY2 + 50*math.sin((currentBeat+6*2.25)*math.pi), 0.6)
        noteTweenY('h', 3, defaultOpponentStrumY3 + 50*math.sin((currentBeat+7*2.25)*math.pi), 0.6)

        noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 - 30*math.sin((currentBeat-4*0.25)*math.pi), 0.2)
        noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1 - 30*math.sin((currentBeat-5*0.25)*math.pi), 0.2)
        noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 - 30*math.sin((currentBeat-6*0.25)*math.pi), 0.2)
        noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 - 30*math.sin((currentBeat-7*0.25)*math.pi), 0.2)

        noteTweenX(defaultOpponentStrumX0, 0, defaultOpponentStrumX0 - 20*math.sin((currentBeat-4*0.25)*math.pi), 0.3)
        noteTweenX(defaultOpponentStrumX1, 1, defaultOpponentStrumX1 - 20*math.sin((currentBeat-5*0.25)*math.pi), 0.3)
        noteTweenX(defaultOpponentStrumX2, 2, defaultOpponentStrumX2 - 20*math.sin((currentBeat-6*0.25)*math.pi), 0.3)
        noteTweenX(defaultOpponentStrumX3, 3, defaultOpponentStrumX3 - 180*math.sin((currentBeat-7*0.25)*math.pi), 0.3)
end