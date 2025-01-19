extends Node

# Path to the file where data will be saved
const FILE_PATH = "user://performance_log_pb.txt"


func _ready():
	# Clear the file at the start or create it if it doesn't exist
	var file = FileAccess.open(FILE_PATH, FileAccess.ModeFlags.WRITE)  # Open the file in WRITE mode
	if file:
		file.store_string("")  # Clear any existing content
		file.close()  # Close the file

func _process(delta):
	# Gather performance data
	var fps = Performance.get_monitor(Performance.TIME_FPS)
	var object_count = Performance.get_monitor(Performance.OBJECT_COUNT)
	var active_3d = Performance.get_monitor(Performance.PHYSICS_3D_ACTIVE_OBJECTS)
	
	print("------------------------")
	print("FPS: ", fps)
	print("Object Count: ", object_count)
	print("Active 3D Physics Objects: ", active_3d)
	print("------------------------")
	
	# Prepare the log string
	var log_entry = "------------------------\n"
	log_entry += "FPS: %s\n" % fps
	log_entry += "Object Count: %s\n" % object_count
	log_entry += "Active 3D Physics Objects: %s\n" % active_3d
	log_entry += "------------------------\n"
	
	# Write to the file in append mode
	var file = FileAccess.open(FILE_PATH, FileAccess.ModeFlags.WRITE)  # Open the file in WRITE mode
	if file:
		file.seek_end()  # Move the cursor to the end of the file
		file.store_string(log_entry)  # Append the log entry to the file
		file.close()  # Close the file
