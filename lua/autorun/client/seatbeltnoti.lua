local seatbelt = Material("seatbelt/buckleseatbelts.png", "noclamp smooth")
if seatbelt then print("material exists") end
local y = ScrH()

local function DrawSeatbelt()
    hook.Add("HUDPaint", "SeatbeltNoti", function()
        surface.SetMaterial(seatbelt)
        surface.DrawTexturedRect(0, y/1.9, 50, 50)
    end)
end

local function RemoveSeatbelt()
    hook.Remove("HUDPaint", "SeatbeltNoti")
end

hook.Add("VehicleMove", "SeatbeltsOnPlease", function(ply)
    if ply:IsValid() then
        if ply:GetNWBool("Seatbelt", false) == false then
            DrawSeatbelt()
        elseif ply:GetNWBool("Seatbelt", true) == true then
            RemoveSeatbelt()
        end
    end
end)