extends Node

func _process(delta):
	print("------------------------")
	# Log FPS
	var fps = Performance.get_monitor(Performance.TIME_FPS)
	print("FPS: ", fps)
	
	# Log memory usage in MB
	var static_mem = Performance.get_monitor(Performance.MEMORY_STATIC) / (1024 * 1024) # Convert bytes to MB
	print("Static Memory: ", static_mem, " MB")
	
	var object_count = Performance.get_monitor(Performance.OBJECT_COUNT)
	print("Object Count: ", object_count)
	
	# Log total objects rendered in the frame
	var total_objects = Performance.get_monitor(Performance.RENDER_TOTAL_OBJECTS_IN_FRAME)
	print("Total Objects in Frame: ", total_objects)
	
	# Log total primitives (vertices or indices) rendered in the frame
	var total_primitives = Performance.get_monitor(Performance.RENDER_TOTAL_PRIMITIVES_IN_FRAME)
	print("Total Primitives in Frame: ", total_primitives)
	
	# Log video memory used in MB
	var video_mem_used = Performance.get_monitor(Performance.RENDER_VIDEO_MEM_USED) / (1024 * 1024) # Convert bytes to MB
	print("Video Memory Used: ", video_mem_used, " MB")
	print("------------------------")
