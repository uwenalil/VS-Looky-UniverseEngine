function onCreate()
	makeLuaSprite('skyBG', 'limo/limoSunset', -920, -350)
	setScrollFactor('skyBG', 0.1, 0.1)
	scaleObject('skyBG', 1.6, 1.6);
	setProperty('skyBG.velocity.x', 3);
	
	if not lowQuality then -- sprites that only load if lowQuality's off
		makeLuaSprite('limoMetalPole', 'gore/metalPole', -500, 220)
		setScrollFactor('limoMetalPole', 0.4, 0.4);
		
		makeAnimatedLuaSprite('limoRoad', 'backgrounds/limo/limoRoad', -950, 200);
        luaSpriteAddAnimationByPrefix('limoRoad', 'limoRoad', 'COOLROAD', '24')
		setScrollFactor('limoRoad', 0.4, 0.4)
		
		makeAnimatedLuaSprite('bgLimo', 'limo/bgLimo', -150, 480)
		addAnimationByPrefix('bgLimo', 'drive', 'background limo pink', 24, true)
		setScrollFactor('bgLimo', 0.4, 0.4)
		
		makeAnimatedLuaSprite('limoCorpse', 'gore/noooooo', -500, getProperty('limoMetalPole.y') - 130)
		makeAnimatedLuaSprite('limoCorpseTwo', 'gore/noooooo', -500, getProperty('limoMetalPole.y') - 130)
		addAnimationByPrefix('limoCorpse', 'die', 'Henchman on rail', 24, true)
		addAnimationByPrefix('limoCorpseTwo', 'die', 'henchmen death', 24, true)
		setScrollFactor('limoCorpse', 0.4, 0.4)
		
		for i = 0, 5 do
			makeAnimatedLuaSprite('dancers-'..i, 'limo/limoDancer', 370 * i + 130, getProperty('bgLimo.y') - 400)
			setScrollFactor('dancers-'..i, 0.4, 0.4)
			addAnimationByIndices('dancers-'..i, 'danceLeft', 'bg dancer sketch PINK', '0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14', 24)
			addAnimationByIndices('dancers-'..i, 'danceRight', 'bg dancer sketch PINK', '15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29', 24)
			objectPlayAnimation('dancers-'..i, 'danceLeft', true)
			setProperty('dancers-'..i..'.x', (370 * i) + getProperty('bgLimo.x') + 280)
		end
		
		makeLuaSprite('limoLight', 'gore/coldHeartKiller', getProperty('limoMetalPole.x') - 180, getProperty('limoMetalPole.y') - 80)
		setScrollFactor('limoLight', 0.4, 0.4)
		
		makeAnimatedLuaSprite('particle0', 'gore/stupidBlood', -400, -400)
		addAnimationByPrefix('particle0', 'b', 'blood', 24, false)
		setProperty('particle0.alpha', 0.01)
		resetLimoKill()
		
		precacheSound('dancerdeath')
	end
	
	makeAnimatedLuaSprite('limo', 'limo/limoDrive', -120, 550)
	addAnimationByPrefix('limo', 'drive', 'Limo stage', 24, true)
	
	makeLuaSprite('fastCar', 'backgrounds/limo/fastCarlol', -300, 160)
	setProperty('fastCar.active', true)
	limoKillingState = 0
	
	addLuaSprite('skyBG', false)
	addLuaSprite('limoMetalPole', false)
	addLuaSprite('limoRoad', false)
	addLuaSprite('bgLimo', false)
	addLuaSprite('limoCorpse', false)
	addLuaSprite('limoCorpseTwo', false)
	for i = 0, 5 do
		addLuaSprite('dancers-'..i, false)
	end
	addLuaSprite('dancers-0', false)
	addLuaSprite('limoLight', false)
	addLuaSprite('limo', false)
	addLuaSprite('fastCar', true)
	addLuaSprite('particle0', false)
	
	setObjectOrder('limo', getObjectOrder('gfGroup'))
	resetFastCar()
end

local limoKillingState = 0
function onEvent(n, v1, v2)
	if n == 'Kill Henchmen' then
		killHenchmen()
	end
end

