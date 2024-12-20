extends MarginContainer

var tabSize

var dataType1
var dataType2
var dataType3
var dataType4

var streamName1
var streamName2
var streamName3
var streamName4

var connected = false
var curSample
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func resize():
	if tabSize:
		get_child(0).get_child(0).get_child(0).custom_minimum_size = Vector2(min(400,self.tabSize[0] * 0.4),min(100,self.tabSize[1]*0.125))
		get_child(0).get_child(0).get_child(1).custom_minimum_size = Vector2(min(400,self.tabSize[0] * 0.4),min(100,self.tabSize[1]*0.125))
		get_child(0).get_child(0).get_child(2).custom_minimum_size = Vector2(min(400,self.tabSize[0] * 0.4),min(100,self.tabSize[1]*0.125))
		get_child(0).get_child(0).get_child(3).custom_minimum_size = Vector2(min(400,self.tabSize[0] * 0.4),min(100,self.tabSize[1]*0.125))
		
		get_child(0).get_child(1).get_child(0).custom_minimum_size = Vector2(min(400,self.tabSize[0] * 0.4),min(100,self.tabSize[1]*0.125))
		get_child(0).get_child(1).get_child(1).custom_minimum_size = Vector2(min(400,self.tabSize[0] * 0.4),min(100,self.tabSize[1]*0.125))
		get_child(0).get_child(1).get_child(2).custom_minimum_size = Vector2(min(400,self.tabSize[0] * 0.4),min(100,self.tabSize[1]*0.125))
		get_child(0).get_child(1).get_child(3).custom_minimum_size = Vector2(min(400,self.tabSize[0] * 0.4),min(100,self.tabSize[1]*0.125))
		
		get_child(0).get_child(2).get_child(0).custom_minimum_size = Vector2(min(200,self.tabSize[0] * 0.1),min(100,self.tabSize[1]*0.125))
		get_child(0).get_child(2).get_child(1).custom_minimum_size = Vector2(min(200,self.tabSize[0] * 0.1),min(100,self.tabSize[1]*0.125))
		get_child(0).get_child(2).get_child(2).custom_minimum_size = Vector2(min(200,self.tabSize[0] * 0.1),min(100,self.tabSize[1]*0.125))
		get_child(0).get_child(2).get_child(3).custom_minimum_size = Vector2(min(200,self.tabSize[0] * 0.1),min(100,self.tabSize[1]*0.125))

func _on_connect_button_1_button_down():
	self.dataType1 = get_child(0).get_child(0).get_child(0)
	self.streamName1 = get_child(0).get_child(1).get_child(0)
	if (self.dataType1.text == "EEG" or self.dataType1.text == "EMG") and self.streamName1.text:
		LSL.connect_to_stream("name",self.streamName1.text,8)
		self.connected = true
	else:
		print("Invalid Stream")
	if !LSL.has_stream_inlet():
		print("Invalid Stream")



func _on_connect_button_2_button_down():
	self.dataType2 = get_child(0).get_child(0).get_child(0)
	self.streamName2 = get_child(0).get_child(1).get_child(0)
	if (self.dataType2.text == "EEG" or self.dataType2.text == "EMG") and self.streamName2.text:
		LSL.connect_to_stream("name",self.streamName2.text,8)
		self.connected = true
	else:
		print("Invalid Stream")
	if !LSL.has_stream_inlet():
		print("Invalid Stream")


func _on_connect_button_3_button_down():
	self.dataType3 = get_child(0).get_child(0).get_child(0)
	self.streamName3 = get_child(0).get_child(1).get_child(0)
	if (self.dataType3.text == "EEG" or self.dataType3.text == "EMG") and self.streamName3.text:
		LSL.connect_to_stream("name",self.streamName3.text,8)
		self.connected = true
	else:
		print("Invalid Stream")
	if !LSL.has_stream_inlet():
		print("Invalid Stream")


func _on_connect_button_4_button_down():
	self.dataType4 = get_child(0).get_child(0).get_child(0)
	self.streamName4 = get_child(0).get_child(1).get_child(0)
	if (self.dataType4.text == "EEG" or self.dataType4.text == "EMG") and self.streamName4.text:
		LSL.connect_to_stream("name",self.streamName4.text,8)
		self.connected = true
	else:
		print("Invalid Stream")
	if !LSL.has_stream_inlet():
		print("Invalid Stream")
