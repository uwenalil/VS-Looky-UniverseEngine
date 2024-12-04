function onCreate()
    precacheImage('camHUD/vhs')
	
	makeLuaSprite('BANANA','BANANA',-700,-160)
    addLuaSprite('BANANA',false)

    makeLuaSprite('middlething', 'camHUD/middlething',1060,511)
    setObjectCamera('middlething', 'camOther')

makeAnimatedLuaSprite('braingame', 'braingame', 830, -110);
addAnimationByPrefix('braingame', 'lights', 'braingame',2,true)
addLuaSprite('braingame',false)
objectPlayAnimation('braingame','lights',false)
scaleObject('braingame', 1.9, 1.9);


    addLuaSprite('bg')
    addLuaSprite('middlething', true)
    addLuaSprite('braingame', true)
end