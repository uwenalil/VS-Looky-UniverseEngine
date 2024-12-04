function onCreate()
    addHaxeLibrary('Application', 'lime.app')
    addHaxeLibrary('Image', 'lime.graphics')
end

function onCreatePost()
    precacheImage("normal")
    makeLuaSprite("fireinthehole", "normal", 1200, 1200)
    if UEcute then
        makeLuaSprite("fireinthehole", "hehehehehhe", 1200, 1200)
    end
    setObjectCamera("fireinthehole", "other")
    addLuaSprite("fireinthehole", true)
    setProperty("fireinthehole.scale.x", 0.25)
    setProperty("fireinthehole.scale.y", 0.25)
    setProperty("fireinthehole.alpha", 0)
    screenCenter("fireinthehole")

    if UEhitsound == 'fire in the hole' then
        setPropertyFromClass("openfl.Lib", "application.window.title", "FIRE IN THE HOLE")
        runHaxeCode("Application.current.window.setIcon(Image.fromFile(Paths.modFolders('images/normal.png')));")
        if UEcute then
            runHaxeCode("Application.current.window.setIcon(Image.fromFile(Paths.modFolders('images/hehehehehhe.png')));")
        end
    end
end

function onDestroy()
    if UEhitsound == 'fire in the hole' then
        setPropertyFromClass("openfl.Lib", "application.window.title", "Friday Night Funkin': Universe Engine")
        runHaxeCode("Application.current.window.setIcon(Image.fromFile('assets/images/windowicon.png'));")
    end
end

function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
    if not isSustainNote then
        if UEhitsound == 'fire in the hole' then
            cancelTween("fireinthehole bye")
            setProperty("fireinthehole.alpha", getPropertyFromClass("ClientPrefs", "hitsoundVolume"))
            doTweenAlpha("fireinthehole bye", "fireinthehole", 0, 1, "linear")
        end
    end
end
