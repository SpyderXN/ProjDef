extends Area2D

@export var speed = 500

func _process(delta: float) -> void:
	position += transform.y * speed * delta


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Bullet"):
		print("Bullet")
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("City"):
		print("city")
		Global._city_damage(10)
		queue_free()
		
