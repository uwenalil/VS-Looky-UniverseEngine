local shaderName = ""
function onEvent(name, value1, value2)
    if name == '' then
        if value1 == '1' then
		w([[
        w = "]] .. w .. [[";
        ;
        ]])
    end
end
local shaderName = "rgbeffect3"
 function onEvent(name, value1, value2)
   if name == 'glitch' then 
   if value1 == '1' then

    makeLuaSprite("rgbeffect3")
    makeGraphic("uwu", screenWidth, screenHeight)

   setSpriteShader("uwu", "rgbeffect3")


    runHaxeCode([[
        var shaderName = "]] .. uwu.. [[";
        
        game.initLuaShader(uwu);
        
        var shader0 = game.createRuntimeShader(shaderName);
        game.camGame.setFilters([new ShaderFilter(shader0)]);
        game.getLuaObject("rgbeffect3").shader = shader0; // setting it into temporary sprite so luas can set its shader uniforms/properties
        game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("rgbeffect3").shader)]);
        return;
    ]])
end

function onUpdate(elapsed)
    setShaderFloat("rgbeffect3", "iTime", os.clock())
 end

function shaderCoordFix()
    runHaxeCode([[
        resetCamCache = function(?spr) {
            if (spr == null || spr.filters == null) return;
            spr.__cacheBitmap = null;
            spr.__cacheBitmapData = null;
        }
        
        fixShaderCoordFix = function(?_) {
            resetCamCache(game.camGame.flashSprite);
            resetCamCache(game.camHUD.flashSprite);
            resetCamCache(game.camOther.flashSprite);
        }
    
        FlxG.signals.gameResized.add(fixShaderCoordFix);
        fixShaderCoordFix();
        return;
    ]])
end
               end
		if value1 == '0' then
		runHaxeCode([[
        game.camGame.setFilters(null);
		game.camHUD.setFilters(null);
        ]])
		end
    end
end