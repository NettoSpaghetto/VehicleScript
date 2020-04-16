hook.Add("CanExitVehicle", "AreSeatbeltsOn", function(veh, ply)
    print("canexit run")
    print(ply:GetNWBool("Seatbelt"))
    if ply:GetNWBool("Seatbelt") == true then
        DarkRP.notify(ply, 1, 6, "Take your seatbelt off first!")
        return false
    else
        return true
    end

end)