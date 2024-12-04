
local strumMovimentForce = 0

local dad = 'mrSYS'
local dad1 = 'hunter'
local dad2 = 'koopa'

local songPos = 0
function onCreate()
    addLuaScript('extra_scripts/extraCharacter')
    addLuaScript('extra_scripts/extraIcon')


    makeAnimatedLuaSprite('Lakitu','mario/beatus/YouCannotBeatUS_Fellas_Assets',-200,600)
    --setScrollFactor('Lakitu',0,0)
    addAnimationByPrefix('Lakitu','anim','Lakitu',24,false)
    --addLuaSprite('Lakitu',true)
    
    makeAnimatedLuaSprite('Bird','mario/beatus/YouCannotBeatUS_Fellas_Assets',1200,600)
    --setScrollFactor('Bird',0,0)
    addAnimationByPrefix('Bird','anim','Bird Up',24,false)
    --addLuaSprite('Bird',true)

    setProperty('camHUD.alpha',0.0001)


    makeLuaSprite('blackFront',nil,-200,-200)
    makeGraphic('blackFront',screenWidth + 300,screenHeight + 300,'FFFFFF')
    setProperty('blackFront.color',0)
    setProperty('blackFront.alpha',0.001)
    setScrollFactor('blackFront',0,0)
    addLuaSprite('blackFront',true)

    addCharacterToList('koopa','dad')
    addCharacterToList('hunter','dad')




    for i = 0,getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes',i,'strumTime') >= 630343 then
            setPropertyFromGroup('unspawnNotes',i,'scale.x',1.2)
            setPropertyFromGroup('unspawnNotes',i,'scale.y',1.2)
        end
    end


end
function onCreatePost()
    setProperty('iconP2.visible',false)
    if not hideHud then
        extraIcon('addExtraIcon',{'dadIcon'})
        extraIcon('setIconAsPrincipal',{'dadIcon'})
    end
    
    setProperty('dad.alpha',0.0001)
    setProperty('boyfriend.alpha',0.0001)
    setProperty('gf.alpha',0.0001)
end
function onBeatHit()
    if getProperty('camZooming')  and (
        curStep > 256 and curStep < 512 or curStep > 544 and
        curStep < 832 or curStep > 832 and curSection % 4 >= 2 and curStep < 1088 or
        curStep > 1376 and curStep < 1568 or
        curStep > 2080 and curStep < 2329
        or curStep > 2752 and curStep < 3152 or
        curStep > 3280 and curStep < 3344 or
        (curStep > 3344 and curStep < 3590 or curStep > 3747 and curStep < 3858) and (curBeat % 4 == 1 or curBeat % 4 == 3) or
        curStep > 3863 and curStep < 4311 or
        curStep > 4816 and curStep < 5584 or
        curStep > 5807 and curBeat % 2 == 0 and curStep < 5833 or
        curStep >= 5841

    )
    then
        triggerEvent('Add Camera Zoom','','')
    end
    if curBeat % 4 == 0 and (
        curStep >3344 and curStep < 3590 or
        curStep > 3747 and curStep < 3858
    ) then
        triggerEvent('Add Camera Zoom','-0.015','-0.03')
    end
    if curBeat >= 1460 and curBeat < 1524 and curBeat ~= 1492 then
        local ofs = 50
        for strums = 0,3 do
            if curBeat > 1492 then
                setPropertyFromGroup('opponentStrums',strums,'x',412 + (112 * strums) - (ofs * math.cos(strums)))
                noteTweenX('noteUniX'..strums,strums,412 + (112 * strums),stepCrochet*0.003,'cubeOut')
            else
                setPropertyFromGroup('playerStrums',strums,'x',412 + (112 * strums) - (ofs * math.cos(strums)))
                noteTweenX('noteUniX'..(strums+4),strums+4,412 + (112 * strums),stepCrochet*0.003,'cubeOut')
            end
        end
    end
end

function onStepHit()
    if curBeat % 4 ~= 0 and getProperty('camZooming') and (
        curStep > 1568 and (curStep % 16 == 6 or curStep % 16 == 12) and curStep < 1695  or
        (curStep > 1824 and curStep < 2074 or curStep > 2369 and curStep < 2623) and (curStep % 16  == 4 or curStep % 16 == 6 or curStep % 16 == 10 or curStep % 16 == 12) or
        curStep > 5832 and curStep < 5840 and curStep % 2 == 0) then
        triggerEvent('Add Camera Zoom','','')
    end
