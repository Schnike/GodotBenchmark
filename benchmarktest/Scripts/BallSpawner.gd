extends Node3D

@export var ball: PackedScene

func spawn_ball():
	if ball:
		var ball_asset =ball.instantiate()
		add_child(ball_asset)
	else:
		print("Error:Ball scene not assigned")



func _on_ball_spawn_timer_timeout() -> void:
	spawn_ball()
