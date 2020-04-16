hook.Add("PlayerButtonDown", "SeatbeltsOnEverybody", function(ply,key)

    if ply:InVehicle() and key == KEY_J then
        if ply:GetNWBool("Seatbelt") == false then
            sound.Play( "vehiclesounds/bucklein.wav", ply:GetPos(), 75, 150, 0.5 )
        elseif ply:GetNWBool("Seatbelt") == true then
            sound.Play( "vehiclesounds/buckleout.wav", ply:GetPos(), 75, 160, 0.5)
        end
        ply:SetNWBool("Seatbelt", !ply:GetNWBool("Seatbelt", false))
    end

    if ply:InVehicle() and key == KEY_H then
        if ply:GetNWBool("EngineStatus") == false then
            sound.Play( "vehiclesounds/enginestart.wav", ply:GetPos(), 75, 90, 1 )
        elseif ply:GetNWBool("EngineStatus") == true then
            sound.Play( "vehiclesounds/engineoff.wav", ply:GetPos(), 75, 100, 1)
        end
        ply:SetNWBool("EngineStatus", !ply:GetNWBool("EngineStatus", false))
    end

end)

hook.Add("CanExitVehicle", "CheckExitVehicle", function(veh, ply)

    if !ply:IsValid() then return end
    if ply:GetNWBool("Seatbelt") == false then
        ply:SetNWBool("EngineStatus", false)
        return true
    elseif ply:GetNWBool("Seatbelt") == true then
        return false
    end

end)

hook.Add("VehicleMove", "EngineOnOff", function(ply, veh)

    if !ply:IsValid() then return end
    if ply:GetNWBool("EngineStatus", false) == true then
        veh:StartEngine(true)
    elseif ply:GetNWBool("EngineStatus", false) == false then
        veh:StartEngine(false)
    end

end)