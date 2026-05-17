extends CanvasLayer

@onready var energy_bar: ProgressBar = $EnergyBar
@onready var energy_timer: Timer = $EnergyTimer
@onready var city_damage_bar: ProgressBar = $CityDamageBar

func _ready() -> void:
	energy_bar.value = Global.energy_value
	city_damage_bar.value = Global.city_health

func _process(_delta: float) -> void:
	energy_bar.value = Global.energy_value
	city_damage_bar.value = Global.city_health
	
	if Global.energy_value == 0 and energy_timer.is_stopped():
		energy_timer.start()


func _on_energy_timer_timeout() -> void:
	Global._reload_energy(10)
	
	if Global.energy_value >= Global.max_energy:
		energy_timer.stop()


func _on_button_pressed() -> void:
	TransitionLayer.change_scene_to_file("uid://cxlcn35yepvuf")
	Global._reset()
	
