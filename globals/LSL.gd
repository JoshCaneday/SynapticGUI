extends Node


var lsl_Marker_Out
var lsl_EEG_In

# Called when the node enters the scene tree for the first time.
func _ready():
	#var mrk_script := load("res://Globals/LSLMrkOut.cs")
	#var script := load("res://Globals/LSL_Inlet.cs")
	#lsl_EEG_In = script.new()
	#lsl_Marker_Out = mrk_script.new()
	#lsl_Marker_Out._Ready()
	pass


func connect_to_stream(prop: String, value: String, num_channels: int):
	# Connect to the stream given the correct parameters (Check C# script for more info as this is just calling that)
	lsl_EEG_In.connect_to_stream(prop, value, num_channels)
	
func pull_sample():
	# This will call the overloaded function in C# which utilizes stored
	# variables within the C# class since GDScript has no access.
	# This will return an array of floats of size `num_channels` defined
	# in `connect_to_stream()`.
	return lsl_EEG_In.pull_sample()
	
	
func send_marker(marker: String):
	#print("hi")
	return lsl_Marker_Out.SendMarker(marker)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
