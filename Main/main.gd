extends Node2D

#@onready var game_over_panel: PanelContainer = $UI/GameOver
@export var full_damage: bool

#func _ready() -> void:
	#game_over_panel.visible = false

func _process(_delta: float) -> void:
	#if Global.city_health <= 0:
		#_game_over_panel()
	
	if full_damage:
		Global.city_health = 0

#func _game_over_panel():
	##var tween = get_tree().create_tween()
	#game_over_panel.visible = true
