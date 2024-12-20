extends MarginContainer

var tabSize

var pull_and_plot = false

var line1
var line2
var line3
var line4
var line5
var line6
var line7
var line8

var ampMultipliers = [0, 0, 0, 0, 0, 0, 0, 0]
# Called when the node enters the scene tree for the first time.
func _ready():
	self.line1 = get_child(0).get_child(1).get_child(0).get_child(0).get_child(1)
	self.line2 = get_child(0).get_child(1).get_child(1).get_child(0).get_child(1)
	self.line3 = get_child(0).get_child(1).get_child(2).get_child(0).get_child(1)
	self.line4 = get_child(0).get_child(1).get_child(3).get_child(0).get_child(1)
	self.line5 = get_child(0).get_child(1).get_child(4).get_child(0).get_child(1)
	self.line6 = get_child(0).get_child(1).get_child(5).get_child(0).get_child(1)
	self.line7 = get_child(0).get_child(1).get_child(6).get_child(0).get_child(1)
	self.line8 = get_child(0).get_child(1).get_child(7).get_child(0).get_child(1)
	self.line1.width = 1
	self.line1.default_color = Color(0.2, 0.6, 1)
	self.line2.width = 1
	self.line2.default_color = Color(0.2, 0.6, 1)
	self.line3.width = 1
	self.line3.default_color = Color(0.2, 0.6, 1)
	self.line4.width = 1
	self.line4.default_color = Color(0.2, 0.6, 1)
	self.line5.width = 1
	self.line5.default_color = Color(0.2, 0.6, 1)
	self.line6.width = 1
	self.line6.default_color = Color(0.2, 0.6, 1)
	self.line7.width = 1
	self.line7.default_color = Color(0.2, 0.6, 1)
	self.line8.width = 1
	self.line8.default_color = Color(0.2, 0.6, 1)