local limoSpeed = 0
function onUpdate(elapsed)
	if limoKillingState == 1 then
		setProperty('limoMetalPole.x', getProperty('limoMetalPole.x') + 5000 * elapsed)
		setProperty('limoLight.x', getProperty('limoMetalPole.x') - 180)
		setProperty('limoCorpse.x', getProperty('limoLight.x') - 50)
		setProperty('limoCorpseTwo.x', getProperty('limoLight.x') + 35)
		for i = 0, 5 do
			if getProperty('dancers-'..i..'.x') < screenWidth * 1.5 and getProperty('limoLight.x') > (370 * i) + 130 then
				diffStr = i == 3 and ' 2 ' or ' ' -- thx soup
				if i == 0 or i == 1 or i == 2 or i == 3 then
					if i == 0 then playSound('dancerdeath', 0.5) end
					
					-- Create Particles
					makeAnimatedLuaSprite('particle-0'..i, 'gore/noooooo', getProperty('dancers-'..i..'.x') + 200, getProperty('dancers-'..i..'.y'))
					makeAnimatedLuaSprite('particle-1'..i, 'gore/noooooo', getProperty('dancers-'..i..'.x') + 160, getProperty('dancers-'..i..'.y') + 200)
					makeAnimatedLuaSprite('particle-2'..i, 'gore/noooooo', getProperty('dancers-'..i..'.x'), getProperty('dancers-'..i..'.y') + 50)
					makeAnimatedLuaSprite('particle-3'..i, 'gore/stupidBlood', getProperty('dancers-'..i..'.x') - 110 + 20, getProperty('dancers-'..i..'.y') + 20)
					
					-- Add Anims
					addAnimationByPrefix('particle-0'..i, 'spin', 'hench leg spin'..diffStr..'PINK', 24, false)
					addAnimationByPrefix('particle-1'..i, 'spin', 'hench arm spin'..diffStr..'PINK', 24, false)
					addAnimationByPrefix('particle-2'..i, 'spin', 'hench head spin'..diffStr..'PINK', 24, false)
					addAnimationByPrefix('particle-3'..i, 'bl', 'blood', 24, false)
					
					-- Set Properties
					setProperty('particle-3'..i..'.flipX', true)
					setProperty('particle-3'..i..'.angle', -57.5)
					
					-- Parallax
					setScrollFactor('particle-0'..i, 0.4, 0.4)
					setScrollFactor('particle-1'..i, 0.4, 0.4)
					setScrollFactor('particle-2'..i, 0.4, 0.4)
					setScrollFactor('particle-3'..i, 0.4, 0.4)
					
					-- Add
					addLuaSprite('particle-0'..i, false)
					addLuaSprite('particle-1'..i, false)
					addLuaSprite('particle-2'..i, false)
					addLuaSprite('particle-3'..i, false)
				end
				if i == 1 then
					setProperty('limoCorpse.visible', true)
				end
				if i == 2 then
					setProperty('limoCorpseTwo.visible', true)
				end
				setProperty('dancers-'..i..'.x', getProperty('dancers-'..i..'.x') + screenWidth * 2)
			end
		end
		if getProperty('limoMetalPole.x') > screenWidth * 2 then
			resetLimoKill()
			limoSpeed = 800
			limoKillingState = 2
		end		
	end
	if limoKillingState == 2 then
		limoSpeed = limoSpeed - 4000 * elapsed;
		setProperty('bgLimo.x', getProperty('bgLimo.x') - limoSpeed * elapsed)
		if getProperty('bgLimo.x') > screenWidth * 1.5 then
			limoSpeed = 3000
			limoKillingState = 3
			runTimer('resetState', 5.2, 1)
		end
	end
	if limoKillingState == 3 then
		limoSpeed = limoSpeed - 2000 * elapsed
		if limoSpeed < 1000 then limoSpeed = 1000 setProperty('bgLimo.x', getProperty('bgLimo.x') - limoSpeed * elapsed) end
		if getProperty('bgLimo.x') < -275 then
			limoKillingState = 4
			limoSpeed = 800
		end
	end
	if limoKillingState == 4 then
		setProperty('bgLimo.x', lerp(getProperty('bgLimo.x'), -150, boundTo(elapsed * 9, 0, 1)))
		if getProperty('bgLimo.x') == -150 then -- resetState exists cause this Is unknowingly broken, I can remove it to fix it but also it'll remove that smooth pushback
			setProperty('bgLimo.x', -150)
			limoKillingState = 0
		end
	end
	if limoKillingState > 2 then
		for i = 0, 5 do
			setProperty('dancers-'..i..'.x', (370 * i) + getProperty('bgLimo.x') + 280)
		end
	end
	if not lowQuality then
		for i = 0, 3 do
			if getProperty('particle-0'..i..'.animation.curAnim.finished') then
				removeLuaSprite('particle-0'..i, true)
			end
			if getProperty('particle-1'..i..'.animation.curAnim.finished') then
				removeLuaSprite('particle-1'..i, true)
			end
			if getProperty('particle-2'..i..'.animation.curAnim.finished') then
				removeLuaSprite('particle-2'..i, true)
			end
			if getProperty('particle-3'..i..'.animation.curAnim.finished') then
				removeLuaSprite('particle-3'..i, true)
			end
		end
	end
end

local fastCarCanDrive = true
local danceDir = true
function onBeatHit()
	if getRandomBool(10) and fastCarCanDrive then
		fastCarDrive()
	end
	
	if not lowQuality then
		if danceDir then
			danceDir = false
			for i = 0, 5 do
				objectPlayAnimation('dancers-'..i, 'danceRight', true)
			end
		else
			danceDir = true
			for i = 0, 5 do
				objectPlayAnimation('dancers-'..i, 'danceLeft', true)
			end
		end
	end
end

function resetLimoKill()
	setProperty('limoMetalPole.x', -500)
	setProperty('limoMetalPole.visible', false)
	setProperty('limoLight.x', -500)
	setProperty('limoLight.visible', false)
	setProperty('limoCorpse.x', -500)
	setProperty('limoCorpseTwo.x', -500)
	setProperty('limoCorpse.visible', false)
	setProperty('limoCorpseTwo.visible', false)
end

function resetFastCar()
	setProperty('fastCar.x', -12600)
	setProperty('fastCar.y', getRandomInt(240, 350))
	setProperty('fastCar.velocity.x', 0)
	fastCarCanDrive = true;
end

function fastCarDrive() -- vroom
	sound = string.format('carPass%i', getRandomInt(0, 1))
	playSound(sound, 0.7)
	setProperty('fastCar.velocity.x', getRandomInt(170, 22) / getPropertyFromClass('flixel.FlxG', 'elapsed') * 3)
	fastCarCanDrive = false
	runTimer('carTimer', 2, 1)
end

function killHenchmen()
	if not lowQuality then
		if limoKillingState < 1 then
			setProperty('limoMetalPole.x', -400)
			setProperty('limoMetalPole.visible', true)
			setProperty('limoLight.visible', true)
			limoKillingState = 1
		end
	end
end

function onTimerCompleted(t, l, ll)
	if t == 'carTimer' then
		resetFastCar()
	elseif t == 'resetState' then
		limoKillingState = 0
	end
end

function lerp(a, b, ratio)
  return math.floor(a + ratio * (b - a))
end

function boundTo(value, min, max)
	return math.max(min, math.min(max, value))
end