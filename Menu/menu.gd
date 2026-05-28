extends Node2D

var tween: Tween
@onready var button: Button = $UI/Button
@onready var button_2: Button = $UI/Button2
@onready var touch_pivot: Node2D = $TouchPivot
@onready var exit: Node2D = $Exit



func _process(_delta: float) -> void:
	
	if Input.is_action_just_pressed("start_pressed"):
		touch_pivot.pressed()
	elif Input.is_action_just_released("start_pressed"):
		touch_pivot.released()
		TransitionLayer.change_scene_to_file("res://Main/main.tscn")
	
	
	if Input.is_action_just_pressed("exit_pressed"):
		exit.pressed()
	elif Input.is_action_just_released("exit_pressed"):
		exit.released()
		get_tree().quit()

func _on_button_pressed() -> void:
	TransitionLayer.change_scene_to_file("res://Main/main.tscn")


func _on_button_2_pressed() -> void:
	get_tree().quit()


func _on_button_mouse_entered() -> void:
	
	button.pivot_offset = button.size / 2.0
	
	var scale_ratio: float = clampf(500.0/button.size.x, 0.5, 1.0 )
	var scale_target: float = 1.0 + (0.2) * scale_ratio
	
	if tween and tween.is_running():
		tween.kill()
	
	tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(button, "scale:x", scale_target, 0.2)
	tween.parallel().tween_property(button, "scale:y", scale_target, 0.35)
	tween.parallel().tween_property(button, "rotation_degrees", 5.0 * scale_ratio * [-1.0, 1.0].pick_random(), 0.1)
	tween.parallel().tween_property(button, "rotation_degrees", 0.0, 0.1).set_delay(0.1)


func _on_button_mouse_exited() -> void:
	if tween and tween.is_running():
		tween.kill()
	
	tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
	tween.tween_property(button, "scale:x", 1.0, 0.2)
	tween.parallel().tween_property(button, "scale:y", 1.0, 0.35)
	tween.parallel().tween_property(button, "rotation_degrees", 0.0, 0.1)
	tween.parallel().tween_property(button, "rotation_degrees", 0.0, 0.1).set_delay(0.1)
