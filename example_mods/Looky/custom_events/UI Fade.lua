function onEvent(name, v1, v2)
	if name == 'UI Fade' then
            local easing = 'linear'
            local duration = 1
            local target = ''
            local leaveNotes = 'false'
            --local hudArray = {'healthBar','healthBarBG','iconP1','iconP2','scoreTxt','timeBar','timeBarTxt','timeBarBG'}--normal hud
            local hudArray = {
                  'timePercentMickey',
                  'songTimeMickey',
                  'songNameTextMickey',
                  'scoreTextMickey',
                  'missesTextMickey',
                  'acurracyTextMickey',
                  'sickTextMickey',
                  'goodTextMickey',
                  'badTextMickey',
                  'shitTextMickey',
                  'healthBar',
                  'healthBarBG',
                  'iconP1',
                  'iconP2',
                  'scoreTxt',
                  'timeBar',
                  'timeBarTxt',
                  'timeBarBG'}--mickey hud
            if string.find(v1,',',0,true) ~= nil then
                  local commaStart = 0
                  local commaEnd = 0
                  commaStart,commaEnd = string.find(v1,',',0,true)
                  target = tonumber(string.sub(v1,0,commaEnd - 1))
                  if string.find(v1,',',commaEnd + 1,true) ~= nil then
                        local comma1Start = 0
                        local comma1End = 0
                        comma1Start,comma1End = string.find(v1,',',commaEnd + 1,true)
                        easing = string.sub(v1,commaEnd + 1,comma1Start - 1)
                        leaveNotes = string.sub(v1,comma1End + 1)
                  else
                        easing = string.sub(v1,commaEnd + 1)
                  end
            else
                  target = tonumber(v1)
            end
            if v2 ~= '' then
                  duration = tonumber(v2)
            end
            if easing == '.' then
                  easing = 'linear'
            end
            if target == nil or target == '' then
                  target = 1
            end
            if leaveNotes ~= 'false' then
                  leaveNotes = 'true'
            end
            if duration ~= 0 then
                  if leaveNotes ~= 'true' then
                        for strumLineLength = 0,7 do
                              if middlescroll == true and target > 0.3 then
                                    if strumLineLength < 4 then
                                          noteTweenAlpha('byeNotes'..strumLineLength, strumLineLength, 0.3, duration, easing)
                                    else
                                          noteTweenAlpha('byeNotes'..strumLineLength, strumLineLength, target, duration, easing)
                                    end
                              else
                                    noteTweenAlpha('byeNotes'..strumLineLength, strumLineLength, target, duration, easing)
                              end
                        end
                  end
                  for hudLength = 1,#hudArray do
                        if getProperty(hudArray[hudLength]..'.visible') == true then
                              doTweenAlpha('bye'..hudArray[hudLength],hudArray[hudLength], target, duration, easing)
                        end
                  end
            else
                  if leaveNotes ~= 'true' then
                        for strumLineLength = 0,7 do
                              if middlescroll == true and target > 0.3 then
                                    if strumLineLength < 4 then
                                          setPropertyFromGroup('strumLineNotes', strumLineLength,'alpha',0.3);
                                    else
                                          setPropertyFromGroup('strumLineNotes', strumLineLength,'alpha',target);
                                    end
                              else
                                    setPropertyFromGroup('strumLineNotes', strumLineLength,'alpha',target);
                              end
                              
                        end
                  end
                  for hudLength = 1,#hudArray do
                        if getProperty(hudArray[hudLength]..'.visible') == true then
                              setProperty(hudArray[hudLength]..'.alpha', target)
                        end
                  end

            end

	end
end