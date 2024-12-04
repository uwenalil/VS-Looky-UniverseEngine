--Credit to IronDragon2940 for the Lua Recreation
--Credit to Kiwiquest the Owner of Ourple Guy

function onCreatePost()
	setProperty('timeBarBG.visible', false)
	setProperty('scoreTxt.visible', false)
	setProperty('timeTxt.visible', false)
	setProperty('timeBar.scale.x', 1.028)
	setProperty('timeBar.scale.y', 1.8)
	if downscroll == false then
		setProperty('healthBar.y', 600)

		if middlescroll == true then
			makeLuaText('Score', 'Score:', 200, 15, 560)
			setTextAlignment('Score', 'Center')
			addLuaText('Score')
			setTextSize('Score', 44)
			setTextFont('Score','DIGILF__.TTF')

			makeLuaText('ScoreNumbers', '0', 200, 15, 600)
			setTextAlignment('ScoreNumbers', 'Center')
			addLuaText('ScoreNumbers')
			setTextSize('ScoreNumbers', 44)
			setTextFont('ScoreNumbers','DIGILF__.TTF')
		else
			makeLuaText('Score', 'Score:', 1250, 15, 50)
			setTextAlignment('Score', 'Center')
			addLuaText('Score')
			setTextSize('Score', 44)
			setTextFont('Score','DIGILF__.TTF')

			makeLuaText('ScoreNumbers', '0', 1250, 15, 90)
			setTextAlignment('ScoreNumbers', 'Center')
			addLuaText('ScoreNumbers')
			setTextSize('ScoreNumbers', 44)
			setTextFont('ScoreNumbers','DIGILF__.TTF')
		end
	end

	if downscroll == true then
		setProperty('healthBar.y', 100)

		if middlescroll == true then
			makeLuaText('Score', 'Score:', 200, 15, 90)
			setTextAlignment('Score', 'Center')
			addLuaText('Score')
			setTextSize('Score', 44)
			setTextFont('Score','DIGILF__.TTF')

			makeLuaText('ScoreNumbers', '0', 200, 15, 50)
			setTextAlignment('ScoreNumbers', 'Center')
			addLuaText('ScoreNumbers')
			setTextSize('ScoreNumbers', 44)
			setTextFont('ScoreNumbers','DIGILF__.TTF')
		else
			makeLuaText('Score', 'Score:', 1250, 15, 600)
			setTextAlignment('Score', 'Center')
			addLuaText('Score')
			setTextSize('Score', 44)
			setTextFont('Score','DIGILF__.TTF')

			makeLuaText('ScoreNumbers', '0', 1250, 15, 560)
			setTextAlignment('ScoreNumbers', 'Center')
			addLuaText('ScoreNumbers')
			setTextSize('ScoreNumbers', 44)
			setTextFont('ScoreNumbers','DIGILF__.TTF')
		end
	end
end

function onCreate()
	if downscroll == false then
	
	makeLuaSprite('timerBarNew', 'hud/OurpleGuy/timeBars/blank', 426, -16);
	setObjectOrder('timeBar', 7)
	setObjectOrder('timerBarNew', 8)
	setObjectOrder('timeTxt', 9)
	setObjectCamera('timerBarNew', 'hud');

	addLuaSprite('timerBarNew', true);

	makeLuaSprite('pizzaPlayer', 'hud/OurpleGuy/pizza', 875, 525);
	setObjectCamera('pizzaPlayer', 'hud');

	addLuaSprite('pizzaPlayer', false);

	makeLuaSprite('pizzaOpponent', 'hud/OurpleGuy/pizza', 250, 525);
	setObjectCamera('pizzaOpponent', 'hud');

	addLuaSprite('pizzaOpponent', false);

	makeAnimatedLuaSprite('star1', 'hud/OurpleGuy/star', 375, 590);
	addAnimationByPrefix('star1', 'FC', 'star', 24, false);
	addAnimationByPrefix('star1', 'noFC','star0034', 0, false);
	setObjectCamera('star1', 'hud');

	addLuaSprite('star1', true);

	makeAnimatedLuaSprite('star2', 'hud/OurpleGuy/star', 475, 590);
	addAnimationByPrefix('star2', 'FC', 'star', 24, false);
	addAnimationByPrefix('star2', 'noFC','star0034', 0, false);
	setObjectCamera('star2', 'hud');

	addLuaSprite('star2', true);

	makeAnimatedLuaSprite('star3', 'hud/OurpleGuy/star', 575, 590);
	addAnimationByPrefix('star3', 'FC', 'star', 24, false);
	addAnimationByPrefix('star3', 'noFC','star0034', 0, false);
	setObjectCamera('star3', 'hud');

	addLuaSprite('star3', true);

	makeAnimatedLuaSprite('star4', 'hud/OurpleGuy/star', 675, 590);
	addAnimationByPrefix('star4', 'FC', 'star', 24, false);
	addAnimationByPrefix('star4', 'noFC','star0034', 0, false);
	setObjectCamera('star4', 'hud');

	addLuaSprite('star4', true);

	makeAnimatedLuaSprite('star5', 'hud/OurpleGuy/star', 775, 590);
	addAnimationByPrefix('star5', 'FC', 'star', 24, false);
	addAnimationByPrefix('star5', 'noFC','star0034', 0, false);
	setObjectCamera('star5', 'hud');

	addLuaSprite('star5', true);
	end

	if downscroll == true then
	
	makeLuaSprite('timerBarNew', 'hud/OurpleGuy/timeBars/lore-dside', 426, 641);
	setObjectOrder('timeBar', 7)
	setObjectOrder('timerBarNew', 8)
	setObjectOrder('timeTxt', 9)
	setObjectCamera('timerBarNew', 'hud');

	addLuaSprite('timerBarNew', true);

	makeLuaSprite('pizzaPlayer', 'hud/OurpleGuy/pizza', 875, 25);
	setObjectCamera('pizzaPlayer', 'hud');

	addLuaSprite('pizzaPlayer', false);

	makeLuaSprite('pizzaOpponent', 'hud/OurpleGuy/pizza', 250, 25);
	setObjectCamera('pizzaOpponent', 'hud');

	addLuaSprite('pizzaOpponent', false);

	makeAnimatedLuaSprite('star1', 'hud/OurpleGuy/star', 375, 90);
	addAnimationByPrefix('star1', 'FC', 'star', 24, false);
	addAnimationByPrefix('star1', 'noFC','star0034', 0, false);
	setObjectCamera('star1', 'hud');

	addLuaSprite('star1', true);

	makeAnimatedLuaSprite('star2', 'hud/OurpleGuy/star', 475, 90);
	addAnimationByPrefix('star2', 'FC', 'star', 24, false);
	addAnimationByPrefix('star2', 'noFC','star0034', 0, false);
	setObjectCamera('star2', 'hud');

	addLuaSprite('star2', true);

	makeAnimatedLuaSprite('star3', 'hud/OurpleGuy/star', 575, 90);
	addAnimationByPrefix('star3', 'FC', 'star', 24, false);
	addAnimationByPrefix('star3', 'noFC','star0034', 0, false);
	setObjectCamera('star3', 'hud');

	addLuaSprite('star3', true);

	makeAnimatedLuaSprite('star4', 'hud/OurpleGuy/star', 675, 90);
	addAnimationByPrefix('star4', 'FC', 'star', 24, false);
	addAnimationByPrefix('star4', 'noFC','star0034', 0, false);
	setObjectCamera('star4', 'hud');

	addLuaSprite('star4', true);

	makeAnimatedLuaSprite('star5', 'hud/OurpleGuy/star', 775, 90);
	addAnimationByPrefix('star5', 'FC', 'star', 24, false);
	addAnimationByPrefix('star5', 'noFC','star0034', 0, false);
	setObjectCamera('star5', 'hud');

	addLuaSprite('star5', true);
	end
