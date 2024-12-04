--[[Recreation by Gostar64 [Probably doesn't work on android]
	Works on Psych Engine 0.6.3 [should work with earlier versions and some forks] and also my dumb thing OS Engine+ 
	Don't remove this credit thing or I'll be sad Ex: [:(]

	Also this is based off of Super_Hugo's Philly Glow Recreation
]]

--image folder

folder = "stagespotlight/"

-- smoke pos
smokeX = -1550
smokeY = 660

--smoke offset
offsetX = 200

-- Spotlight offset
lightOffsetXDad = 0;
lightOffsetYDad = 100;

lightOffsetXBF = 0;
lightOffsetYBF = -50;

lightOffsetXGF = 0;
lightOffsetYGF = 10;

local color = ''; --set this for stages

-- Variables that you dont touch

local who = 'gf';
local val = 0;


--dont touch (grabs defaultCamZoom)
local defaultedCameraZoom = 0.0;

function onCreate()

	--offsets, set it here
	local curStage = getPropertyFromClass('PlayState', 'curStage')
	
	if curStage == 'customstagehere' then
		--cool example
		lightOffsetXBF = 240
		color = 'FFFF00'
	end

	--yeah, using SuperHugo's Philly Glow Recreation as a base
	makeLuaSprite('phillyGlowBlack', '', screenWidth * -0.5, screenHeight * -0.5)
	makeGraphic('phillyGlowBlack', screenWidth * 2, screenHeight * 2, '000000')
	setProperty('phillyGlowBlack.visible', false)
	setProperty('phillyGlowBlack.alpha', 0.25)
	addLuaSprite('phillyGlowBlack', true)


	if color ~= nil and color ~= '' then
		color = '0xFF'..color;
	else
		color = '0xFFFFFFFF';
	end
	
	makeLuaSprite('dadbattleLightEvent', folder.."spotlight", spotlightX, spotlightY)
	setProperty('dadbattleLightEvent.alpha', 0.375)
	setBlendMode('dadbattleLightEvent', 'add')
	setProperty('dadbattleLightEvent.visible', false)
	setProperty('dadbattleLightEvent.color', getColorFromHex(color))
	addLuaSprite('dadbattleLightEvent', true)
	updateHitbox('dadbattleLightEvent')

	makeLuaSprite('smoke1', folder..'smoke',  smokeX + offsetX, smokeY + getRandomFloat(-20, 20))
	setGraphicSize('smoke1', getProperty('smoke1.width')*getRandomFloat(1.1, 1.22), getProperty('smoke1.height')*1, false)
	updateHitbox('smoke1')
	setProperty('smoke1.alpha', 0.7)
	setBlendMode('smoke1', 'add')
	addLuaSprite('smoke1', true)

	setProperty('smoke1.visible', false)

	makeLuaSprite('smoke2', folder..'smoke', -smokeX + offsetX, smokeY + getRandomFloat(-20, 20))
	setGraphicSize('smoke2', getProperty('smoke2.width')*getRandomFloat(1.1, 1.22), getProperty('smoke2.height')*1, false)
	updateHitbox('smoke2')
	setProperty('smoke2.alpha', 0.7)
	setProperty('smoke2.flipX', true)
	setBlendMode('smoke2', 'add')
	addLuaSprite('smoke2', true)

	setProperty('smoke2.visible', false)
	
	
	
	
	defaultedCameraZoom = getProperty('defaultCamZoom') --this is important kind of

end

function onEvent(n, v1, value2)
	if n == 'Dadbattle Spotlight Recreation' then

		local lightOffsetX = 0;
		local lightOffsetY = 0;
	

		val = tonumber(v1);

		if val == 0 then --disable
			setProperty('phillyGlowBlack.visible', false)
			setProperty('dadbattleLightEvent.visible', false)
			setProperty('defaultCamZoom', defaultedCameraZoom)

			doTweenAlpha('smokeLeaves', 'smoke1', 0, 1, 'linear')
			doTweenAlpha('smokeAlsoLeaves', 'smoke2', 0, 1, 'linear')

			setProperty('smoke1.velocity.x', 0)

			setProperty('smoke2.velocity.x', 0)

			setPositionThing('smoke1', smokeX + offsetX, smokeY)
			setPositionThing('smoke2', -smokeX + offsetX, smokeY)
		end

		if val == 1 then --enable time real
			setProperty('phillyGlowBlack.visible', true)
			setProperty('dadbattleLightEvent.visible', true)

			setProperty('smoke1.velocity.x', getRandomFloat(15, 22))

			setProperty('smoke2.velocity.x', getRandomFloat(-15, -22))

			for i = 1, 2 do 
				setProperty('smoke'..i..'.visible', true)
			end

			setProperty('defaultCamZoom', defaultedCameraZoom + 0.12)
		end

		if val == 2 then
			who = 'dad'

			lightOffsetX = lightOffsetXDad;
			lightOffsetY = lightOffsetYDad;
		elseif val == 3 then
			who = 'boyfriend'

			lightOffsetX = lightOffsetXBF;
			lightOffsetY = lightOffsetYBF;
		elseif val == 4 then
			who = 'gf'	--now that's something that wasn't in the original

			lightOffsetX = lightOffsetXGF;
			lightOffsetY = lightOffsetYGF;
		end

		if val > 0 then
			setProperty('dadbattleLightEvent.alpha', 0)
			if val > 1 then
				runTimer('deezusNuttus', 0.12)
			end
			setPositionThing('dadbattleLightEvent', (getMidpointX(who) - getProperty('dadbattleLightEvent.width') / 2) + lightOffsetX, (getProperty(who..'.y') + getProperty(who..'.height') - getProperty('dadbattleLightEvent.height')) + lightOffsetY)
		end
	end
end

function setPositionThing(tag, x, y)
	setProperty(tag..'.x', x)
	setProperty(tag..'.y', y)
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'deezusNuttus' then
		setProperty('dadbattleLightEvent.alpha', 0.375)
	end

end

function onTweenCompleted(tag)
	if tag == 'smokeLeaves' then
		setProperty('smoke1.visible', false)
		setProperty('smoke1.alpha', 0.7)
	elseif tag == 'smokeAlsoLeaves' then
		setProperty('smoke2.visible', false)
		setProperty('smoke2.alpha', 0.7)
	end
end