A = false

function onUpdate()
if getProperty('bads') > 0 or getProperty('shits') > 0 or getProperty('songMisses') > 0 then
setProperty('health', getProperty('health')-0.005)
A = true
end
end

function goodNoteHit()
if A == true then
debugPrint('You\'re about to die')
end
end