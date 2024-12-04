function onEvent(name, value1, value2)
    if name == "sasOMG" then
		setProperty('cameraSpeed', getProperty('cameraSpeed') - value2)
        setProperty('cameraSpeed', getProperty('cameraSpeed') + value1)
    end
end

