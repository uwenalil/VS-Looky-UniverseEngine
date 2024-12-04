function onStepHit()
       if curStep % 16 == 0 then
        triggerEvent('Add Camera Zoom', 0.1, 0.03)
       end
end