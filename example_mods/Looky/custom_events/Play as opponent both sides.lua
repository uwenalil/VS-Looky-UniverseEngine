---------------Options---------------
doNoteSplashes = true -- change this to active note splash	
showComboNum = true --shows the number of notes you hit consecutively
showRating = true --shows the classification of the note you got right
botdrain = true --health drain when bot hits a note (this only applies to levels that don't have health drain! example: tabi , mouse.avi )


comboOffset = {-300, -250, -300, -250}		--order is {ratingX, ratingY, numX, numY}		(the combo sprite uses numX and numY)

-- change the key you want to turn on or off the script here

--change the keys (needs to be in order: left, down, up, right) - example: {'D', 'F', 'J', 'K'}

keys = { 'A', 'S', 'NumpadFive', 'NumpadSix' }

-----dont change anything from this point on-----

scoreP2 = 0
comboP2 = 0
totalNotesHitP2 = 0
totalPlayedP2 = 0
hitsP2 = 0
songMissesP2 = 0
ratingsP2 = {sicks = 0, goods = 0, bads = 0, shits = 0}
onGameOverP2 = false
defaultCharacter = 'dad'
local ratingsData = {}
local ratingPercentP2 = 100
local ratingNameP2 = '?'
local ratingFCP2 = ''
local songSplashSkin = nil
local ratingCount = 0
local gfSinging = false
local noteMissesP2 = 0

function onCreate()		
	runHaxeCode([[
		game.setOnLuas("scoreP2", 0);
		game.setOnLuas("missesP2", 0);
		game.setOnLuas("noteMissesP2", 0);
		game.setOnLuas("comboP2", 0);
		game.setOnLuas("hitsP2", 0);
		
		game.setOnLuas("sicksP2", 0);
		game.setOnLuas("goodsP2", 0);
		game.setOnLuas("badsP2", 0);
		game.setOnLuas("shitsP2", 0);
		
		game.setOnLuas("onGameOverP2", false);
	]])
end
	
function onCreatePost()
        setProperty('cpuControlled', false)
		songSplashSkin = getPropertyFromGroup('unspawnNotes', 0, 'noteSplashTexture')
		
		if songSplashSkin == nil or songSplashSkin == 'noteSplashTexture' then 
			songSplashSkin = 'noteSplashes'
		end
			makeLuaText('scoreTxtP2', '', 0, 0, 1680)
			setObjectCamera('scoreTxtP2', 'hud')
			setProperty('scoreTxtP2.borderSize', 1.25)
			setTextSize('scoreTxtP2', 20)
			setTextAlignment('scoreTxtP2', 'center')
			setProperty('scoreTxtP2.visible', activated and not (getPropertyFromClass('ClientPrefs', 'hideHud')))
			addLuaText('scoreTxtP2', true)

			setProperty('scoreTxt.visible',true)

			setProperty('scoreTxt.y', 10)
			setProperty('scoreTxtP2.y', 680)		
			
			if getPropertyFromClass('ClientPrefs', 'downScroll') then
				setProperty('scoreTxt.y', 10)
				setProperty('scoreTxtP2.y', 10)
			end
			
			setTextString('scoreTxtP2', 'Score: '..scoreP2..' | Misses: '..songMissesP2..' | Rating: '..ratingNameP2)
			
			screenCenter('scoreTxtP2', 'x')
			
end

function onEvent(tag)
	if tag == 'Change Character' then
		runHaxeCode([[
			healthBarP1.createFilledBar(0xFF000000, 0xFF]]..healthBarColor('boyfriend')..[[);
			healthBarP1.updateBar();
			healthBarP2.createFilledBar(0xFF000000, 0xFF]]..healthBarColor('dad')..[[);
			healthBarP2.updateBar();
		]])
	end
end


function onUpdate(elapsed) 
	setProperty('scoreTxtP2.visible', getProperty('scoreTxt.visible'))
	setProperty('scoreTxtP2.alpha', getProperty('scoreTxt.alpha'))
	setProperty('scoreTxtP2.color', getProperty('scoreTxt.color'))

		runHaxeCode([[
			
			game.setOnLuas("scoreP2", ]]..scoreP2..[[);
			game.setOnLuas("missesP2", ]]..songMissesP2..[[);
			game.setOnLuas("noteMissesP2", ]]..noteMissesP2..[[);
			game.setOnLuas("comboP2", ]]..comboP2..[[);
			game.setOnLuas("hitsP2", ]]..hitsP2..[[);
			
			game.setOnLuas("sicksP2", ]]..ratingsP2.sicks..[[);
			game.setOnLuas("goodsP2", ]]..ratingsP2.goods..[[);
			game.setOnLuas("badsP2", ]]..ratingsP2.bads..[[);
			game.setOnLuas("shitsP2", ]]..ratingsP2.shits..[[);
			
			game.setOnLuas("onGameOverP2", ]]..tostring(onGameOverP2)..[[);
		]])

		if not (cpuControlled) and not (getProperty('inCutscene')) then
			keyShit()
			keyHoldShit()
		else
			keyShit()
			keyHoldShit()
		end
		
			if getProperty('health') > 2 then
							
					onGameOverP2 = true
						
						runHaxeCode([[
							game.boyfriend.stunned = true;
							PlayState.deathCounter++;

							game.paused = true;

							game.vocals.stop();
							FlxG.sound.music.stop();

							game.persistentUpdate = false;
							game.persistentDraw = false;
							
							for (tween in game.modchartTweens) {
								tween.active = true;
							}
							for (timer in game.modchartTimers) {
								timer.active = true;
							}
							
							game.openSubState(new GameOverSubstate(game.dad.getScreenPosition().x - game.dad.positionArray[0], game.dad.getScreenPosition().y - game.dad.positionArray[1], game.camFollowPos.x, game.camFollowPos.y));
							game.isDead = true;
						]])

			end		

		if isCharacter(defaultCharacter) then
			animThingP2(elapsed)
		end
end

function keyShit()
	for i = 1, #keys do
	
		if not (i > getProperty('opponentStrums.length')) then
		
			if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.'..keys[i]:upper()) then
				strumPlayAnim(i - 1, 'pressed', true, -1)
				onKeyPressP2(i - 1)
			end
			
			if getPropertyFromClass('flixel.FlxG', 'keys.justReleased.'..keys[i]:upper()) then
				strumPlayAnim(i - 1, 'static', true, 0)
			end		
		end		
	end			
end

function keyHoldShit()

	for i = 1, #keys do
	
		if not (i > getProperty('opponentStrums.length')) then
	
			if getPropertyFromClass('flixel.FlxG', 'keys.pressed.'..keys[i]:upper()) then
				runHaxeCode([[
					var key = ]]..(i - 1)..[[;
					
					game.notes.forEachAlive(function(daNote)
					{
						if (daNote.isSustainNote && !daNote.mustPress && daNote.canBeHit && !daNote.tooLate && !daNote.hitByOpponent && !daNote.blockHit)
						{
							if (daNote.noteData == key)
								game.callOnLuas('goodNoteHitP2', [game.notes.members.indexOf(daNote), daNote.noteData, daNote.noteType, daNote.isSustainNote], true);
						}
					});
				]])
			end		
		end		
	end

function onSpawnNote(id)
		if not (getPropertyFromGroup('notes', id, 'mustPress')) then
		
			if getPropertyFromGroup('notes', id, 'ignoreNote') or getPropertyFromGroup('notes', id, 'hitCausesMiss') then
				setPropertyFromGroup('notes', id, 'rating', 'ignore')
			end			
		end
		
		if not (getPropertyFromGroup('notes', i, 'mustPress')) then
			
			setPropertyFromGroup('notes', id, 'ignoreNote', true)

		else
		setPropertyFromGroup('notes', id, 'hitHealth', 0)
			
			setPropertyFromGroup('notes', id, 'rating', '')
			
		end
	end	
end

function onUpdatePost(elapsed)
		if ('camHUD.visible') then
							-- your notes
				noteTweenX("Mdx5", 0, 410, 0.01, "linear");
				noteTweenX("Mdx6", 1, 522, 0.01, "linear");
				noteTweenX("Mdx7", 2, 633, 0.01, "linear");
				noteTweenX("Mdx8", 3, 745, 0.01, "linear");
						-- bf notes
				setPropertyFromGroup('strumLineNotes', 4, 'x', 410);
				setPropertyFromGroup('strumLineNotes', 5, 'x', 522);
				setPropertyFromGroup('strumLineNotes', 6, 'x', 633);
				setPropertyFromGroup('strumLineNotes', 7, 'x', 745);
						for i=7,4,-1 do
							noteTweenAlpha('note' .. i .. 'alphatween', i, 1, 0.01, 'linear')
						end
							-- your notes alpha
						for i=3,0,-1 do
							noteTweenAlpha('note' .. i .. 'alphatween', i, 1, 0.01, 'linear')
						end	
			
		end	
	
		for i = 0, getProperty('notes.length')-1 do

			if not (getPropertyFromGroup('notes', i, 'mustPress')) then
				
					if getPropertyFromGroup('notes', i, 'strumTime') > getPropertyFromClass('Conductor', 'songPosition') - (getPropertyFromClass('Conductor', 'safeZoneOffset') * getPropertyFromGroup('notes', i, 'lateHitMult'))
						and getPropertyFromGroup('notes', i, 'strumTime') < getPropertyFromClass('Conductor', 'songPosition') + (getPropertyFromClass('Conductor', 'safeZoneOffset') * getPropertyFromGroup('notes', i, 'earlyHitMult')) then
							setPropertyFromGroup('notes', i, 'canBeHit', true)
					else
						setPropertyFromGroup('notes', i, 'canBeHit', false)
					end
					
					if getPropertyFromGroup('notes', i, 'strumTime') < getPropertyFromClass('Conductor', 'songPosition') - getPropertyFromClass('Conductor', 'safeZoneOffset') and not (getPropertyFromGroup('notes', i, 'hitByOpponent')) then
						setPropertyFromGroup('notes', i, 'tooLate', true)
					end

				if getPropertyFromClass('Conductor', 'songPosition') > (getProperty('noteKillOffset') - 15) + getPropertyFromGroup('notes', i, 'strumTime') then
				
					setPropertyFromGroup('notes', i, 'strumTime', getPropertyFromClass('Conductor', 'songPosition'))

					if not (cpuControlled) and not (getPropertyFromGroup('notes', i, 'rating') == 'ignore') and not (getProperty('endingSong')) 
					and (getPropertyFromGroup('notes', i, 'tooLate') or not (getPropertyFromGroup('notes', i, 'hitByOpponent'))) then
						noteMissP2(i)
					end
					
					setPropertyFromGroup('notes', i, 'active', false)
					setPropertyFromGroup('notes', i, 'visible', false)
					removeFromGroup('notes', i)
					
				end
			end			
		end
end

function onKeyPressP2(key)
		runHaxeCode([[
			var key = ]]..key..[[;
			
			if (game.startedCountdown && !game.paused && key > -1)
			{
				if(game.generatedMusic && !game.endingSong)
				{
					var pressNotes = [];
					var notesStopped = false;

					var sortedNotesList = [];
					game.notes.forEachAlive(function(daNote)
					{
						if (daNote.canBeHit && !daNote.mustPress && !daNote.tooLate && !daNote.hitByOpponent && !daNote.isSustainNote && !daNote.blockHit)
						{
							if(daNote.noteData == key)
							{
								sortedNotesList.push(daNote);
							}
						}
					});
					sortedNotesList.sort(game.sortHitNotes);

					if (sortedNotesList.length > 0) 
					{
						for (epicNote in sortedNotesList)
						{
							for (doubleNote in pressNotes) 
							{
								if (Math.abs(doubleNote.strumTime - epicNote.strumTime) < 1) 
								{
									doubleNote.kill();
									game.notes.remove(doubleNote, true);
									doubleNote.destroy();
								} 
								else 
									notesStopped = true;
							}

							if (!notesStopped) 
							{
								game.callOnLuas('goodNoteHitP2', [game.notes.members.indexOf(epicNote), epicNote.noteData, epicNote.noteType, epicNote.isSustainNote], true);
								pressNotes.push(epicNote);
							}
						}
					}
					else
					{
						game.callOnLuas('onGhostTapP2', [key], true);
						if (!ClientPrefs.ghostTapping) 
							game.callOnLuas('noteMissPressP2', [key], true);
					}
				}
			}
		]])
	
	callOnLuas('onKeyPressP2', {key}, true, false, {scriptName})
	
end

function goodNoteHitP2(id, noteData, noteType, isSustainNote)

	if not (getPropertyFromGroup('notes', id, 'hitByOpponent')) then

		if not (formatToSongPath(getPropertyFromClass('PlayState', 'SONG.song')) == 'tutorial') then
			setProperty('camZooming', true)
		end

		if getPropertyFromGroup('notes', id, 'hitCausesMiss') then

			if not (getPropertyFromGroup('notes', id, 'noteSplashDisabled')) and not (isSustainNote) and doNoteSplashes then
				spawnNoteSplash(id)
			end

			if not (getPropertyFromGroup('notes', id, 'noMissAnimation')) then

				if noteType == 'Hurt Note' then
				
					playAnim(defaultCharacter, 'hurt', true)
					
					if isCharacter(defaultCharacter) then 
						setProperty(defaultCharacter..'.specialAnim', true)
					end					
				end				
			end

			setPropertyFromGroup('notes', id, 'hitByOpponent', true)
			
			noteMissP2(id)
			
			if not (isSustainNote) then
				removeFromGroup('notes', id)
			else
				setPropertyFromGroup('notes', id, 'ignoreNote', false)
			end				
			return			
		end
		
		if not (isSustainNote) then
		
			comboP2 = comboP2 + 1
			if comboP2 > 99999 then combo = 99999 end	
			popUpScore(id)			
		end
		
			if getProperty('health') > getPropertyFromGroup('notes', id, 'hitHealth') * getProperty('healthGain') then
					setProperty('health', getProperty('health') - getPropertyFromGroup('notes', id, 'hitHealth') * getProperty('healthGain'))
			end		

		if not (getPropertyFromGroup('notes', id, 'noAnimation')) then

			local animToPlay = ''
			
				animToPlay = getProperty('singAnimations')[noteData + 1]
			
			local animSuffix = getPropertyFromGroup('notes', id, 'animSuffix')
			if noteType == 'Alt Animation' or altAnim then animSuffix = '-alt' end
			
			if getPropertyFromGroup('notes', id, 'gfNote') then
			
				if not (getProperty('gf') == nil) then
				
					playAnim('gf', animToPlay..animSuffix, true)
					
					if not (animSuffix == '') and not (getProperty('gf.animation.curAnim.name') == animToPlay..animSuffix) then
						playAnim('gf', animToPlay, true)
					end
				
					setProperty('gf.holdTimer', 0)
					
					gfSinging = true
					
				end
				
			else
			
				playAnim(defaultCharacter, animToPlay..animSuffix, true)
				
				if not (animSuffix == '') and not (getProperty(defaultCharacter..'.animation.curAnim.name') == animToPlay..animSuffix) then
					playAnim(defaultCharacter, animToPlay, true)
				end
				
				if isCharacter(defaultCharacter) then 
					setProperty(defaultCharacter..'.holdTimer', 0)
				end

				gfSinging = false				
			end
			
			if noteType == 'Hey!' then
			
				playAnim(defaultCharacter, 'hey', true)
				
				if isCharacter(defaultCharacter) then
					setProperty(defaultCharacter..'.specialAnim', true)
					setProperty(defaultCharacter..'.heyTimer', 0.6)
				end
				
				if not (getProperty('gf') == nil) then
					playAnim('gf', 'cheer', true)
					setProperty('gf.specialAnim', true)
					setProperty('gf.heyTimer', 0.6)
				end				
			end		
		end
		
		local time = 0

		if isSustainNote then
			strumPlayAnim(noteData % getProperty('opponentStrums.length'), 'confirm', true, time)		
		else			
			strumPlayAnim(noteData % getProperty('opponentStrums.length'), 'confirm', true, time)
			
		end
		
		setPropertyFromGroup('notes', id, 'hitByOpponent', true)
		setProperty('vocals.volume', 1)
		callOnLuas('opponentNoteHit', {id, noteData, noteType, isSustainNote}, true, false, {scriptName})
		
		if not (isSustainNote) then
			removeFromGroup('notes', id)
		else
			setPropertyFromGroup('notes', id, 'ignoreNote', false)
		end		
	end	
end

function noteMissP2(id)
	runHaxeCode([[
		var daNote = game.notes.members[]]..id..[[];
	
		game.notes.forEachAlive(function(note) {
			if (daNote != note && !daNote.mustPress && daNote.noteData == note.noteData && daNote.isSustainNote == note.isSustainNote && Math.abs(daNote.strumTime - note.strumTime) < 1) {
				note.kill();
				game.notes.remove(note, true);
				note.destroy();
			}
		});
	]])

	comboP2 = 0
	setProperty('health', getProperty('health') + (getPropertyFromGroup('notes', id, 'missHealth') * getProperty('healthLoss')))
	
	if getProperty('instakillOnMiss') then
	  setProperty('health', 2)
	end
	
	songMissesP2 = songMissesP2 + 1
	noteMissesP2 = noteMissesP2 + 1
	
	setProperty('vocals.volume', 0)
	
	if not (getProperty('practiceMode')) then scoreP2 = scoreP2 - 10 end
	totalPlayedP2 = totalPlayedP2 + 1
	RecalculateRating(true)
	
	local char = defaultCharacter
	if getPropertyFromGroup('notes', id, 'gfNote') then
		char = 'gf'
	end
	
	local animSuffix = getPropertyFromGroup('notes', id, 'animSuffix')
	
	if getPropertyFromGroup('notes', id, 'noteType') == 'Alt Animation' or altAnim then 
		animSuffix = '-alt' 
	end

	if not (getPropertyFromGroup('notes', id, 'noMissAnimation')) then
	
		if not (isCharacter(char)) or getProperty(char..'.hasMissAnimations') then
		
			local animToPlay = ''
		
				animToPlay = getProperty('singAnimations')[getPropertyFromGroup('notes', id, 'noteData') + 1]..'miss'
	
			playAnim(char, animToPlay..animSuffix, true)
			
			if not (animSuffix == '') and not (getProperty(char..'.animation.curAnim.name') == animToPlay..animSuffix) then
				playAnim(char, animToPlay, true)
			end
			
			setProperty(char..'.specialAnim', true)
		
		end	
	end
	
	callOnLuas('noteMissP2', {id, getPropertyFromGroup('notes', id, 'noteData'), getPropertyFromGroup('notes', id, 'noteType'), getPropertyFromGroup('notes', id, 'isSustainNote')}, true, false, {scriptName})
	
end

function noteMissPressP2(direction)
	if getPropertyFromClass('ClientPrefs', 'ghostTapping') then return end

	if doMissDrainP2 then
		setProperty('health', getProperty('health') + (0.05 * getProperty('healthLoss')))
	end
	
	setProperty('vocals.volume', 0)
	
	if getProperty('instakillOnMiss') then
			setProperty('health', 1.9)	
	end
	
	comboP2 = 0
	
	if not (getProperty('practiceMode')) then scoreP2 = scoreP2 - 10 end
	if not (getProperty('endingSong')) then songMissesP2 = songMissesP2 + 1 end
	totalPlayedP2 = totalPlayedP2 + 1
	RecalculateRating(true)
	
	playSound('missnote'..getRandomInt(1, 3), getRandomFloat(0.1, 0.2))
	
	if not (isCharacter(defaultCharacter)) or getProperty(defaultCharacter..'.hasMissAnimations') then
	
		local animToPlay = ''
		
			animToPlay = getProperty('singAnimations')[direction + 1]..'miss'
		
		playAnim(defaultCharacter, animToPlay, true)
		setProperty(defaultCharacter..'.specialAnim', true)
	end
end

function spawnNoteSplash(id)
	local noteData = getPropertyFromGroup('notes', id, 'noteData')
	local x = getPropertyFromGroup('opponentStrums', noteData, 'x')
	local y = getPropertyFromGroup('opponentStrums', noteData, 'y')

	runHaxeCode([[
		game.spawnNoteSplash(]]..x..[[, ]]..y..[[, game.notes.members[]]..id..[[].noteData, game.notes.members[]]..id..[[])
	]])
	
end

function popUpScore(id)	
	local noteDiff = math.abs(getPropertyFromGroup('notes', id, 'strumTime') - getPropertyFromClass('Conductor', 'songPosition') + getPropertyFromClass('ClientPrefs', 'ratingOffset'))
	
	ratingsData = {}
	
	for i = 1, getProperty('ratingsData.length') do
	
		ratingsData[i] = {}
		
		ratingsData[i].name = getProperty('ratingsData['..(i - 1)..'].name')
		
		if not (getProperty('ratingsData['..(i - 1)..'].image') == nil) then
			ratingsData[i].image = getProperty('ratingsData['..(i - 1)..'].image')
		else
			ratingsData[i].image = getProperty('ratingsData['..(i - 1)..'].name')
		end
		
		if not (getProperty('ratingsData['..(i - 1)..'].counter') == nil) then
			ratingsData[i].counter = getProperty('ratingsData['..(i - 1)..'].counter')
		else
			ratingsData[i].counter = getProperty('ratingsData['..(i - 1)..'].name')..'s'
		end

		ratingsData[i].ratingMod = getProperty('ratingsData['..(i - 1)..'].ratingMod')
		ratingsData[i].score = getProperty('ratingsData['..(i - 1)..'].score')
		ratingsData[i].noteSplash = getProperty('ratingsData['..(i - 1)..'].noteSplash')
		ratingsData[i].hitWindow = getProperty('ratingsData['..(i - 1)..'].hitWindow')
		
	end

	if tonumber(playbackRate) == nil or not (type(playbackRate) == 'number') then playbackRate = 1 end
	local daRating = judgeNote(noteDiff / playbackRate)

	for i = 1, #ratingsData do
	
		if daRating == ratingsData[i].name then
		
			if not (getPropertyFromGroup('notes', id, 'ratingDisabled')) then
			
				if ratingsP2[ratingsData[i].counter] == nil then
					ratingsP2[ratingsData[i].counter] = 0
				end
				
				ratingsP2[ratingsData[i].counter] = ratingsP2[ratingsData[i].counter] + 1
				
			end
			
			totalNotesHitP2 = totalNotesHitP2 + ratingsData[i].ratingMod
			
			setPropertyFromGroup('notes', id, 'rating', ratingsData[i].name)
			setPropertyFromGroup('notes', id, 'ratingMod', ratingsData[i].ratingMod)

			if not (getProperty('practiceMode')) then
				scoreP2 = scoreP2 + ratingsData[i].score
			end

			if ratingsData[i].noteSplash and doNoteSplashes and not (getPropertyFromGroup('notes', id, 'noteSplashDisabled')) then
				spawnNoteSplash(id)
			end
				
			ratingComboStuff(ratingsData[i].name, noteDiff, ratingsData[i].image)
			
		end
	
	end
	
	if not (getProperty('practiceMode')) and not (getPropertyFromGroup('notes', id, 'ratingDisabled')) then
		hitsP2 = hitsP2 + 1
		totalPlayedP2 = totalPlayedP2 + 1
		RecalculateRating(false)
	end

end

function ratingComboStuff(rating, diff, ratingImg)
	if not (showComboNum) and not (showRating) then return end
	if ratingImg == nil then ratingImg = rating end

	makeLuaText('coolText', comboP2, 0, 0, 0)
	setTextSize('coolText', 32)
	screenCenter('coolText')
	setProperty('coolText.x', screenWidth * 0.35)

	local pixelShitPart1 = ""
	local pixelShitPart2 = ''

	if getPropertyFromClass('PlayState', 'isPixelStage') then
		pixelShitPart1 = 'pixelUI/'
		pixelShitPart2 = '-pixel'
	end

	local sprName = 'rating'..ratingCount
	local comboName = 'combo'..ratingCount
	

	makeLuaSprite(sprName, pixelShitPart1..ratingImg..pixelShitPart2)
	setObjectCamera(sprName, 'camHUD')
	screenCenter(sprName)
	setProperty(sprName..'.x', getProperty('coolText.x') - 40)
	setProperty(sprName..'.y', getProperty(sprName..'.y') - 60)
	setProperty(sprName..'.acceleration.y', 550 * playbackRate * playbackRate)
	setProperty(sprName..'.velocity.y', getProperty(sprName..'.velocity.y') - getRandomInt(140, 175) * playbackRate)
	setProperty(sprName..'.velocity.x', getProperty(sprName..'.velocity.x') - getRandomInt(0, 10) * playbackRate)
	setProperty(sprName..'.visible', not getPropertyFromClass('ClientPrefs', 'hideHud') and showRating)
	setProperty(sprName..'.x', getProperty(sprName..'.x') + comboOffset[1])
	setProperty(sprName..'.y', getProperty(sprName..'.y') - comboOffset[2])
	
	setObjectOrder(sprName, getObjectOrder('strumLineNotes'))
		
	if showRating then
		addLuaSprite(sprName, false)
	else
		setProperty(sprName..'.alpha', 0)
	end
	
	
	setObjectOrder(comboName, getObjectOrder('strumLineNotes'))


	if not getPropertyFromClass('PlayState', 'isPixelStage') then
		scaleObject(sprName, 0.7, 0.7)
		setProperty(sprName..'.antialiasing', getPropertyFromClass('ClientPrefs', 'globalAntialiasing'))
		scaleObject(comboName, 0.7, 0.7)
		setProperty(comboName..'.antialiasing', getPropertyFromClass('ClientPrefs', 'globalAntialiasing'))
	else
		scaleObject(sprName, 6 * 0.85, 6 * 0.85)
		setProperty(sprName..'.antialiasing', false)
		scaleObject(comboName, 6 * 0.85, 6 * 0.85)
		setProperty(comboName..'.antialiasing', false)
	end

	updateHitbox(comboName)
	updateHitbox(sprName)
	
	local separatedScore = {}
	
	if comboP2 >= 1000 then
		separatedScore[#separatedScore + 1] = math.floor(comboP2 / 1000) % 10
	end
	separatedScore[#separatedScore + 1] = math.floor(comboP2 / 100) % 10
	separatedScore[#separatedScore + 1] = math.floor(comboP2 / 10) % 10
	separatedScore[#separatedScore + 1] = comboP2 % 10


	local daLoop = 0
	local xThing = 0
	for i = 1, #separatedScore do
	
		local comboNumName = i..'num'..ratingCount
		
		makeLuaSprite(comboNumName, pixelShitPart1..'num'..separatedScore[i]..pixelShitPart2)
		setObjectCamera(comboNumName, 'camHUD')
		screenCenter(comboNumName)
		setProperty(comboNumName..'.x', getProperty('coolText.x') + (43 * daLoop) - 90)
		setProperty(comboNumName..'.y', getProperty(comboNumName..'.y') + 80)
		
		setProperty(comboNumName..'.x', getProperty(comboNumName..'.x') + comboOffset[3])
		setProperty(comboNumName..'.y', getProperty(comboNumName..'.y') - comboOffset[4])

		if not getPropertyFromClass('PlayState', 'isPixelStage') then
			setProperty(comboNumName..'.antialiasing', getPropertyFromClass('ClientPrefs', 'globalAntialiasing'))
			scaleObject(comboNumName, 0.5, 0.5)
		else
			setProperty(comboNumName..'.antialiasing', false)
			scaleObject(comboNumName, 6, 6)
		end
		updateHitbox(comboNumName)

		setProperty(comboNumName..'.acceleration.y', getRandomInt(200, 300) * playbackRate * playbackRate)
		setProperty(comboNumName..'.velocity.y', getProperty(comboNumName..'.velocity.y') - getRandomInt(140, 160) * playbackRate)
		setProperty(comboNumName..'.velocity.x', getRandomInt(-5, 5) * playbackRate)
		setProperty(comboNumName..'.visible', not getPropertyFromClass('ClientPrefs', 'hideHud'))
		
		setObjectOrder(comboNumName, getObjectOrder('strumLineNotes'))

		if showComboNum then
			addLuaSprite(comboNumName, false)
		else
			setProperty(comboNumName..'.alpha', 0)
		end
		
		daLoop = daLoop + 1
		if getProperty(comboNumName..'.x') > xThing then xThing = getProperty(comboNumName..'.x') end
		
	end
	setProperty(comboName..'.x', xThing + 50)

	runTimer(sprName, crochet * 0.001 / playbackRate, 1)
	runTimer(comboName, crochet * 0.001 / playbackRate, 1)
	runTimer('num'..ratingCount, crochet * 0.002 / playbackRate, 1)
	
	ratingCount = ratingCount + 1
	
	if ratingCount > 100 then
		ratingCount = 0
	end

end

function onTimerCompleted(tag)
	if string.find(tag, 'rating') or string.find(tag, 'combo') or tag == 'currentTimingShown' then
		doTweenAlpha(tag, tag, 0, 0.2 / playbackRate)
	end
	
	if string.find(tag, 'num') then
		doTweenAlpha('1'..tag, '1'..tag, 0, 0.2 / playbackRate)
		doTweenAlpha('2'..tag, '2'..tag, 0, 0.2 / playbackRate)
		doTweenAlpha('3'..tag, '3'..tag, 0, 0.2 / playbackRate)
		doTweenAlpha('4'..tag, '4'..tag, 0, 0.2 / playbackRate)
	end
	
	if tag == 'state' then
			removeLuaText('on', false)
			removeLuaText('off', false)
	end
end

function onTweenCompleted(tag)
	if string.find(tag, 'rating') or string.find(tag, 'combo') or tag == 'currentTimingShown' then
		removeLuaSprite(tag, true)
	end
	
	if string.find(tag, 'num') then
		removeLuaSprite('1'..tag, true)
		removeLuaSprite('2'..tag, true)
		removeLuaSprite('3'..tag, true)
		removeLuaSprite('4'..tag, true)
	end	

end

function judgeNote(diff)
	for i = 1, #ratingsData-1 do

		if diff <= ratingsData[i].hitWindow then
			return ratingsData[i].name
		end	
	end
	
	return ratingsData[#ratingsData].name	
end

function RecalculateRating(badHit)
	local ratingStuff = getPropertyFromClass('PlayState', 'ratingStuff')

	if totalPlayedP2 < 1 then
		ratingNameP2 = '?'
	else

		ratingPercentP2 = math.min(1, math.max(0, totalNotesHitP2 / totalPlayedP2))
		
		if ratingPercentP2 >= 1 then
			ratingNameP2 = ratingStuff[#ratingStuff][1]
		else
		
			for i = 1, #ratingStuff do
			
				if ratingPercentP2 < ratingStuff[i][2] then
					ratingNameP2 = ratingStuff[i][1]
					break
				end				
			end			
		end
		
		ratingFCP2 = ''
		if ratingsP2.sicks > 0 then ratingFCP2 = 'SFC' end
		if ratingsP2.goods > 0 then ratingFCP2 = 'GFC' end
		if ratingsP2.bads > 0 or ratingsP2.shits > 0 then ratingFCP2 = 'FC' end
		if songMissesP2 > 0 and songMissesP2 < 10 then ratingFCP2 = 'SDCB'
		elseif songMissesP2 >= 10 then ratingFCP2 = 'Clear' end		
	end

	updateScore(badHit)	
end

function updateScore(miss)
	if ratingNameP2 == '?' then
		setProperty('scoreTxtP2.text', 'Score: '..scoreP2..' | Misses: '..songMissesP2..' | Rating: '..ratingNameP2)
	else
		setProperty('scoreTxtP2.text', 'Score: '..scoreP2..' | Misses: '..songMissesP2..' | Rating: '..ratingNameP2..' ('..floorDecimal(ratingPercentP2 * 100, 2)..'%) - '..ratingFCP2)
	end

	if getPropertyFromClass('ClientPrefs', 'scoreZoom') and not (miss) and not (cpuControlled) then

		setProperty('scoreTxtP2.scale.x', 1.075)
		setProperty('scoreTxtP2.scale.y', 1.075)		
		doTweenX('scoreTxtP2scaleX', 'scoreTxtP2.scale', 1, 0.2)
		doTweenY('scoreTxtP2scaleY', 'scoreTxtP2.scale', 1, 0.2)		
	end
end

function animThingP2(elapsed)
	local controlHoldArray = {}
	
	for i = 1, #keys do
		controlHoldArray[i] = getPropertyFromClass('flixel.FlxG', 'keys.pressed.'..keys[i])
	end

	if cpuControlled or gfSinging then
	
		for i = 1, #controlHoldArray do
			controlHoldArray[i] = false
		end		
	end
	
	local thing = getPropertyFromClass('Conductor', 'stepCrochet') * 0.0011 * getProperty(defaultCharacter..'.singDuration')
	
	if table.contains(controlHoldArray, true) then
	
		if getProperty(defaultCharacter..'.holdTimer') > thing - 0.03 then
			setProperty(defaultCharacter..'.holdTimer', thing - 0.03)
		end		
	end	
end

function scoreTxtStuff()
	if not (getTextFont('scoreTxt') == 'VCR OSD Mono' or getTextFont('scoreTxt') == 'Pixel Arial 11 Bold')
	and not (getTextFont('scoreTxtP2') == getTextFont('scoreTxt')) then
		setProperty('scoreTxtP2.font', getTextFont('scoreTxt'))
	else
	
		if getTextFont('scoreTxt') == 'VCR OSD Mono' and not (getTextFont('scoreTxtP2') == 'VCR OSD Mono') then
			setTextFont('scoreTxtP2', 'vcr.ttf')
		end
		
		if getTextFont('scoreTxt') == 'Pixel Arial 11 Bold' and not (getTextFont('scoreTxtP2') == 'Pixel Arial 11 Bold') then
			setTextFont('scoreTxtP2', 'pixel.otf')
		end	
	end
	
	if not (getTextSize('scoreTxtP2') == getTextSize('scoreTxt')) then
		setTextSize('scoreTxtP2', getTextSize('scoreTxt'))
	end
	
	screenCenter('scoreTxtP2', 'x')
	
end

function strumPlayAnim(id, anim, forced, resetTime)
	if resetTime == nil then resetTime = 0 end
	if forced == nil then forced = false end
	
	if forced then
		setPropertyFromGroup('strumLineNotes', id, 'animation.name', nil)
	end
	
	setPropertyFromGroup('strumLineNotes', id, 'animation.name', anim) --play animation
	setPropertyFromGroup('strumLineNotes', id, 'resetAnim', resetTime)
	
	setPropertyFromGroup('strumLineNotes', id, 'origin.x', getPropertyFromGroup('strumLineNotes', id, 'frameWidth') / 2)
	setPropertyFromGroup('strumLineNotes', id, 'origin.y', getPropertyFromGroup('strumLineNotes', id, 'frameHeight') / 2)
	setPropertyFromGroup('strumLineNotes', id, 'offset.x', (getPropertyFromGroup('strumLineNotes', id, 'frameWidth') - getPropertyFromGroup('strumLineNotes', id, 'width')) / 2)
	setPropertyFromGroup('strumLineNotes', id, 'offset.y', (getPropertyFromGroup('strumLineNotes', id, 'frameHeight') - getPropertyFromGroup('strumLineNotes', id, 'height')) / 2)
end


function isCharacter(char)
	if char == 'boyfriend' or char == 'dad' or char == 'gf' then
		return true
	end
	
	return false
end

function dance(char)
	if not (getProperty(char..'.specialAnim')) then

		if isCharacter(char) and getProperty(char..'.danceIdle') then
		
			setProperty(char..'.danced', not getProperty(char..'.danced'))
			
			if getProperty(char..'.danced') then
				playAnim(char, 'danceRight'..getProperty(char..'.idleSuffix'), true)
			else
				playAnim(char, 'danceLeft'..getProperty(char..'.idleSuffix'), true)
			end
			
		else
			playAnim(char, 'idle'..getProperty(char..'.idleSuffix'), true)
		end	
	end
end


function floorDecimal(value, decimals)
	if decimals < 1 then
		return math.floor(value)
	end

	local tempMult = 1
	for i = 0, decimals-1 do
		tempMult = tempMult * 10
	end
	local newValue = math.floor(value * tempMult)
	return newValue / tempMult	
end

function table.contains(table, val)
	for i = 1, #table do

		if table[i] == val then
			return true
		end

	end
	return false
end

function formatToSongPath(path)
	local invalidChars = {'~', '&', '\\', ';', ':', '<', '>', '#'}
	local hideChars = {'.', ',', "'", '"', '%', '?', '!'}

	for i = 1, #invalidChars do
	
		if not (string.find(path, invalidChars[i], 1, true) == nil) then
			path = string.gsub(path, invalidChars[i], '-')
		end	
	end

	for i = 1, #hideChars do
	
		if not (string.find(path, hideChars[i], 1, true) == nil) then
			path = string.gsub(path, hideChars[i], '')
		end	
	end

	if string.find(path, ' ') then
		path = string.gsub(path, ' ', '-')
	end

	return path:lower()	
end

function rgbToHex(r, g, b)
	return string.format("%02x%02x%02x", math.floor(r), math.floor(g), math.floor(b))
end

function healthBarColor(char)
    return rgbToHex(getProperty(char..'.healthColorArray[0]'), getProperty(char..'.healthColorArray[1]'), getProperty(char..'.healthColorArray[2]'))
end

function getKeyFromID(key)

	if key > -1 and not (key == nil) then
		return keys[key + 1]
	end
	
	return -1

end

function goodNoteHit()
  health = getProperty('health')
	if botdrain then
		if getProperty('health') < 1.7 then
			setProperty('health', health+ 0.020);
		end
	end
end

function onBeatHit()
	if curBeat == 15 then
		removeLuaText('side')
		removeLuaText('sidebot')
	end
end	


function opponentNoteHit()
		health = getProperty('health')
			if botdrain then
				if getProperty('health') > 0.5 then
					setProperty('health', health- 0.020);
				end
			end
end