func resize():
	if tabSize:
		get_child(0).get_child(1).get_child(0).get_child(0).custom_minimum_size = Vector2(self.tabSize[0]*0.7,self.tabSize[1]*0.08)
		get_child(0).get_child(1).get_child(0).get_child(2).custom_minimum_size = Vector2(self.tabSize[0]*0.1,self.tabSize[1]*0.08)
		get_child(0).get_child(1).get_child(0).get_child(1).get_child(0).custom_minimum_size = Vector2(self.tabSize[0]*0.05,self.tabSize[1]*0.035)
		get_child(0).get_child(1).get_child(0).get_child(1).get_child(0).add_theme_font_size_override("font_size", 8)
		get_child(0).get_child(1).get_child(0).get_child(1).get_child(1).custom_minimum_size = Vector2(self.tabSize[0]*0.05,self.tabSize[1]*0.01)
		get_child(0).get_child(1).get_child(0).get_child(1).get_child(2).custom_minimum_size = Vector2(self.tabSize[0]*0.05,self.tabSize[1]*0.035)
		get_child(0).get_child(1).get_child(0).get_child(1).get_child(2).add_theme_font_size_override("font_size", 8)
	
		get_child(0).get_child(1).get_child(1).get_child(0).custom_minimum_size = Vector2(self.tabSize[0]*0.7,self.tabSize[1]*0.08)
		get_child(0).get_child(1).get_child(1).get_child(2).custom_minimum_size = Vector2(self.tabSize[0]*0.1,self.tabSize[1]*0.08)
		get_child(0).get_child(1).get_child(1).get_child(1).get_child(0).custom_minimum_size = Vector2(self.tabSize[0]*0.05,self.tabSize[1]*0.035)
		get_child(0).get_child(1).get_child(1).get_child(1).get_child(0).add_theme_font_size_override("font_size", 8)
		get_child(0).get_child(1).get_child(1).get_child(1).get_child(1).custom_minimum_size = Vector2(self.tabSize[0]*0.05,self.tabSize[1]*0.01)
		get_child(0).get_child(1).get_child(1).get_child(1).get_child(2).custom_minimum_size = Vector2(self.tabSize[0]*0.05,self.tabSize[1]*0.035)
		get_child(0).get_child(1).get_child(1).get_child(1).get_child(2).add_theme_font_size_override("font_size", 8)
		
		get_child(0).get_child(1).get_child(2).get_child(0).custom_minimum_size = Vector2(self.tabSize[0]*0.7,self.tabSize[1]*0.08)
		get_child(0).get_child(1).get_child(2).get_child(2).custom_minimum_size = Vector2(self.tabSize[0]*0.1,self.tabSize[1]*0.08)
		get_child(0).get_child(1).get_child(2).get_child(1).get_child(0).custom_minimum_size = Vector2(self.tabSize[0]*0.05,self.tabSize[1]*0.035)
		get_child(0).get_child(1).get_child(2).get_child(1).get_child(0).add_theme_font_size_override("font_size", 8)
		get_child(0).get_child(1).get_child(2).get_child(1).get_child(1).custom_minimum_size = Vector2(self.tabSize[0]*0.05,self.tabSize[1]*0.01)
		get_child(0).get_child(1).get_child(2).get_child(1).get_child(2).custom_minimum_size = Vector2(self.tabSize[0]*0.05,self.tabSize[1]*0.035)
		get_child(0).get_child(1).get_child(2).get_child(1).get_child(2).add_theme_font_size_override("font_size", 8)
	
		get_child(0).get_child(1).get_child(3).get_child(0).custom_minimum_size = Vector2(self.tabSize[0]*0.7,self.tabSize[1]*0.08)
		get_child(0).get_child(1).get_child(3).get_child(2).custom_minimum_size = Vector2(self.tabSize[0]*0.1,self.tabSize[1]*0.08)
		get_child(0).get_child(1).get_child(3).get_child(1).get_child(0).custom_minimum_size = Vector2(self.tabSize[0]*0.05,self.tabSize[1]*0.035)
		get_child(0).get_child(1).get_child(3).get_child(1).get_child(0).add_theme_font_size_override("font_size", 8)
		get_child(0).get_child(1).get_child(3).get_child(1).get_child(1).custom_minimum_size = Vector2(self.tabSize[0]*0.05,self.tabSize[1]*0.01)
		get_child(0).get_child(1).get_child(3).get_child(1).get_child(2).custom_minimum_size = Vector2(self.tabSize[0]*0.05,self.tabSize[1]*0.035)
		get_child(0).get_child(1).get_child(3).get_child(1).get_child(2).add_theme_font_size_override("font_size", 8)
		
		get_child(0).get_child(1).get_child(4).get_child(0).custom_minimum_size = Vector2(self.tabSize[0]*0.7,self.tabSize[1]*0.08)
		get_child(0).get_child(1).get_child(4).get_child(2).custom_minimum_size = Vector2(self.tabSize[0]*0.1,self.tabSize[1]*0.08)
		get_child(0).get_child(1).get_child(4).get_child(1).get_child(0).custom_minimum_size = Vector2(self.tabSize[0]*0.05,self.tabSize[1]*0.035)
		get_child(0).get_child(1).get_child(4).get_child(1).get_child(0).add_theme_font_size_override("font_size", 8)
		get_child(0).get_child(1).get_child(4).get_child(1).get_child(1).custom_minimum_size = Vector2(self.tabSize[0]*0.05,self.tabSize[1]*0.01)
		get_child(0).get_child(1).get_child(4).get_child(1).get_child(2).custom_minimum_size = Vector2(self.tabSize[0]*0.05,self.tabSize[1]*0.035)
		get_child(0).get_child(1).get_child(4).get_child(1).get_child(2).add_theme_font_size_override("font_size", 8)
		
		get_child(0).get_child(1).get_child(5).get_child(0).custom_minimum_size = Vector2(self.tabSize[0]*0.7,self.tabSize[1]*0.08)
		get_child(0).get_child(1).get_child(5).get_child(2).custom_minimum_size = Vector2(self.tabSize[0]*0.1,self.tabSize[1]*0.08)
		get_child(0).get_child(1).get_child(5).get_child(1).get_child(0).custom_minimum_size = Vector2(self.tabSize[0]*0.05,self.tabSize[1]*0.035)
		get_child(0).get_child(1).get_child(5).get_child(1).get_child(0).add_theme_font_size_override("font_size", 8)
		get_child(0).get_child(1).get_child(5).get_child(1).get_child(1).custom_minimum_size = Vector2(self.tabSize[0]*0.05,self.tabSize[1]*0.01)
		get_child(0).get_child(1).get_child(5).get_child(1).get_child(2).custom_minimum_size = Vector2(self.tabSize[0]*0.05,self.tabSize[1]*0.035)
		get_child(0).get_child(1).get_child(5).get_child(1).get_child(2).add_theme_font_size_override("font_size", 8)
		
		get_child(0).get_child(1).get_child(6).get_child(0).custom_minimum_size = Vector2(self.tabSize[0]*0.7,self.tabSize[1]*0.08)
		get_child(0).get_child(1).get_child(6).get_child(2).custom_minimum_size = Vector2(self.tabSize[0]*0.1,self.tabSize[1]*0.08)
		get_child(0).get_child(1).get_child(6).get_child(1).get_child(0).custom_minimum_size = Vector2(self.tabSize[0]*0.05,self.tabSize[1]*0.035)
		get_child(0).get_child(1).get_child(6).get_child(1).get_child(0).add_theme_font_size_override("font_size", 8)
		get_child(0).get_child(1).get_child(6).get_child(1).get_child(1).custom_minimum_size = Vector2(self.tabSize[0]*0.05,self.tabSize[1]*0.01)
		get_child(0).get_child(1).get_child(6).get_child(1).get_child(2).custom_minimum_size = Vector2(self.tabSize[0]*0.05,self.tabSize[1]*0.035)
		get_child(0).get_child(1).get_child(6).get_child(1).get_child(2).add_theme_font_size_override("font_size", 8)
		
		get_child(0).get_child(1).get_child(7).get_child(0).custom_minimum_size = Vector2(self.tabSize[0]*0.7,self.tabSize[1]*0.08)
		get_child(0).get_child(1).get_child(7).get_child(2).custom_minimum_size = Vector2(self.tabSize[0]*0.1,self.tabSize[1]*0.08)
		get_child(0).get_child(1).get_child(7).get_child(1).get_child(0).custom_minimum_size = Vector2(self.tabSize[0]*0.05,self.tabSize[1]*0.035)
		get_child(0).get_child(1).get_child(7).get_child(1).get_child(0).add_theme_font_size_override("font_size", 8)
		get_child(0).get_child(1).get_child(7).get_child(1).get_child(1).custom_minimum_size = Vector2(self.tabSize[0]*0.05,self.tabSize[1]*0.01)
		get_child(0).get_child(1).get_child(7).get_child(1).get_child(2).custom_minimum_size = Vector2(self.tabSize[0]*0.05,self.tabSize[1]*0.035)
		get_child(0).get_child(1).get_child(7).get_child(1).get_child(2).add_theme_font_size_override("font_size", 8)
		
		#get_child(0).get_child(0).custom
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if self.pull_and_plot:
		# Although we only check line1 for updating al lines, thats okay because all lines will have same number of points
		if self.line1.points.size() > int(get_child(0).get_child(1).get_child(0).get_child(0).custom_minimum_size[0]/2):
			self.line1.points = updatePoints(true, self.line1.points,1)
			self.line2.points = updatePoints(true, self.line2.points,2)
			self.line3.points = updatePoints(true, self.line3.points,3)
			self.line4.points = updatePoints(true, self.line4.points,4)
			self.line5.points = updatePoints(true, self.line5.points,5)
			self.line6.points = updatePoints(true, self.line6.points,6)
			self.line7.points = updatePoints(true, self.line7.points,7)
			self.line8.points = updatePoints(true, self.line8.points,8)
		else:
			self.line1.points = updatePoints(false, self.line1.points,1)
			self.line2.points = updatePoints(false, self.line2.points,2)
			self.line3.points = updatePoints(false, self.line3.points,3)
			self.line4.points = updatePoints(false, self.line4.points,4)
			self.line5.points = updatePoints(false, self.line5.points,5)
			self.line6.points = updatePoints(false, self.line6.points,6)
			self.line7.points = updatePoints(false, self.line7.points,7)
			self.line8.points = updatePoints(false, self.line8.points,8)
			
 
