extends Node


var lsl_Marker_Out
var lsl_EEG_In

# Called when the node enters the scene tree for the first time.
func _ready():
	var mrk_script := load("res://globals/LSL_Mark_Out.cs")
	var script := load("res://globals/LSL_Inlet.cs")
	lsl_EEG_In = script.new()
	lsl_Marker_Out = mrk_script.new()
	lsl_Marker_Out._Ready()
	pass


func connect_to_stream(prop: String, value: String, num_channels: int, streamNum: int):
	# Connect to the stream given the correct parameters (Check C# script for more info as this is just calling that)
	lsl_EEG_In.connect_to_stream(prop, value, num_channels,streamNum)
	
func pull_sample(timeout: float, streamNum: int):
	# This will call the overloaded function in C# which utilizes stored
	# variables within the C# class since GDScript has no access.
	# This will return an array of floats of size `num_channels` defined
	# in `connect_to_stream()`.
	return lsl_EEG_In.pull_sample(timeout,streamNum)

func prepare_outlet_stream(streamName: String, type: String, channelCount: int, streamNum: int):
	lsl_Marker_Out.prepare_outlet_stream(streamName,type,channelCount,streamNum)


func send_marker(sample: float, streamNum: int):
	return lsl_Marker_Out.send_sample(sample,streamNum)
	
func has_stream_inlet(streamNum: int):
	return lsl_EEG_In.has_stream_inlet(streamNum)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
