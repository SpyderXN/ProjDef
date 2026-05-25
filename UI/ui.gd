extends CanvasLayer

@onready var energy_bar: TextureProgressBar = $EnergyBar
@onready var energy_timer: Timer = $EnergyTimer
@onready var city_damage_bar: TextureProgressBar = $CityDamageBar
@onready var ui_hide_timer: Timer = $UiHideTimer
@onready var game_over: PanelContainer = $GameOver


func _ready() -> void:
	energy_bar.value = Global.energy_value
	city_damage_bar.value = Global.city_health
	game_over.visible = false

func _process(_delta: float) -> void:
	energy_bar.value = Global.energy_value
	city_damage_bar.value = Global.city_health
	
	if Global.energy_value == 0 and energy_timer.is_stopped():
		energy_timer.start()
	
	if Global.city_health <= 0:
		game_over.visible = true


func _on_energy_timer_timeout() -> void:
	Global._reload_energy(10)
	
	if Global.energy_value >= Global.max_energy:
		energy_timer.stop()


func _on_button_pressed() -> void:
	
	#ui_hide_timer.start()
	energy_bar.visible = false
	city_damage_bar.visible = false
	game_over.visible = false
	
	TransitionLayer.change_scene_to_file("uid://cxlcn35yepvuf")
	Global._reset()
	

#func _on_ui_hide_timer_timeout() -> void:
	#energy_bar.visible = true
	#city_damage_bar.visible = true
