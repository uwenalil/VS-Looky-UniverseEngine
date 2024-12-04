-- Made by HafimieForever/Hafimie, please credit me if you want to use these codes in another project, I would really appreciate it ;)

local clock = os.clock
function sleep(n)
local t0 = clock()
while clock() - t0 <= n do end
end

function onEvent(name, value1, value2)
	if name == "321GO Event" then
		playSound('intro3')
		sleep(0.40)
		playSound('intro2')
		makeLuaSprite('ready', 'ready', 250, 160);
		addLuaSprite('ready', true);
		setObjectCamera('ready', 'other');
		doTweenAlpha('readyBye', 'ready', 0, 0.40, 'linear')
	end
end

function onTweenCompleted(tag)
    if tag == 'readyBye' then
		playSound('intro1')
		makeLuaSprite('set', 'set', 250, 160);
		addLuaSprite('set', true);
		setObjectCamera('set', 'other');
		doTweenAlpha('setBye', 'set', 0, 0.40, 'linear')
	elseif tag == 'setBye' then
		playSound('introGo')
		makeLuaSprite('go', 'go', 330, 100);
		addLuaSprite('go', true);
		setObjectCamera('go', 'other');
		doTweenAlpha('goBye', 'go', 0, 0.40, 'linear')
	else
		print('No completed tween.')
    end
end