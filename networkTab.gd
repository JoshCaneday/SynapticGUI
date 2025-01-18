extends MarginContainer

var tabSize

var XdataType = 0.35 # both inlet and outlets 1-4 will be the same
var XstreamName = 0.35 # same as inlet and outlet stream names 1-4
var XconnectButton  = 0.1 # ConnectButton = inletButton and outletButton 1-4

var YdataType = 0.1
var YstreamName = 0.1
var YconnectButton = 0.1

var inletDataType1
var inletDataType2
var inletDataType3
var inletDataType4

var outletDataType1
var outletDataType2
var outletDataType3
var outletDataType4

var inletStreamName1
var inletStreamName2
var inletStreamName3
var inletStreamName4

var outletStreamName1
var outletStreamName2
var outletStreamName3
var outletStreamName4

var inletButton1
var inletButton2
var inletButton3
var inletButton4

var outletButton1
var outletButton2
var outletButton3
var outletButton4

var streamName1
var streamName2
var streamName3
var streamName4

var connected = false
var curSample

# Called when the node enters the scene tree for the first time.
func _ready():
	self.inletDataType1 = find_child("inletDataType1",true)
	self.inletDataType2 = find_child("inletDataType2",true)
	self.inletDataType3 = find_child("inletDataType3",true)
	self.inletDataType4 = find_child("inletDataType4",true)
	self.outletDataType1 = find_child("outletDataType1",true)
	self.outletDataType2 = find_child("outletDataType2",true)
	self.outletDataType3 = find_child("outletDataType3",true)
	self.outletDataType4 = find_child("outletDataType4",true)
	
	self.inletStreamName1 = find_child("inletStreamName1",true)
	self.inletStreamName2 = find_child("inletStreamName2",true)
	self.inletStreamName3 = find_child("inletStreamName3",true)
	self.inletStreamName4 = find_child("inletStreamName4",true)
	self.outletStreamName1 = find_child("outletStreamName1",true)
	self.outletStreamName2 = find_child("outletStreamName2",true)
	self.outletStreamName3 = find_child("outletStreamName3",true)
	self.outletStreamName4 = find_child("outletStreamName4",true)
	
	self.inletButton1 = find_child("inletButton1",true)
	self.inletButton2 = find_child("inletButton2",true)
	self.inletButton3 = find_child("inletButton3",true)
	self.inletButton4 = find_child("inletButton4",true)
	self.outletButton1 = find_child("outletButton1",true)
	self.outletButton2 = find_child("outletButton2",true)
	self.outletButton3 = find_child("outletButton3",true)
	self.outletButton4 = find_child("outletButton4",true)
	
	resize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func resize():
	if tabSize:
		self.inletDataType1.custom_minimum_size = Vector2(self.XdataType*tabSize[0],self.YdataType*tabSize[1])
		self.inletDataType1.add_theme_font_size_override("font_size", min(self.inletDataType1.custom_minimum_size[0]/10,self.inletDataType1.custom_minimum_size[1]/2))
		self.inletDataType2.custom_minimum_size = Vector2(self.XdataType*tabSize[0],self.YdataType*tabSize[1])
		self.inletDataType2.add_theme_font_size_override("font_size", min(self.inletDataType2.custom_minimum_size[0]/10,self.inletDataType2.custom_minimum_size[1]/2))
		self.inletDataType3.custom_minimum_size = Vector2(self.XdataType*tabSize[0],self.YdataType*tabSize[1])
		self.inletDataType3.add_theme_font_size_override("font_size", min(self.inletDataType3.custom_minimum_size[0]/10,self.inletDataType3.custom_minimum_size[1]/2))
		self.inletDataType4.custom_minimum_size = Vector2(self.XdataType*tabSize[0],self.YdataType*tabSize[1])
		self.inletDataType4.add_theme_font_size_override("font_size", min(self.inletDataType4.custom_minimum_size[0]/10,self.inletDataType4.custom_minimum_size[1]/2))
		
		self.outletDataType1.custom_minimum_size = Vector2(self.XdataType*tabSize[0],self.YdataType*tabSize[1])
		self.outletDataType1.add_theme_font_size_override("font_size", min(self.outletDataType1.custom_minimum_size[0]/10,self.outletDataType1.custom_minimum_size[1]/2))
		self.outletDataType2.custom_minimum_size = Vector2(self.XdataType*tabSize[0],self.YdataType*tabSize[1])
		self.outletDataType2.add_theme_font_size_override("font_size", min(self.outletDataType2.custom_minimum_size[0]/10,self.outletDataType2.custom_minimum_size[1]/2))
		self.outletDataType3.custom_minimum_size = Vector2(self.XdataType*tabSize[0],self.YdataType*tabSize[1])
		self.outletDataType3.add_theme_font_size_override("font_size", min(self.outletDataType3.custom_minimum_size[0]/10,self.outletDataType3.custom_minimum_size[1]/2))
		self.outletDataType4.custom_minimum_size = Vector2(self.XdataType*tabSize[0],self.YdataType*tabSize[1])
		self.outletDataType4.add_theme_font_size_override("font_size", min(self.outletDataType4.custom_minimum_size[0]/10,self.outletDataType4.custom_minimum_size[1]/2))
		
		self.inletStreamName1.custom_minimum_size = Vector2(self.XstreamName*tabSize[0],self.YstreamName*tabSize[1])
		self.inletStreamName1.add_theme_font_size_override("font_size", min(self.inletStreamName1.custom_minimum_size[0]/10,self.inletStreamName1.custom_minimum_size[1]/2))
		self.inletStreamName2.custom_minimum_size = Vector2(self.XstreamName*tabSize[0],self.YstreamName*tabSize[1])
		self.inletStreamName2.add_theme_font_size_override("font_size", min(self.inletStreamName2.custom_minimum_size[0]/10,self.inletStreamName2.custom_minimum_size[1]/2))
		self.inletStreamName3.custom_minimum_size = Vector2(self.XstreamName*tabSize[0],self.YstreamName*tabSize[1])
		self.inletStreamName3.add_theme_font_size_override("font_size", min(self.inletStreamName3.custom_minimum_size[0]/10,self.inletStreamName3.custom_minimum_size[1]/2))
		self.inletStreamName4.custom_minimum_size = Vector2(self.XstreamName*tabSize[0],self.YstreamName*tabSize[1])
		self.inletStreamName4.add_theme_font_size_override("font_size", min(self.inletStreamName4.custom_minimum_size[0]/10,self.inletStreamName4.custom_minimum_size[1]/2))
		
		self.outletStreamName1.custom_minimum_size = Vector2(self.XstreamName*tabSize[0],self.YstreamName*tabSize[1])
		self.outletStreamName1.add_theme_font_size_override("font_size", min(self.outletStreamName1.custom_minimum_size[0]/10,self.outletStreamName1.custom_minimum_size[1]/2))
		self.outletStreamName2.custom_minimum_size = Vector2(self.XstreamName*tabSize[0],self.YstreamName*tabSize[1])
		self.outletStreamName2.add_theme_font_size_override("font_size", min(self.outletStreamName2.custom_minimum_size[0]/10,self.outletStreamName2.custom_minimum_size[1]/2))
		self.outletStreamName3.custom_minimum_size = Vector2(self.XstreamName*tabSize[0],self.YstreamName*tabSize[1])
		self.outletStreamName3.add_theme_font_size_override("font_size", min(self.outletStreamName3.custom_minimum_size[0]/10,self.outletStreamName3.custom_minimum_size[1]/2))
		self.outletStreamName4.custom_minimum_size = Vector2(self.XstreamName*tabSize[0],self.YstreamName*tabSize[1])
		self.outletStreamName4.add_theme_font_size_override("font_size", min(self.outletStreamName4.custom_minimum_size[0]/10,self.outletStreamName4.custom_minimum_size[1]/2))
		
		self.inletButton1.custom_minimum_size = Vector2(self.XconnectButton*tabSize[0],self.YconnectButton*tabSize[1])
		self.inletButton1.add_theme_font_size_override("font_size", min(self.inletButton1.custom_minimum_size[0]/3,self.inletButton1.custom_minimum_size[1]/2))
		self.inletButton2.custom_minimum_size = Vector2(self.XconnectButton*tabSize[0],self.YconnectButton*tabSize[1])
		self.inletButton2.add_theme_font_size_override("font_size", min(self.inletButton2.custom_minimum_size[0]/3,self.inletButton2.custom_minimum_size[1]/2))
		self.inletButton3.custom_minimum_size = Vector2(self.XconnectButton*tabSize[0],self.YconnectButton*tabSize[1])
		self.inletButton3.add_theme_font_size_override("font_size", min(self.inletButton3.custom_minimum_size[0]/3,self.inletButton3.custom_minimum_size[1]/2))
		self.inletButton4.custom_minimum_size = Vector2(self.XconnectButton*tabSize[0],self.YconnectButton*tabSize[1])
		self.inletButton4.add_theme_font_size_override("font_size", min(self.inletButton4.custom_minimum_size[0]/3,self.inletButton4.custom_minimum_size[1]/2))
		
		self.outletButton1.custom_minimum_size = Vector2(self.XconnectButton*tabSize[0],self.YconnectButton*tabSize[1])
		self.outletButton1.add_theme_font_size_override("font_size", min(self.outletButton1.custom_minimum_size[0]/3,self.outletButton1.custom_minimum_size[1]/2))
		self.outletButton2.custom_minimum_size = Vector2(self.XconnectButton*tabSize[0],self.YconnectButton*tabSize[1])
		self.outletButton2.add_theme_font_size_override("font_size", min(self.outletButton2.custom_minimum_size[0]/3,self.outletButton2.custom_minimum_size[1]/2))
		self.outletButton3.custom_minimum_size = Vector2(self.XconnectButton*tabSize[0],self.YconnectButton*tabSize[1])
		self.outletButton3.add_theme_font_size_override("font_size", min(self.outletButton3.custom_minimum_size[0]/3,self.outletButton3.custom_minimum_size[1]/2))
		self.outletButton4.custom_minimum_size = Vector2(self.XconnectButton*tabSize[0],self.YconnectButton*tabSize[1])
		self.outletButton4.add_theme_font_size_override("font_size", min(self.outletButton4.custom_minimum_size[0]/3,self.outletButton4.custom_minimum_size[1]/2))