end
function onEvent(name,v1,v2)
    if name == 'Triggers Unbeatable' then
        if v1 == '0' then
            doTweenAlpha('hudalpha','camHUD',1,1,'cubeOut')

        elseif v1 == '1' then
            doTweenAlpha('dadAlpha','dad',0,stepCrochet*0.006,'linear')
            doTweenAlpha('iconP2Alpha','iconP2',0,stepCrochet*0.015,'linear')

        elseif v1 == '2.5' or v1 == '11' and v2 == '4' then
            cancelTween('dadAlpha')
            if v1 == '2.5' then
                triggerEvent('Change Character','dad',dad1)
            else
                triggerEvent('Change Character','dad',dad2)
            end
            setProperty('dad.alpha',1)
            --doTweenAlpha('iconP2Alpha','iconP2',1,stepCrochet*0.015,'linear')

            setProperty('dad.y',getProperty('dad.y') + 500)
            doTweenY('dadY','dad',getProperty('dad.y') - 500,stepCrochet*0.015,'backOut')

            cancelTween('iconP2Alpha')
            setProperty('iconP2.alpha',1)
            cancelTween('dadIconOffY')
            if downscroll then
                setProperty('dadIcon.offset.y',200)
            else
                setProperty('dadIcon.offset.y',-200)
            end
            doTweenY('dadIconOffY','dadIcon.offset',0,1,'cubeOut')
        elseif v1 == '6' then
            if v2 == '' then
                triggerEvent('Change Character','dad',dad1)
                resetDadY()--Used if you use skip time

            elseif v2 == '1' then

                cancelTween('dadY')
                setProperty('dad.y',getProperty('dad.y')+800)
                cancelTween('koopaY')
                setObjectOrder('koopaChar',getObjectOrder('dadGroup')-1)
                setProperty('koopaChar.visible',true)
                setProperty('koopaChar.x',getProperty('dadGroup.x')+getProperty('koopaChar.positionArray[0]'))
                setProperty('koopaChar.y',getProperty('dadGroup.y')+getProperty('koopaChar.positionArray[1]'))

            elseif v2 == '2' then
                extraIcon('setIconAsPrincipal',{'dadIcon',true})
                doTweenX('koopaX','koopaChar',getProperty('koopaChar.x')-400,1,'cubeOut')
                doTweenY('dadY','dad',getProperty('dad.y')-800,1,'backOut')
                
                for strums = 0,3 do
                    noteTweenX('noteUniX'..strums,strums,getPropertyFromGroup('playerStrums',strums,'x'),0.2,'cubeOut')
                    noteTweenX('noteUniX'..(strums+4),strums+4,getPropertyFromGroup('opponentStrums',strums,'x'),0.2,'cubeOut')
                end
            end
            if v2 ~= '2' then
                if not hideHud then
                    if not luaSpriteExists('duckIcon') then
                        extraIcon('addExtraIcon',{'duckIcon','hunt'})
                        if downscroll then
                            setProperty('duckIcon.offset.y',400)
                        else
                            setProperty('duckIcon.offset.y',-400)
                        end
                        doTweenY('duckIconY','duckIcon.offset',0,stepCrochet*0.005,'cubeOut')
                    end

                    extraIcon('setIconAsPrincipal',{'duckIcon',true})
                end
            end

        elseif v1 == '7' then
            if v2 == '' then
                triggerEvent('Change Character','dad',dad2)
                resetDadY()
            elseif v2 == '1' then
                setObjectOrder('hunterChar',getObjectOrder('dadGroup')-1)
                setProperty('hunterChar.visible',true)
                setProperty('hunterChar.x',getProperty('dadGroup.x') + 450)
                setProperty('hunterChar.y',getProperty('dadGroup.y') + 150)
                doTweenX('hunterX','hunterChar',getProperty('hunterChar.x')-250,1,'cubeOut')
                doTweenY('hunterY','hunterChar',getProperty('hunterChar.y')-200,1,'cubeOut')
            end
            
            if not hideHud then
                if not luaSpriteExists('koopaIcon') then
                    extraIcon('addExtraIcon',{'koopaIcon','bowser'})
                    if downscroll then
                        setProperty('koopaIcon.offset.y',200)
                    else
                        setProperty('koopaIcon.offset.y',-200)
                    end
                    doTweenY('koopaIconY','koopaIcon.offset',0,stepCrochet*0.005,'cubeOut')
                end
                extraIcon('setIconAsPrincipal',{'koopaIcon',true})
            end

        elseif v1 == '8' then
            triggerEvent('Change Character','dad',dad)
            setProperty('dad.visible',false)

        elseif v1 == '9' then
            setMiddleScroll(true)
            if v2 == '1' then
                hudAlpha(0,1)
            end

        elseif v1 == '10' then
            hudAlpha(1,0)
            setMiddleScroll(false,0)
        
        elseif v1 == '24' then
            triggerEvent('Change Character','dad',dad)
            setProperty('dad.alpha',0)

        elseif v1 == '12' then
            setProperty('blackFront.alpha',0)
            cancelTween('dadY')

            if v2 == '1' then
                setProperty('dad.visible',true)
                setProperty('hunterChar.visible',false)
                setProperty('koopaChar.visible',false)
                extraIcon('setIconAsPrincipal',{'dadIcon',true})
            else
                if v2 == '2' then
                    setProperty('dad.visible',true)
                    cancelTween('BirdX')
                    cancelTween('BirdY')
                    setProperty('Bird.visible',false)
                    setObjectOrder('Bird',getObjectOrder('hunterChar')-1)
                elseif v2 == '3' then
                    cancelTween('LakituX')
                    cancelTween('LakituY')
                    setProperty('Lakitu.visible',false)
                    setProperty('blackFront.alpha',1)        
                end
            end
        elseif v1 == '16' then
            doTweenAlpha('blackFront','blackFront',1,0.6,'cubeInOut')
            doTweenAlpha('hudAlpha','camHUD',0,0.6,'cubeInOut')
        elseif v1 == '17' then
            if v2 == '' then
                setProperty('camGame.alpha',1)
                cancelTween('BirdX')
                cancelTween('BirdY')
                cancelTween('LakituX')
                cancelTween('LakituY')
                cancelTween('blackFront')

                setProperty('blackFront.color',getColorFromHex('FFFFFF'))
                doTweenZoom('gameZoom','camGame',getProperty('defaultCamZoom'),1,'expoOut')

                removeLuaSprite('Bird',false)
                removeLuaSprite('Lakitu',false)
                setProperty('hunterChar.visible',false)
                setProperty('koopaChar.visible',false)
            elseif v2 == '1' then
                setObjectOrder('dadGroup',getObjectOrder('dadGroup')+1)
                setProperty('dad.visible',true)
                doTweenAlpha('dadAlpha','dad',1,0.3,'sineIn')
                
                extraIcon('setIconProperty',{'dadIcon','followCharacterImage',false})
            elseif v2 == '2' then
                cancelTween('hudAlpha')
                cancelTween('dadAlpha')
                setProperty('camHUD.alpha',1)
                setProperty('dad.alpha',1)
                doTweenAlpha('blackFrontAlpha','blackFront',0,0.2,'cubeIn')
                setOffs()
            end
        elseif v1 == '19' then
            for strums = 0,3 do
                cancelTween('noteUniAlpha'..strums)
                setPropertyFromGroup('opponentStrums',strums,'alpha',0)
            end

        elseif v1 == '20' then
            cancelTween('dadY')
            cancelTween('dadAlpha')
            triggerEvent('Change Character','dad',dad)
            extraIcon('setIconAsPrincipal',{'dadIcon',true})
            setProperty('dad.visible',true)
            setProperty('blackFront.alpha',0)
            resetDadY()

            if v2 ~= '1' then
                removeNintendos()
            else

                for strums = 0,3 do
                    setPropertyFromGroup('opponentStrums',strums,'alpha',0)
                end

                setProperty('hunterChar.visible',true)
                setProperty('koopaChar.visible',true)
    
                setProperty('hunterChar.x',getProperty('dadGroup.x') + 300)
                setProperty('hunterChar.y',getProperty('dadGroup.y') - 50)
    
                setProperty('koopaChar.x',getProperty('dadGroup.x') - 700)
                setProperty('koopaChar.y',getProperty('dadGroup.y') + 150)
    
                setProperty('Bird.visible',true)
                setProperty('Bird.x',750)
                setProperty('Bird.y',0)
                setObjectOrder('Bird',getObjectOrder('hunterChar')-1)
                setProperty('Lakitu.visible',true)
                setObjectOrder('Lakitu',getObjectOrder('koopaChar')-1)
                setProperty('Lakitu.x',150)
                setProperty('Lakitu.y',0)
                removeLuaSprite('blackFront',true)
    
                setObjectOrder('dad',getObjectOrder('dadGroup')+6)
                setObjectOrder('koopaChar',getObjectOrder('dadGroup')+4)
                setObjectOrder('hunterChar',getObjectOrder('dadGroup')+5)
                setObjectOrder('Bird',getObjectOrder('dadGroup')+3)
                setObjectOrder('Lakitu',getObjectOrder('dadGroup')+3)
                extraIcon('setIconAsPrincipal',{'dadIcon',true})
            end

        elseif v1 == '23' then
            setOffs(0,'dad')
            setProperty('dad.visible',false)
            setProperty('blackFront.alpha',1)
            setObjectOrder('blackFront',getObjectOrder('dadGroup')-5)
            if v2 == '0' or v2 == '1' then
      
                if v2 == '0' then
                    triggerEvent('Change Character','dad',dad1)
                    extraCharFunction('resetExtraCharPos',{'koopaChar','dad'})
                    if not hideHud then
                        extraIcon('setIconAsPrincipal',{'hunterIcon',true})
                    end
                elseif v2 == '1' then
                    triggerEvent('Change Character','dad',dad2)
                    if not hideHud then
                        extraIcon('setIconAsPrincipal',{'koopaIcon',true})
                    end
                end
                setProperty('dad.visible',true)
                setProperty('dad.y',getProperty('dad.y')+500)
                doTweenY('dadY','dad',getProperty('dadGroup.y')+getProperty('dad.positionArray[1]'),1,'backOut')
            elseif v2 == '2' or v2 == '3' then
                local robot = 'Bird'
                if v2 == '3' then
                    robot = 'Lakitu'
                end
                setProperty(robot..'.visible',true)
                setObjectOrder(robot,getObjectOrder('dadGroup')+2)
                addLuaSprite(robot,false)
        
                setProperty(robot..'.x',screenWidth/2 - 170)
                setProperty(robot..'.y',screenHeight+200)
                doTweenY(robot..'Y',robot,screenHeight/2,1.2,'backOut')
            end
        elseif v1 == '25' then
            removeNintendos()
        elseif v1 == '27' then
            setOffs(0)
            if v2 == '0' then
                setProperty('camHUD.alpha',0)
                doTweenX('LakituX','Lakitu',0,0.5,'cubeOut')
                doTweenY('LakituY','Lakitu',400,1.5,'linear')
                addLuaSprite('Lakitu',true)
                setProperty('boyfriend.visible',false)
                setProperty('dad.visible',false)
                setProperty('gf.visible',false)
                setObjectOrder('blackFront',getObjectOrder('dadGroup')-1)
            elseif v2 == '1' then
                doTweenZoom('gameZoom','camGame',getProperty('defaultCamZoom')+0.5,5,'circIn')
                extraCharFunction('createCharacter',{'hunterChar',dad2,600,800,false})
                doTweenY('hunterY','hunterChar',0,2,'backOut')
            elseif v2 == '2' then

                addLuaSprite('Bird',true)
                doTweenX('BirdX','Bird',1000,0.5,'cubeOut')
                doTweenY('BirdY','Bird',400,1.5,'linear')
            elseif v2 == '3' then
                extraCharFunction('createCharacter',{'koopaChar',dad1,-400,800,false})
                doTweenY('koopaY','koopaChar',-50,1,'backOut')
            end
        elseif v1 == '29' and v2 == '1' then
            setMiddleScroll(true,0,false)

        elseif v1 == '30' then
            local health = 1
            if v2 ~= '' then
                health = tonumber(v2)
            end
            health = math.max(0.2,getHealth()-health)
            runHaxeCode(
                [[
                    FlxTween.tween(game,{health: ]]..health..[[},0.1,{ease: FlxEase.quadOut});
                    return;
                ]]
            )
        elseif v1 == '34' then
            if v2 == '1' and not hideHud then
                extraIcon('setIconProperty',{'dadIcon','followCharacterImage',false})
                extraIcon('loadIconGraphic',{'dadIcon','icon-sys'})
                extraIcon('setIconAsPrincipal',{'duckIcon'})
            end
        end
    elseif name == 'ycbu text' and v2 == '1' then
        playAnim('Bird','anim',true)
        playAnim('Lakitu','anim',true)
    end