end

function onUpdatePost()
iconsOnPizza()
setTextString('ScoreNumbers', ' '.. getPropertyFromClass(score))
end

function onUpdate()
    if ratingName == 'Perfect!!' or ratingName == '?' then
	setProperty('ratingsData[0].image', 'hud/OurpleGuy/sick100')
    else
	setProperty('ratingsData[0].image', 'hud/OurpleGuy/sick')
    end
	setProperty('ratingsData[1].image', 'hud/OurpleGuy/good')
	setProperty('ratingsData[2].image', 'hud/OurpleGuy/bad')
	setProperty('ratingsData[3].image', 'hud/OurpleGuy/shit')

    if misses < 11 and misses > 0 then
	setProperty('star1.color', getColorFromHex('f7d903'))
    end

    if misses < 21 and misses > 0 then
	setProperty('star2.color', getColorFromHex('f7d903'))
    end

    if misses < 31 and misses > 0 then
	setProperty('star3.color', getColorFromHex('f7d903'))
    end

    if misses < 41 and misses > 0 then
	setProperty('star4.color', getColorFromHex('f7d903'))
    end

    if misses < 51 and misses > 0 then
	setProperty('star5.color', getColorFromHex('f7d903'))
    end

    if misses > 10 then
	setProperty('star5.color', getColorFromHex('FFFFFF'))
    end

    if misses > 20 then
	setProperty('star4.color', getColorFromHex('FFFFFF'))
    end

    if misses > 30 then
	setProperty('star3.color', getColorFromHex('FFFFFF'))
    end

    if misses > 40 then
	setProperty('star2.color', getColorFromHex('FFFFFF'))
    end

    if misses > 50 then
	setProperty('star1.color', getColorFromHex('FFFFFF'))
    end
end

function onBeatHit()
	if curBeat % 2 == 0 and misses == 0 then
	objectPlayAnimation('star1', 'FC', false);
	objectPlayAnimation('star2', 'FC', false);
	objectPlayAnimation('star3', 'FC', false);
	objectPlayAnimation('star4', 'FC', false);
	objectPlayAnimation('star5', 'FC', false);
	end

	if curBeat % 2 == 0 and misses > 0 then
	objectPlayAnimation('star1', 'noFC', false);
	objectPlayAnimation('star2', 'noFC', false);
	objectPlayAnimation('star3', 'noFC', false);
	objectPlayAnimation('star4', 'noFC', false);
	objectPlayAnimation('star5', 'noFC', false);
	end
end



function iconsOnPizza()
        setProperty('iconP2.x', 250)
        setProperty('iconP1.x', 875)

	if downscroll == false then
        	setProperty('iconP2.y', 525)
        	setProperty('iconP1.y', 525)
	end

	if downscroll == true then
        	setProperty('iconP2.y', 25)
        	setProperty('iconP1.y', 25)
	end
end






















































































































































































































































































































































































--How Ourple Are You?