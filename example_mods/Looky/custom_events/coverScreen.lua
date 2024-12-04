local screenCreated = false
function onEvent(name,v1,v2)
    if name == 'coverScreen' then
        local comma1v1 = 0
        local comma2v1 = 0
        local comma3v1 = 0
        local comma4v1 = 0
        
        local comma1v2 = 0
        local comma2v2 = 0
        local layer = 'hud'
        local color = '000000'
        local duration = 0
        local easing = 'linearOut'
        local target = 1
        comma1v1,comma2v1 = string.find(v1,',',0,true)
        if comma1v1 ~= nil then
            comma3v1,comma4v1 = string.find(v1,',',comma2v1 + 1,true)
            target = tonumber(string.lower(string.sub(v1,0,comma1v1 - 1)))
            if comma3v1 ~= nil then
                layer = string.sub(v1,comma2v1 + 1,comma3v1 - 1)
                color = string.sub(v1,comma4v1 + 1)
            else
                layer = string.lower(string.sub(v1,comma2v1 + 1))
            end
        else
            target = tonumber(string.lower(v1))
        end
        if target == nil then
            target = 1
        end
        comma1v2,comma2v2 = string.find(v2,',',0,true)
        if comma1v2 ~= nil then
            duration = tonumber(string.sub(v2,0,comma1v2 - 1))
            easing = string.lower(string.sub(v2,comma2v2 + 1))
        else
            duration = tonumber(v2)
        end
        if duration == '' or duration == nil then
            duration = 0
        end
        if layer == '.' then
            layer = 'hud'
        end
        if screenCreated ~= true then
            makeLuaSprite('coverScreen',nil,0,0)
            makeGraphic('coverScreen',screenWidth,screenHeight,color)
            setObjectCamera('coverScreen',layer)
            setProperty('coverScreen.alpha',0)
            addLuaSprite('coverScreen',false)
            screenCreated = true
        end
        if duration ~= 0 then
            if target ~= 0 then
                doTweenAlpha('coverScreenAppear','coverScreen',target,duration,easing)
            else
                doTweenAlpha('coverScreenBye','coverScreen',target,duration,easing)
            end
        else
            if target ~= 0 then
                setProperty('coverScreen.alpha',target)
                addLuaSprite('coverScreen',false)
            else
                removeLuaSprite('coverScreen',false)
            end
        end
    end
end
function onTweenCompleted(tag)
    if tag == 'coverScreenBye' then
        removeLuaSprite('coverScreen',false)
    end
end