func _on_inlet_button_1_button_down():
	if self.inletStreamName1.text:
		LSL.connect_to_stream("name",self.inletStreamName1.text,8,1)
		self.connected = true
	else:
		print("Invalid Stream")
	if !LSL.has_stream_inlet(1):
		print("Invalid Stream")


func _on_inlet_button_2_button_down():
	if self.inletStreamName2.text:
		LSL.connect_to_stream("name",self.inletStreamName1.text,8,2)
		self.connected = true
	else:
		print("Invalid Stream")
	if !LSL.has_stream_inlet(2):
		print("Invalid Stream")


func _on_inlet_button_3_button_down():
	if self.inletStreamName3.text:
		LSL.connect_to_stream("name",self.inletStreamName3.text,8,1)
		self.connected = true
	else:
		print("Invalid Stream")
	if !LSL.has_stream_inlet(3):
		print("Invalid Stream")

func _on_inlet_button_4_button_down():
	if self.inletStreamName4.text:
		LSL.connect_to_stream("name",self.inletStreamName4.text,8,1)
		self.connected = true
	else:
		print("Invalid Stream")
	if !LSL.has_stream_inlet(4):
		print("Invalid Stream")

func _on_outlet_button_1_button_down():
	if self.outletStreamName1.text:
		LSL.prepare_outlet_stream(self.outletStreamName1, "EEG", 8, 1)
	else:
		print("Invalid Stream")

func _on_outlet_button_2_button_down():
	if self.outletStreamName2.text:
		LSL.prepare_outlet_stream(self.outletStreamName2, "EEG", 8, 1)
	else:
		print("Invalid Stream")
	pass # Replace with function body.

func _on_outlet_button_3_button_down():
	if self.outletStreamName3.text:
		LSL.prepare_outlet_stream(self.outletStreamName3, "EEG", 8, 1)
	else:
		print("Invalid Stream")
	pass # Replace with function body.

func _on_outlet_button_4_button_down():
	if self.outletStreamName4.text:
		LSL.prepare_outlet_stream(self.outletStreamName4, "EEG", 8, 1)
	else:
		print("Invalid Stream")
	pass # Replace with function body.
