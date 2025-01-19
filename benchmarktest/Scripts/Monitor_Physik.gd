extends Node

func _process(delta):
	print("------------------------")
	# Log FPS
	var fps = Performance.get_monitor(Performance.TIME_FPS)
	print("FPS: ", fps)

	var object_count = Performance.get_monitor(Performance.OBJECT_COUNT)
	print("Object Count: ", object_count)
	
	# Log the number of active 3D physics objects
	var active_3d = Performance.get_monitor(Performance.PHYSICS_3D_ACTIVE_OBJECTS)
	print("Active 3D Physics Objects: ", active_3d)
	
	print("------------------------")
