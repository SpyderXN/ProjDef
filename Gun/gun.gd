extends Node2D

const BULLET = preload("res://Bullet/bullet.tscn")

var touch_position: Vector2 = Vector2.ZERO
var is_touching = false

var can_shoot = true

@onready var marker_2d: Marker2D = $Marker2D
@onready var timer: Timer = $Timer

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		is_touching = event.pressed
		if is_touching:
			touch_position = event.position
			#fire()
			print("Touching")
	
	elif event is InputEventScreenDrag:
		touch_position = event.position
		print("Dragging")


func _process(_delta: float) -> void:
	if is_touching:
		look_at(touch_position)
	
	rotation_degrees = clamp(rotation_degrees, -180, 0)
	
	var at_limit = rotation_degrees <= -180 or rotation_degrees >= 0
	
	if is_touching and not at_limit:
		if can_shoot:
			timer.start()
			can_shoot = false
			fire()

func fire():
	var bullet_scene = BULLET.instantiate()
	get_tree().root.add_child(bullet_scene)
	bullet_scene.global_position = marker_2d.global_position
	bullet_scene.global_rotation = marker_2d.global_rotation


func _on_timer_timeout() -> void:
	can_shoot = true
