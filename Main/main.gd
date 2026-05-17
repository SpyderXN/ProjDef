extends Node2D

@onready var game_over_panel: PanelContainer = $UI/GameOver

func _ready() -> void:
	if Global.city_health >= 100:
		game_over_panel.visible = false

func _process(_delta: float) -> void:
	if Global.city_health <= 0:
		_game_over_panel()

func _game_over_panel():
	#var tween = get_tree().create_tween()
	game_over_panel.visible = true