end

function removeNintendos()
    setProperty('hunterChar.visible',false)
    setProperty('koopaChar.visible',false)
    setProperty('Lakitu.visible',false)
    setProperty('Bird.visible',false)
end
function extraIcon(func,vars)
    callScript('extra_scripts/extraIcon',func,vars)
end

function opponentNoteHit(id,data,type,sus)
    if (type == 'Yoshi Note' or type == 'AS Bud Note') or songPos >= 625900 and songPos <= 627350  then
        extraCharacterPlayAnim('hunterChar',getProperty('singAnimations['..data..']'),true,true)
    end
    if type == 'GF Sing' or type == 'GF Duet' or type == 'AS Bud Note' or songPos >= 617000 and songPos <= 618620 then
        extraCharacterPlayAnim('koopaChar',getProperty('singAnimations['..data..']'),true,true)
    end
end

function onTweenCompleted(tag)
    if tag == 'strumMovimentX' then
        removeLuaSprite('StrumMovimentX',true)
    end
end

function onUpdate()
    songPos = getSongPosition()
    if songPos >= 580330 then
        if songPos < 627450 then
            if luaSpriteExists('StrumMoviment') then
                strumMovimentForce = getProperty('StrumMoviment.x')
            end
            for strums = 0,3 do
                local posY = 50
                if downscroll then
                    posY = screenHeight - 150
                end
                posY = posY + (30 *math.sin(((songPos - 58033)/bpm/10 - (1.2*(3-strums))))* strumMovimentForce)
                setPropertyFromGroup('playerStrums',strums,'y',posY)
                setPropertyFromGroup('opponentStrums',strums,'y',posY)
            end
        end
    end