func updatePoints(full: bool, points: PackedVector2Array, channel: int):
	if full:
		var new_line = PackedVector2Array()
		var count = 0
		for i in range(points.size()-int(get_child(0).get_child(1).get_child(0).get_child(0).custom_minimum_size[0]/2),points.size()):
			new_line.append(Vector2(2*(i-1),points[i][1]))
			count += 1
		new_line.append(Vector2(2*count,(2**self.ampMultipliers[channel-1])*float(LSL.pull_sample(0.5)[channel-1])+(get_child(0).get_child(1).get_child(0).get_child(0).custom_minimum_size[1]/2)))
		return new_line
	else:
		var new_line = PackedVector2Array()
		var count = 0
		for i in range(0,points.size()):
			new_line.append(Vector2(2*(i-1),points[i][1]))
			count += 1
		new_line.append(Vector2(2*count,(2**self.ampMultipliers[channel-1])*float(LSL.pull_sample(0.5)[channel-1])+(get_child(0).get_child(1).get_child(0).get_child(0).custom_minimum_size[1]/2)))
		return new_line


func _on_stream_button_button_down():
	if LSL.has_stream_inlet():
		self.pull_and_plot = true
	else:
		print("No Stream Connected")
	pass # Replace with function body.


func _on_channel_1_plus_button_down():
	self.ampMultipliers[0] += 0.5
	pass # Replace with function body.


