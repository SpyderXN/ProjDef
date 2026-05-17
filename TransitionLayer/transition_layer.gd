extends CanvasLayer

@onready var color_rect: ColorRect = $ColorRect

var tween: Tween
var scene_to_load: String

func change_scene_to_file(scene_path: String) -> void:
	if tween:
		tween.kill()
	
	scene_to_load = scene_path
	get_tree().paused = true
	
	tween = create_tween().set_trans(Tween.TRANS_BOUNCE)
	tween.tween_property(color_rect, "modulate:a", 1.0, 0.2).connect("finished", on_load_scene)
	tween.chain().tween_property(color_rect, "modulate:a", 0.0, 0.4)


func on_load_scene():
	get_tree().paused = false
	get_tree().call_deferred("change_scene_to_file", scene_to_load )
