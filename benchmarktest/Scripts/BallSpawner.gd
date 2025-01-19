extends Node3D

@export var ball: PackedScene

func spawn_ball():
	if ball:
		var ball_asset =ball.instantiate()
		add_child(ball_asset)
	else:
		print("Error:Ball scene not assigned")

func _process(delta: float) -> void:
	var fps = Performance.get_monitor(Performance.TIME_FPS)
	if fps < 10:
		print("FPS below 10, returning to main menu...")
		get_tree().change_scene_to_file("res://Scenes/main.tscn")
	# Handle lane switching input with A and D
	if Input.is_action_just_pressed("toMainMenu"):
		get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_ball_spawn_timer_timeout() -> void:
	spawn_ball()
