extends Node

func _process(delta):
	print("------------------------")
	# Log FPS
	var fps = Performance.get_monitor(Performance.TIME_FPS)
	print("FPS: ", fps)

	var object_count = Performance.get_monitor(Performance.OBJECT_COUNT)
	print("Object Count: ", object_count)
	
	# Log total objects rendered in the frame
	var total_objects = Performance.get_monitor(Performance.RENDER_TOTAL_OBJECTS_IN_FRAME)
	print("Total Objects in Frame: ", total_objects)
	
	print("------------------------")
