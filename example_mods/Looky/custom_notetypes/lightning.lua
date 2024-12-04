function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is the note it is
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'lightning' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'lightning'); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'missHealth', 0);
			end
		end
	end
	--debugPrint('Script started!')
end

-- WOAH! DON'T LOOK! IT'S A MESS IN HERE!
-- yeah yeah i did just wing it

local shock0 = false
local shock1 = false
local shock2 = false
local shock3 = false

local yikes0 = 0
local yikes1 = 0
local yikes2 = 0
local yikes3 = 0

local orix0 = 0
local orix1 = 0
local orix2 = 0
local orix3 = 0

function noteMiss(id, direction, noteType, isSustainNote)
    if noteType == "lightning" then
		if direction == 0 then
			shock0 = true
			yikes0 = yikes0 + 300
			orix0 = getPropertyFromGroup('playerStrums', 0, 'x')
			makeLuaSprite('thunder', 'thunder', orix0, -20);
	 	      addLuaSprite('thunder', true);
		      setLuaSpriteScrollFactor('thunder',0,0)
			setObjectCamera('thunder', 'other')
			doTweenAlpha('thunder','thunder',0,2,'linear')
		elseif direction == 1 then
			shock1 = true
			yikes1 = yikes1 + 300
			orix1 = getPropertyFromGroup('playerStrums', 1, 'x')
			makeLuaSprite('thunder1', 'thunder', orix1, -20);
	  	  	addLuaSprite('thunder1', true);
	    		setLuaSpriteScrollFactor('thunder1',0,0)
			setObjectCamera('thunder1', 'other')
			doTweenAlpha('thunder1','thunder1',0,2,'linear')
		elseif direction == 2 then
			shock2 = true
			yikes2 = yikes2 + 300
			orix2 = getPropertyFromGroup('playerStrums', 2, 'x')
			makeLuaSprite('thunder2', 'thunder', orix2, -20);
	     		addLuaSprite('thunder2', true);
	     		setLuaSpriteScrollFactor('thunder2',0,0)
			setObjectCamera('thunder2', 'other')
			doTweenAlpha('thunder2','thunder2',0,2,'linear')
		elseif direction == 3 then
			shock3 = true
			yikes3 = yikes3 + 300
			orix3 = getPropertyFromGroup('playerStrums', 3, 'x')
			makeLuaSprite('thunder3', 'thunder', orix3, -20);
	     		addLuaSprite('thunder3', true);
	     		setLuaSpriteScrollFactor('thunder3',0,0)
			setObjectCamera('thunder3', 'other')
			doTweenAlpha('thunder3','thunder3',0,2,'linear')
		end
		playSound('thunder', 1)
	end
end

function onUpdatePost(elapsed)
    for a = 0, getProperty('notes.length') - 1 do
        if getPropertyFromGroup('notes', a, 'noteType') == 'lightning' then
            setPropertyFromGroup('notes', a, 'y', getPropertyFromGroup('notes', a, 'y') * 1.5);
        end
    end
end

function onUpdate(elapsed)
	if shock0 == true then
			noteTweenX('whar',4,orix0 + getRandomInt(yikes0 * -1,yikes0),0.01,'linear')
			noteTweenAngle('whars',4,orix0 + getRandomInt(yikes0 * -1,yikes0),0.01,'linear')
		if yikes0 == 0 then
			shock0 = false
		else
			yikes0 = yikes0 - 6
		end
	end
	if shock1 == true then
			noteTweenX('whar1',5,orix1 + getRandomInt(yikes1 * -1,yikes1),0.01,'linear')
			noteTweenAngle('whars1',5,orix1 + getRandomInt(yikes1 * -1,yikes1),0.01,'linear')
		if yikes1 == 0 then
			shock1 = false
		else
			yikes1 = yikes1 - 6
		end
	end
	if shock2 == true then
			noteTweenX('whar2',6,orix2 + getRandomInt(yikes2 * -1,yikes2),0.01,'linear')
			noteTweenAngle('whars2',6,orix2 + getRandomInt(yikes2 * -1,yikes2),0.01,'linear')
		if yikes2 == 0 then
			shock2 = false
		else
			yikes2 = yikes2 - 6
		end
	end
	if shock3 == true then
			noteTweenX('whar3',7,orix3 + getRandomInt(yikes3 * -1,yikes3),0.01,'linear')
			noteTweenAngle('whars3',7,orix3 + getRandomInt(yikes3 * -1,yikes3),0.01,'linear')
		if yikes3 == 0 then
			shock3 = false
		else
			yikes3 = yikes3 - 6
		end
	end
end