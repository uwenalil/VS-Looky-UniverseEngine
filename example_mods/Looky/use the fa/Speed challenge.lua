function goodNoteHit(id, noteData, noteType, isSustainNote)
if isSustainNote == false then
if getPropertyFromGroup('notes', id, 'rating') == 'good' and getProperty('goods') < 25 then
setProperty('playbackRate', getProperty('playbackRate') + 0.05)
    end
  end
if getPropertyFromGroup('notes', id, 'rating') == 'bad' and getProperty('bads') < 10 then
setProperty('playbackRate', getProperty('playbackRate') + 0.1)
 end
if getPropertyFromGroup('notes', id, 'rating') == 'shit' and getProperty('shits') < 5 then
setProperty('playbackRate', getProperty('playbackRate') + 0.25)
  end
end