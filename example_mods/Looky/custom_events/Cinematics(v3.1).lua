--[[
    Creator: RamenDominoes (https://gamebanana.com/members/2135195)
    Version: Like 3.1 or something idk I fucked up making the versions cuz I used to not know how the numbers for versions worked lol

    Thanks for downloadin' this shit I love ya <3
    If you use this event please credit me, it would be very much appreciated!
]]--
local hudItems = {'scoreTxt','timeBar','timeBarBG','timeTxt'}
local hpHudItems = {'healthBarBG','healthBar','iconP1','iconP2'}
local strumYOrigin = 0
local canFade = true
local hideAll = false
local canMove = true

function onCreate()
    luaGraphic('topBar', 0, -1)
    luaGraphic('bottomBar', 0, screenHeight)
end
function onCreatePost()
    strumYOrigin = getPropertyFromGroup('strumLineNotes', 0, 'y')
    hpTransparency = getPropertyFromClass('ClientPrefs', 'healthBarAlpha') --say thank you to DotZZ for tellin' me about this :)
end
function onEvent(name,v1,v2)
    if name == 'Cinematics(v3.1)' then
        local barStuff = split(v1, ',') -- Thickness, Speed
        local type = tonumber(v2)

        doTweenY('topBarY', 'topBar', (tonumber(barStuff[1])*0.5)-1, tonumber(barStuff[2]), 'quadOut')
        doTweenY('topBarScaleY', 'topBar.scale', tonumber(barStuff[1]), tonumber(barStuff[2]), 'quadOut')
        doTweenY('bottomBarY', 'bottomBar', (screenHeight-(tonumber(barStuff[1])*0.5)), tonumber(barStuff[2]), 'quadOut')
        doTweenY('bottomBarScaleY', 'bottomBar.scale', tonumber(barStuff[1]), tonumber(barStuff[2]), 'quadOut')

        if tonumber(barStuff[1]) > 0 then
            if type == 2 then
                setObjectOrder('topBar', getObjectOrder('scoreTxt')+1)
                setObjectOrder('bottomBar', getObjectOrder('scoreTxt')+1)
            else
                setObjectOrder('topBar', getObjectOrder('timeBarBG')-1)
                setObjectOrder('bottomBar', getObjectOrder('timeBarBG')-1)
            end
            if type == 3 then
                canFade = false
            else
                canFade = true
            end
            if type == 4 then
                hideAll = true
            else
                hideAll = false
            end
            if type == 5 then
                canMove = false
            else
                canMove = true
            end
            if canFade then
                for i = 1,4 do
                    doTweenAlpha('hudItemsAlpha'..i, hudItems[i], 0, tonumber(barStuff[2]), 'quadOut')
                    doTweenAlpha('hpHudItemsAlpha'..i, hpHudItems[i], 0, tonumber(barStuff[2]), 'quadOut')
                end
            end
            if hideAll then
                for i = 0,7 do
                    noteTweenAlpha('noteAlpha'..i, i, 0, tonumber(barStuff[2]), 'quadOut')
                end
            end
            if canMove then
                if not downscroll then
                    for i = 0,7 do
                        noteTweenY('noteY'..i, i, tonumber(barStuff[1])+strumYOrigin, tonumber(barStuff[2]), 'quadOut')
                    end
                else
                    for i = 0,7 do
                        noteTweenY('noteY'..i, i, (screenHeight-tonumber(barStuff[1]))-(getPropertyFromGroup('strumLineNotes', i, 'height')+45), tonumber(barStuff[2]), 'quadOut')
                    end
                end
            end
        else
            canFade = true
            hideAll = false
            canMove = true

            for i = 1,4 do
                doTweenAlpha('hudItemsAlpha'..i, hudItems[i], 1, tonumber(barStuff[2]), 'quadOut')
                doTweenAlpha('hpHudItemsAlpha'..i, hpHudItems[i], hpTransparency, tonumber(barStuff[2]), 'quadOut')
            end
            if not middlescroll then
                for i = 0,7 do
                    noteTweenAlpha('noteAlpha'..i, i, 1, tonumber(barStuff[2]), 'quadOut')
                end
            else
                for i = 0,3 do
                    noteTweenAlpha('noteAlpha'..i, i, 0.35, tonumber(barStuff[2]), 'quadOut')
                    noteTweenAlpha('noteAlpha'..i+4, i+4, 1, tonumber(barStuff[2]), 'quadOut')
                end
            end
            for i = 0,7 do
                noteTweenY('noteY'..i, i, strumYOrigin, tonumber(barStuff[2]), 'quadOut')
            end
        end
    end
end

function split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, tostring(match));
    end
    return result;
end
function luaGraphic(tag,x,y)
	makeLuaSprite(tag, nil, x, y)
	makeGraphic(tag, screenWidth, 1, '000000')
	setObjectCamera(tag, 'HUD')
	addLuaSprite(tag)
end