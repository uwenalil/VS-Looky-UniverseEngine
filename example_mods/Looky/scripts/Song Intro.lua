-- the font section
local font1 = "Shovelware's Brain Game.ttf"
local font2 = "Pizza Tower.ttf"
local font3 = "Phantomuff Difficult Font.ttf"
TextFont = false -- Turn this on if you want to have the font basically
borderImage = 'Lines' -- Options: Rectangle or Lines
borderotate = 'Sideways' -- Options: Sideways or blank
Color = 'B400FF' -- this is for changing the color of the border

-- The Text section

TextSize = 55

-- Start of the script

function onCreate()
precacheImage(borderImage)

makeLuaSprite('Song Intro', 'empty', 0, 0)
makeGraphic('Song Intro', 300, 100, '000000')
setObjectCamera('Song Intro', 'other')
scaleObject('Song Intro', 4.3, 7.25)
setProperty('Song Intro.alpha', 0)
addLuaSprite('Song Intro')

makeLuaText("Song Name", songName, screenWidth, 0, 215)
setTextSize("Song Name", TextSize)
setObjectCamera('Song Name', "other")
setProperty('Song Name.alpha', 0)
addLuaText("Song Name")

makeLuaText("Difficulty Name", "Difficulty: " ..difficultyName, screenWidth, 0, 290)
setTextSize("Difficulty Name", TextSize)
setObjectCamera('Difficulty Name', "other")
setProperty('Difficulty Name.alpha', 0)
addLuaText("Difficulty Name")

makeLuaText("Song BPM", "BPM: " ..curBpm * playbackRate.. ' ['..playbackRate..'X] ', screenWidth, 0, 365)
setTextSize("Song BPM", TextSize)
setObjectCamera('Song BPM', "other")
setProperty('Song BPM.alpha', 0)
addLuaText("Song BPM")

makeLuaText("Week Name", "Week: "..week, screenWidth, 0, 440)
setTextSize("Week Name", TextSize)
setObjectCamera('Week Name', "other")
setProperty('Week Name.alpha', 0)
addLuaText("Week Name")

-- Borders
if borderImage == 'Rectangle' then
makeLuaSprite('Border 1',  borderImage, 0, 0)
setObjectCamera('Border 1', 'other')
scaleObject('Border 1', 1.7, 0.5)
setProperty('Border 1.alpha', 0)
setProperty('Border 1.color', getColorFromHex(Color)) -- you change the color at line 8
addLuaSprite('Border 1')

makeLuaSprite('Border 2', borderImage, 0, 530)
setObjectCamera('Border 2', "other")
scaleObject('Border 2', 1.7, 0.5)
setProperty('Border 2.alpha', 0)
setProperty('Border 2.color', getColorFromHex(Color))
addLuaSprite('Border 2')

elseif borderImage == 'Lines' then
makeLuaSprite('Border 1',  borderImage, 0, 0)
setObjectCamera('Border 1', 'other')
scaleObject('Border 1', 0.5, 0.5)
setProperty('Border 1.alpha', 0)
setProperty('Border 1.color', getColorFromHex(Color))
addLuaSprite('Border 1')

makeLuaSprite('Border 2',  borderImage, 1005, 0)
setObjectCamera('Border 2', 'other')
scaleObject('Border 2', 0.5, 0.5)
setProperty('Border 2.flipX', true)
setProperty('Border 2.alpha', 0)
setProperty('Border 2.color', getColorFromHex(Color))
addLuaSprite('Border 2')

makeLuaSprite('Border 3',  borderImage, 0, 470)
setObjectCamera('Border 3', 'other')
scaleObject('Border 3', 0.5, 0.5)
setProperty('Border 3.flipX', true)
setProperty('Border 3.alpha', 0)
setProperty('Border 3.color', getColorFromHex(Color))
addLuaSprite('Border 3')

makeLuaSprite('Border 4',  borderImage, 1005, 470)
setObjectCamera('Border 4', 'other')
scaleObject('Border 4', 0.5, 0.5)
setProperty('Border 4.flipX', true)
setProperty('Border 4.flipY', true)
setProperty('Border 4.alpha', 0)
setProperty('Border 4.color', getColorFromHex(Color))
addLuaSprite('Border 4')
end

if borderotate == 'Sideways' and borderImage == 'Rectangle' then
setProperty('Border 1.angle', 90)
setProperty('Border 1.x', -700)
setProperty('Border 1.y', 0)
scaleObject('Border 1', 2, 1.3)

setProperty('Border 2.angle', 90)
setProperty('Border 2.x', 380)
setProperty('Border 2.y', 0)
scaleObject('Border 2', 2, 1.3)
end

--Alpha Tweens
doTweenAlpha("Song Intro Fade In", "Song Intro", 0.6, 0.8/playbackRate, "linear")
doTweenAlpha("Song Name Fade In", "Song Name", 1, 0.8/playbackRate, "linear")
doTweenAlpha("Difficulty Name Fade In", "Difficulty Name", 1, 0.8/playbackRate, "linear")
doTweenAlpha("Song BPM Fade In", "Song BPM", 1, 0.8/playbackRate, "linear")
doTweenAlpha("Week Name Fade In", "Week Name", 1, 0.8/playbackRate, "linear")
-- Corners
doTweenAlpha("Border 1 Fade In", "Border 1", 0.6, 0.8/playbackRate, "linear")
doTweenAlpha("Border 2 Fade In", "Border 2", 0.6, 0.8/playbackRate, "linear")
doTweenAlpha("Border 3 Fade In", "Border 3", 0.6, 0.8/playbackRate, "linear")
doTweenAlpha("Border 4 Fade In", "Border 4", 0.6, 0.8/playbackRate, "linear")
runTimer('Bye Bye Stuff', 2/playbackRate)
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'Bye Bye Stuff' then
    doTweenAlpha("Song Intro Fade Out", "Song Intro", 0, 0.8/playbackRate, "linear")
    doTweenAlpha("Song Name Fade Out", "Song Name", 0, 0.8/playbackRate, "linear")
    doTweenAlpha("Difficulty Name Fade Out", "Difficulty Name", 0, 0.8/playbackRate, "linear")
    doTweenAlpha("Song BPM Fade Out", "Song BPM", 0, 0.8/playbackRate, "linear")
    doTweenAlpha("Week Name Fade Out", "Week Name", 0, 0.8/playbackRate, "linear")
    -- Corners
    doTweenAlpha("Border 1 Fade Out", "Border 1", 0, 0.8/playbackRate, "linear")
    doTweenAlpha("Border 2 Fade Out", "Border 2", 0, 0.8/playbackRate, "linear")
    doTweenAlpha("Border 3 Fade Out", "Border 3", 0, 0.8/playbackRate, "linear")
    doTweenAlpha("Border 4 Fade Out", "Border 4", 0, 0.8/playbackRate, "linear")
  end
end

-- End of the script