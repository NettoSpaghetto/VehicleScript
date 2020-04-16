hook.Add("PlayerButtonDown", "SeatbeltsOnEverybody", function(ply,key)

    if ply:InVehicle() and key == KEY_J then
        sound.Play( "sound/seatbelt/bucklein.wav", Vector(0,0,0), 75, 150, 0.5 )
        ply:SetNWBool("Seatbelt", !ply:GetNWBool("Seatbelt", false))
    end

end)

hook.Add("CanExitVehicle", "CheckExitVehicle", function(veh, ply)

    if ply:GetNWBool("Seatbelt") == false then
        return true
    elseif ply:GetNWBool("Seatbelt") == true then
        return false
    end

end)