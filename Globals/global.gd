extends Node

var energy_value: float = 100.0 
var max_energy: float = 100.0

var city_health: float = 100.0

#This function reduce energy shown in energy bar when turret shoot.
func _depleted_energy(value):
	if energy_value > 0:
		energy_value -= value
		
		if energy_value < 0:
			energy_value = 0
	
	print(energy_value)

#This function reloads the energy after the energy bar is 0 & reload it.
func _reload_energy(value):
	if energy_value < max_energy:
		energy_value += value
		
		if energy_value > max_energy:
			energy_value = max_energy
	
	print(energy_value)

#This function works when the city is damage by missile.
func _city_damage(value):
	var damage = city_health - value
	city_health = damage
