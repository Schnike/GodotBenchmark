extends Node

func _process(delta):
	print("------------------------")
	# Log FPS
	var fps = Performance.get_monitor(Performance.TIME_FPS)
	print("FPS: ", fps)
	
	# Log memory usage
	var static_mem = Performance.get_monitor(Performance.MEMORY_STATIC) / (1024 * 1024) # Convert bytes to MB
	print("Static Memory: ", static_mem, " MB")
	
	var object_count = Performance.get_monitor(Performance.OBJECT_COUNT)
	print("Object Count: ", object_count)
	
	# Log the number of collision pairs in 3D physics
	var collision_pairs = Performance.get_monitor(Performance.PHYSICS_3D_COLLISION_PAIRS)
	print("Collision Pairs: ", collision_pairs)
	
	# Log the time spent in the physics process
	var time_physics_process = Performance.get_monitor(Performance.TIME_PHYSICS_PROCESS)
	print("Physics Process Time: ", time_physics_process)
	
	# Log the number of active 3D physics objects
	var active_3d = Performance.get_monitor(Performance.PHYSICS_3D_ACTIVE_OBJECTS)
	print("Active 3D Physics Objects: ", active_3d)
	
	print("------------------------")
