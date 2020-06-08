/datum/hud/var/obj/screen/staminas/staminas
/datum/hud/var/obj/screen/staminabuffer/staminabuffer

/obj/screen/staminas
	icon = 'modular_citadel/icons/ui/screen_gen.dmi'
	name = "stamina"
	icon_state = "stamina0"
	screen_loc = ui_stamina
	mouse_opacity = 1

/obj/screen/staminas/Click(location,control,params)
	if(isliving(usr))
		var/mob/living/L = usr
		to_chat(L, "<span class='notice'>You have <b>[L.getStaminaLoss()]</b> stamina loss.<br>Your stamina buffer can take <b>[L.stambuffer]</b> stamina loss, and will use <b>50%</b> of that stamina loss when recharging.<br>Your stamina buffer is <b>[(L.stambuffer*(100/L.stambuffer))-(L.bufferedstam*(100/L.stambuffer))]%</b> full.</span>")

/mob/living/carbon/human/proc/staminahudamount()
	if(stat == DEAD || recoveringstam)
		return "staminacrit"
	else
		switch(hal_screwyhud)
			if(1 to 2)
				return "staminacrit"
			if(5)
				return "stamina0"
			else
				switch(100 - getStaminaLoss())
					if(100 to INFINITY)
						return "stamina0"
					if(80 to 100)
						return "stamina1"
					if(60 to 80)
						return "stamina2"
					if(40 to 60)
						return "stamina3"
					if(20 to 40)
						return "stamina4"
					if(0 to 20)
						return "stamina5"
					else
						return "stamina6"