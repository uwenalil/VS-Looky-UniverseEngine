function onCreatePost()
    defCamZoom = getProperty("defaultCamZoom")
end

function onEvent(name, v1, v2)
    if name == "camBumpRot" then
        cancelTween("camZoomG")
        cancelTween("camZoomH")
        cancelTween("camRot")
        setProperty("camGame.zoom", (getProperty("camGame.zoom") + v1))
        setProperty("camHUD.zoom", (getProperty("camHUD.zoom") + (v1 / 2)))
        --setProperty("camGame.angle", v2)
        doTweenZoom("camZoomG", "camGame", defCamZoom, 0.75, "cubeOut")
        --doTweenAngle("camRot", "camGame", 0, 0.75, "cubeOut")
        doTweenZoom("camZoomH", "camHUD", 1, 0.75, "cubeOut")
    end
end