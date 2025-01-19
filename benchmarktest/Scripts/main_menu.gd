extends Node2D

func _on_button_2_pressed_rb() -> void:
	get_tree().change_scene_to_file("res://Scenes/Render_benchmark.tscn")


func _on_button_pressed_pb() -> void:
	get_tree().change_scene_to_file("res://Scenes/Physiks_benchmark.tscn")
