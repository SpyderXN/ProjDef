extends Node2D


func _on_button_pressed() -> void:
	TransitionLayer.change_scene_to_file("res://Main/main.tscn")


func _on_button_2_pressed() -> void:
	get_tree().quit()
