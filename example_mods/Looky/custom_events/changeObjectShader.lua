shaders = {'bnw', 'chromaticAbber', 'chromaticPincush', 'flip', 'invert', 'chromaticRadialBlur'}

function onEvent(n, v1, v2)
    if n == "changeObjectShader" then
        if v1 == 'none' then
            removeSpriteShader(v2)
        else
            setSpriteShader(v2, v1)
        end
    end
end

function onCreate()
    for i=1, #shaders do
        initLuaShader(shaders[i])
    end
end