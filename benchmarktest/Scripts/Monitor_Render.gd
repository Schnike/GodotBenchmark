extends Node

# Path to save the log file
const FILE_PATH = "user://performance_log_rb.txt"

func _ready():
	# Clear the file at the start or create it if it doesn't exist
	var file = FileAccess.open(FILE_PATH, FileAccess.ModeFlags.WRITE)  # Open file in WRITE mode
	if file:
		file.store_string("")  # Clear existing content
		file.close()  # Close the file

func _process(delta):
	# Gather performance data
	var fps = Performance.get_monitor(Performance.TIME_FPS)
	var object_count = Performance.get_monitor(Performance.OBJECT_COUNT)
	var total_objects = Performance.get_monitor(Performance.RENDER_TOTAL_OBJECTS_IN_FRAME)
	
	# Log data to the console
	print("------------------------")
	print("FPS: ", fps)
	print("Object Count: ", object_count)
	print("Total Objects in Frame: ", total_objects)
	print("------------------------")
	
	# Prepare the log string
	var log_entry = "------------------------\n"
	log_entry += "FPS: %s\n" % fps
	log_entry += "Object Count: %s\n" % object_count
	log_entry += "Total Objects in Frame: %s\n" % total_objects
	log_entry += "------------------------\n"
	
	# Write log entry to file
	var file = FileAccess.open(FILE_PATH, FileAccess.ModeFlags.WRITE_READ)  # Open file in WRITE_READ mode
	if file:
		file.seek_end()  # Move cursor to the end of the file to append
		file.store_string(log_entry)  # Append the log entry
		file.close()  # Close the file
