extends Node3D

# Settings for the benchmark
@export var camera_distance_start: float = 10.0
@export var distance_increment: float = 5.0
@export var rotation_speed: float = 60.0 # Degrees per second
@export var grid_spacing: float = 2.0 # Increased spacing for more visible gaps
@export var squares_per_row_start: int = 3 # Start with a 3x3x3 grid
@onready var camera: Camera3D = $Camera3D

# Nodes
var timer: Timer

# State variables
var current_angle: float = 0.0
var current_distance: float
var squares_per_row: int
var grid_center_offset: float

func _ready():
	current_distance = camera_distance_start
	squares_per_row = squares_per_row_start
	grid_center_offset = (squares_per_row - 1) * grid_spacing / 2.0

	# Create a timer for spawning squares
	timer = Timer.new()
	timer.wait_time = 1.0 # Spawn squares once per second
	timer.autostart = true
	timer.one_shot = false
	timer.connect("timeout", Callable(self, "_on_timer_timeout"))  # Corrected Callable syntax
	add_child(timer)

	# Adjust camera's initial position
	_update_camera_position()

func _process(delta):
	# Rotate the camera around the origin
	current_angle += rotation_speed * delta
	_update_camera_position()
	var fps = Performance.get_monitor(Performance.TIME_FPS)
	if fps < 10:
		print("FPS below 10, returning to main menu...")
		get_tree().change_scene_to_file("res://Scenes/main.tscn")
	if Input.is_action_just_pressed("toMainMenu"):
		get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _update_camera_position():
	var rad = deg_to_rad(current_angle)  # Corrected function name
	camera.global_position = Vector3(
		current_distance * cos(rad),
		current_distance * 0.5,  # Slightly above origin
		current_distance * sin(rad)
	)
	camera.look_at(Vector3(0, 0, 0), Vector3.UP)

func _on_timer_timeout():
	_spawn_grid()
	# Update the camera distance for the next rotation
	current_distance += distance_increment

	# Increase the grid size
	squares_per_row += 2
	grid_center_offset = (squares_per_row - 1) * grid_spacing / 2.0

func _spawn_grid():
	# Spawn squares in a 3D grid pattern
	for x in range(squares_per_row):
		for y in range(squares_per_row):
			for z in range(squares_per_row):
				var square = MeshInstance3D.new()  # Corrected class name
				square.mesh = BoxMesh.new()       # Corrected class name
				square.transform.origin = Vector3(
					x * grid_spacing - grid_center_offset,
					y * grid_spacing - grid_center_offset,
					z * grid_spacing - grid_center_offset
				)
				add_child(square)
