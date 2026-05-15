extends Area2D

var speed = 500

func _process(delta: float) -> void:
	position += transform.y * speed * delta