end

function noteMiss(id,data,type,sus)
    if curStep > 1438 and curStep < 1695 then
        setHealth(-1)
    end
end

function resetDadY()
    setProperty('dad.y',getProperty('dadGroup.y')+getProperty('dad.positionArray[1]'))
end

function goodNoteHit(id,data,type,sus)
    if type == 'Hey!' then
        playAnim('gf','Hey!',true)
        setProperty('gf.heyTimer',getProperty('boyfriend.heyTimer'))
    end
end
function setOffs(ofs,target)
    callScript('scripts/cameraMoviment','setOffs',{ofs,target})
end
function extraCharFunction(func,vars)
    callScript('extra_scripts/extraCharacter',func,vars)
end
function extraCharacterPlayAnim(character,anim,reset,isSingAnim)
    extraCharFunction('extraCharacterAnim',{character,anim,reset,isSingAnim})
end

function setMiddleScroll(middle,speed,visibleOpponentNotes)
    callScript('scripts/global_functions','setMiddleScroll',{middle,speed,visibleOpponentNotes})
end

function hudAlpha(alpha,speed)
    callScript('scripts/global_functions','hudAlpha',{alpha,speed,'expoInOut'})
end

function onSectionHit()
    if curSection == 8 then
        setProperty('boyfriend.alpha',1)
        setProperty('dad.alpha',1)
        setProperty('gf.alpha',1)

    elseif curSection == 357 then
        makeLuaSprite('StrumMoviment',nil,strumMovimentForce)
        doTweenX('StrumMovimentX','StrumMoviment',1,5,'linear')
        for strumNotes = 0,3 do
            setPropertyFromGroup('opponentStrums',strumNotes,'x',getPropertyFromGroup('playerStrums',strumNotes,'x'))
            noteTweenAlpha('noteUniAlpha'..strumNotes,strumNotes,0.3,5,'linear')
            if strumNotes < 2 then
                noteTweenX('noteUniX'..strumNotes,strumNotes,92 + (112*strumNotes),10,'linear')
            else
                noteTweenX('noteUniX'..strumNotes,strumNotes,732 + (112*strumNotes),10,'linear')
            end
        end

    elseif curSection == 381 then
        for strums = 0,3 do
            noteTweenAlpha('noteUniAlpha'..strums,strums,1,0.3,'cubeIn')
            noteTweenAlpha('noteUniAlpha'..(strums+4),strums+4,0,0.3,'cubeIn')
        end 
    elseif curSection == 390 then
        for strums = 0,2,2 do
            cancelTween('noteUniX'..(strums+4))
            cancelTween('noteUniY'..(strums+4))
            if strums == 0 or strums == 2 then
                setPropertyFromGroup('playerStrums',strums,'x',screenWidth/2+(112*strums) - 200)
                setPropertyFromGroup('playerStrums',strums,'y',screenHeight/2 - 50)
                setPropertyFromGroup('playerStrums',strums,'scale.x',1.2)
                setPropertyFromGroup('playerStrums',strums,'scale.y',1.2)
                noteTweenAlpha('noteUniAlpha'..(strums+4),strums+4,1,stepCrochet*0.012,'cubeIn')
            end
        end
    elseif curSection == 392 then
        for strums = 0,2,2 do
            noteTweenAlpha('noteUniAlpha'..(strums+4),strums+4,0,stepCrochet*0.003,'linear')
        end
    end
end