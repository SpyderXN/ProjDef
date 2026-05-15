extends Area2D

var speed = 500

func _process(delta: float) -> void:
	position += transform.y * speed * delta


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Bullet"):
		print("Bullet")
		queue_free()
