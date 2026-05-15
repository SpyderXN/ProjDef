extends Node2D

@export var missile: Array[PackedScene]
@onready var spawn_timer: Timer = $SpawnTimer
@onready var spawns: Node2D = $Spawns

@export var high_range: float
@export var low_range: float

@export var high_angle: float
@export var low_angle: float

var can_spawn = true

func _process(_delta: float) -> void:
	
	if can_spawn and missile.size() > 0:
		can_spawn = false
		spawn_timer.start()
		
		var missile_scene = missile[randi() % missile.size()].instantiate()
		missile_scene.position.x = randf_range(low_range, high_range)
		
		var angle_offset = deg_to_rad(randf_range(low_angle, high_angle))
		missile_scene.rotation = rotation + angle_offset
		
		if missile_scene.position.x < 120:
			missile_scene.rotation = rotation
			print("Spawned")
		
		spawns.add_child(missile_scene)



func _on_spawn_timer_timeout() -> void:
	can_spawn = true
