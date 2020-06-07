local menuEnabled = false

function fsn_SplitString(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end


function ToggleActionMenu()
	menuEnabled = not menuEnabled
	if ( menuEnabled ) then
		if not IsPedInAnyVehicle(GetPlayerPed(-1)) then -- not on a horse fool
			if not IsPedGettingIntoAVehicle(GetPlayerPed(-1)) then
				--FreezeEntityPosition(GetPlayerPed(-1), 0)
				--SetEntityCollision(GetPlayerPed(-1), 1, 1)
				--ClearPedTasks(GetPlayerPed(-1))
			end
		end

		SetNuiFocus( true, true )
		SendNUIMessage({
			showmenu = true,
			police = police,
		})
	else
		SetNuiFocus( false )
		SendNUIMessage({
			hidemenu = true
		})
	end
end

RegisterNUICallback( "ButtonClick", function( data, cb )
local split = fsn_SplitString(data, "-")
  if ( data == "duck" ) then
	print("you clicked duck")
	ToggleActionMenu()
  elseif ( data == "duck1" ) then
	--do something
	print("you clicked duck1")
	ToggleActionMenu()
  elseif split[1] == 'duck2' then
	--do something
	print("you clicked duck2")
	ToggleActionMenu()
  elseif split[1] == 'duck3' then
	--do something
	print("you clicked duck3")
	ToggleActionMenu()
  elseif split[1] == 'duck4' then
    --do something
	print("you clicked duck4")
	ToggleActionMenu()
  elseif split[1] == 'duck5' then
    --do something
	print("you clicked duck5")
	ToggleActionMenu()
  elseif split[1] == 'duck6' then
    --do something
	print("you clicked duc6")
	ToggleActionMenu()
	end

end )

Citizen.CreateThread( function()
  SetNuiFocus( false )
  while true do
		  if IsControlJustPressed( 0,  0x5415BE48 ) then
			  ToggleActionMenu()
      end
	    if ( menuEnabled ) then
            local ped = GetPlayerPed( -1 )
            DisablePlayerFiring( ped, true )
        end
		Citizen.Wait( 0 )
	end
end )

RegisterNUICallback('escape', function(data, cb) -- NUI to close menu on ESCAPE key pressed.
  ToggleActionMenu()
end)
