extends Area2D

var speed = 500

func _process(delta: float) -> void:
	position += transform.x * speed * delta


func _on_bullet_exited() -> void:
	queue_free()
