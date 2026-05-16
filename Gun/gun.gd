extends Node2D

const BULLET = preload("res://Bullet/bullet.tscn")

var touch_position: Vector2 = Vector2.ZERO
var is_touching = false

var can_shoot = true

@export var screen_drag: bool #Toggle button for screen drag

@onready var marker_2d: Marker2D = $Marker2D
@onready var timer: Timer = $Timer

#This func is for touch input.
func _input(event: InputEvent) -> void:
	
	#This is for tap in the screen.
	if event is InputEventScreenTouch:
		is_touching = event.pressed
		if is_touching:
			touch_position = event.position
			#fire()
			print("Touching")
	
	#This is for drag in the screen.
	elif  screen_drag:
		if event is InputEventScreenDrag:
			touch_position = event.position
			print("Dragging")


func _process(_delta: float) -> void:
	
	#Helps to look at touch pos in screen.
	if is_touching:
		look_at(touch_position)
	
	#This clamps the rotation of the gun.
	rotation_degrees = clamp(rotation_degrees, -180, 0)
	var at_limit = rotation_degrees <= -180 or rotation_degrees >= 0
	
	#This statement manage whether gun can shoot or not.
	if Global.energy_value == 0:
		can_shoot = false
	elif Global.energy_value >= 100:
		can_shoot = true
	
	#This condition maintains the if touch input register then can shoot.
	if is_touching and not at_limit:
		if can_shoot == true:
			timer.start()
			can_shoot = false
			fire()
			Global._depleted_energy(10)

#This func is for bullet spawn.
func fire():
	var bullet_scene = BULLET.instantiate()
	get_tree().root.add_child(bullet_scene)
	bullet_scene.global_position = marker_2d.global_position
	bullet_scene.global_rotation = marker_2d.global_rotation


func _on_timer_timeout() -> void:
	can_shoot = true