func _on_channel_1_minus_button_down():
	self.ampMultipliers[0] -= 0.5
	pass # Replace with function body.


func _on_channel_2_plus_button_down():
	self.ampMultipliers[1] += 0.5
	pass # Replace with function body.


func _on_channel_2_minus_button_down():
	self.ampMultipliers[1] -= 0.5
	pass # Replace with function body.


func _on_channel_3_plus_button_down():
	self.ampMultipliers[2] += 0.5
	pass # Replace with function body.


func _on_channel_3_minus_button_down():
	self.ampMultipliers[2] -= 0.5
	pass # Replace with function body.


func _on_channel_4_plus_button_down():
	self.ampMultipliers[3] += 0.5
	pass # Replace with function body.


func _on_channel_4_minus_button_down():
	self.ampMultipliers[3] -= 0.5
	pass # Replace with function body.


func _on_channel_5_plus_button_down():
	self.ampMultipliers[4] += 0.5
	pass # Replace with function body.


func _on_channel_5_minus_button_down():
	self.ampMultipliers[4] -= 0.5
	pass # Replace with function body.


func _on_channel_6_plus_button_down():
	self.ampMultipliers[5] += 0.5
	pass # Replace with function body.


func _on_channel_6_minus_button_down():
	self.ampMultipliers[5] -= 0.5
	pass # Replace with function body.


func _on_channel_7_plus_button_down():
	self.ampMultipliers[6] += 0.5
	pass # Replace with function body.


func _on_channel_7_minus_button_down():
	self.ampMultipliers[6] -= 0.5
	pass # Replace with function body.


func _on_channel_8_plus_button_down():
	self.ampMultipliers[7] += 0.5
	pass # Replace with function body.


func _on_channel_8_minus_button_down():
	self.ampMultipliers[7] -= 0.5
	pass # Replace with function body.
