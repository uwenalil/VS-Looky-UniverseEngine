shaders = {'bnw', 'chromaticAbber', 'chromaticPincush', 'flip', 'invert', 'chromaticRadialBlur', 'vcr', 'monitor', 'vcr whit glitch', 'CircleDistort', 'vcr with no glitch'}

function onEvent(n, v1, v2)
    if n == "changeCamShader" then
        if v1 == 'none' then
            runHaxeCode([[
                game.]].. v2 ..[[.setFilters([]);
            ]])
        else
            shaderCoordFix()

            runHaxeCode([[
                var shaderName = "]] .. v1 .. [[";

                game.initLuaShader(shaderName);

                var shader0 = game.createRuntimeShader(shaderName);
                game.]].. v2 ..[[.setFilters([new ShaderFilter(shader0)]);
            ]])
        end
    end
end

function onCreate()
    shaderCoordFix()
    for i=1, #shaders do
        initLuaShader(shaders[i])
    end
end

function shaderCoordFix()
    runHaxeCode([[
        resetCamCache = function(?spr) {
            if (spr == null || spr.filters == null) return;
            spr.__cacheBitmap = null;
            spr.__cacheBitmapData3 = spr.__cacheBitmapData2 = spr.__cacheBitmapData = null;
            spr.__cacheBitmapColorTransform = null;
        }
        
        fixShaderCoordFix = function(?_) {
            resetCamCache(game.camGame.flashSprite);
            resetCamCache(game.camHUD.flashSprite);
            resetCamCache(game.camOther.flashSprite);
        }
    
        FlxG.signals.gameResized.add(fixShaderCoordFix);
        fixShaderCoordFix();
    ]])
    
    local temp = onDestroy
    function onDestroy()
        runHaxeCode([[
            FlxG.signals.gameResized.remove(fixShaderCoordFix);
        ]])
        temp()
    end
end