extends MarginContainer

var tabSize

var pull_and_plot = false

var XplotBox = 0.7
var XchannelNameBox = 0.1
var XchannelPlus = 0.05
var XmiddlePadding = 0.05
var XchannelMinus = 0.05

var YplotBox = 0.08
var YchannelNameBox = 0.08
var YchannelPlus = 0.035
var YmiddlePadding = 0.01
var YchannelMinus = 0.035

var XstreamButton = 0.9
var YstreamButton = 0.05

var streamButton

var line1
var line2
var line3
var line4
var line5
var line6
var line7
var line8

var plotBox1
var plotBox2
var plotBox3
var plotBox4
var plotBox5
var plotBox6
var plotBox7
var plotBox8

var plotBackground1
var plotBackground2
var plotBackground3
var plotBackground4
var plotBackground5
var plotBackground6
var plotBackground7
var plotBackground8

var channel1Plus
var channel2Plus
var channel3Plus
var channel4Plus
var channel5Plus
var channel6Plus
var channel7Plus
var channel8Plus

var channel1Minus
var channel2Minus
var channel3Minus
var channel4Minus
var channel5Minus
var channel6Minus
var channel7Minus
var channel8Minus

var middlePadding1
var middlePadding2
var middlePadding3
var middlePadding4
var middlePadding5
var middlePadding6
var middlePadding7
var middlePadding8

var channelNameBox1
var channelNameBox2
var channelNameBox3
var channelNameBox4
var channelNameBox5
var channelNameBox6
var channelNameBox7
var channelNameBox8

var channelName1
var channelName2
var channelName3
var channelName4
var channelName5
var channelName6
var channelName7
var channelName8

var ampMultipliers = [0, 0, 0, 0, 0, 0, 0, 0]
# Called when the node enters the scene tree for the first time.
func _ready():
	self.streamButton = find_child("StreamButton",true)
	
	self.line1 = find_child("Line1",true)
	self.line2 = find_child("Line2",true)
	self.line3 = find_child("Line3",true)
	self.line4 = find_child("Line4",true)
	self.line5 = find_child("Line5",true)
	self.line6 = find_child("Line6",true)
	self.line7 = find_child("Line7",true)
	self.line8 = find_child("Line8",true)
	
	self.plotBox1 = find_child("PlotBox1",true)
	self.plotBox2 = find_child("PlotBox2",true)
	self.plotBox3 = find_child("PlotBox3",true)
	self.plotBox4 = find_child("PlotBox4",true)
	self.plotBox5 = find_child("PlotBox5",true)
	self.plotBox6 = find_child("PlotBox6",true)
	self.plotBox7 = find_child("PlotBox7",true)
	self.plotBox8 = find_child("PlotBox8",true)
	
	self.plotBackground1 = find_child("PlotBackground1",true)
	self.plotBackground2 = find_child("PlotBackground2",true)
	self.plotBackground3 = find_child("PlotBackground3",true)
	self.plotBackground4 = find_child("PlotBackground4",true)
	self.plotBackground5 = find_child("PlotBackground5",true)
	self.plotBackground6 = find_child("PlotBackground6",true)
	self.plotBackground7 = find_child("PlotBackground7",true)
	self.plotBackground8 = find_child("PlotBackground8",true)
	
	self.channel1Plus = find_child("Channel1Plus",true)
	self.channel2Plus = find_child("Channel2Plus",true)
	self.channel3Plus = find_child("Channel3Plus",true)
	self.channel4Plus = find_child("Channel4Plus",true)
	self.channel5Plus = find_child("Channel5Plus",true)
	self.channel6Plus = find_child("Channel6Plus",true)
	self.channel7Plus = find_child("Channel7Plus",true)
	self.channel8Plus = find_child("Channel8Plus",true)
	
	self.channel1Minus = find_child("Channel1Minus",true)
	self.channel2Minus = find_child("Channel2Minus",true)
	self.channel3Minus = find_child("Channel3Minus",true)
	self.channel4Minus = find_child("Channel4Minus",true)
	self.channel5Minus = find_child("Channel5Minus",true)
	self.channel6Minus = find_child("Channel6Minus",true)
	self.channel7Minus = find_child("Channel7Minus",true)
	self.channel8Minus = find_child("Channel8Minus",true)
	
	self.middlePadding1 = find_child("MiddlePadding1",true)
	self.middlePadding2 = find_child("MiddlePadding2",true)
	self.middlePadding3 = find_child("MiddlePadding3",true)
	self.middlePadding4 = find_child("MiddlePadding4",true)
	self.middlePadding5 = find_child("MiddlePadding5",true)
	self.middlePadding6 = find_child("MiddlePadding6",true)
	self.middlePadding7 = find_child("MiddlePadding7",true)
	self.middlePadding8 = find_child("MiddlePadding8",true)
	
	self.channelNameBox1 = find_child("ChannelNameBox1",true)
	self.channelNameBox2 = find_child("ChannelNameBox2",true)
	self.channelNameBox3 = find_child("ChannelNameBox3",true)
	self.channelNameBox4 = find_child("ChannelNameBox4",true)
	self.channelNameBox5 = find_child("ChannelNameBox5",true)
	self.channelNameBox6 = find_child("ChannelNameBox6",true)
	self.channelNameBox7 = find_child("ChannelNameBox7",true)
	self.channelNameBox8 = find_child("ChannelNameBox8",true)
	
	self.channelName1 = find_child("ChannelName1",true)
	self.channelName2 = find_child("ChannelName2",true)
	self.channelName3 = find_child("ChannelName3",true)
	self.channelName4 = find_child("ChannelName4",true)
	self.channelName5 = find_child("ChannelName5",true)
	self.channelName6 = find_child("ChannelName6",true)
	self.channelName7 = find_child("ChannelName7",true)
	self.channelName8 = find_child("ChannelName8",true)
	
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
	resize()
	
func resize():
	if tabSize:
		
		self.streamButton.custom_minimum_size = Vector2(self.tabSize[0]*self.XstreamButton,self.tabSize[1]*self.YstreamButton)
		self.streamButton.add_theme_font_size_override("font_size", min(self.streamButton.custom_minimum_size[0]/3,self.streamButton.custom_minimum_size[1]/2))
		
		self.plotBox1.custom_minimum_size = Vector2(self.tabSize[0]*self.XplotBox,self.tabSize[1]*self.YplotBox)
		self.channelNameBox1.custom_minimum_size = Vector2(self.tabSize[0]*self.XchannelNameBox,self.tabSize[1]*self.YchannelNameBox)
		self.channelName1.add_theme_font_size_override("font_size", min(self.channelNameBox1.custom_minimum_size[0]/3,self.channelNameBox1.custom_minimum_size[1]/2))
		self.channel1Plus.custom_minimum_size = Vector2(self.tabSize[0]*self.XchannelPlus,self.tabSize[1]*self.YchannelPlus)
		self.middlePadding1.custom_minimum_size = Vector2(self.tabSize[0]*self.XmiddlePadding,self.tabSize[1]*self.YmiddlePadding)
		self.channel1Minus.custom_minimum_size = Vector2(self.tabSize[0]*self.XchannelMinus,self.tabSize[1]*self.YchannelMinus)
	
		self.plotBox2.custom_minimum_size = Vector2(self.tabSize[0]*self.XplotBox,self.tabSize[1]*self.YplotBox)
		self.channelNameBox2.custom_minimum_size = Vector2(self.tabSize[0]*self.XchannelNameBox,self.tabSize[1]*self.YchannelNameBox)
		self.channelName2.add_theme_font_size_override("font_size", min(self.channelNameBox2.custom_minimum_size[0]/3,self.channelNameBox2.custom_minimum_size[1]/2))
		self.channel2Plus.custom_minimum_size = Vector2(self.tabSize[0]*self.XchannelPlus,self.tabSize[1]*self.YchannelPlus)
		self.middlePadding2.custom_minimum_size = Vector2(self.tabSize[0]*self.XmiddlePadding,self.tabSize[1]*self.YmiddlePadding)
		self.channel2Minus.custom_minimum_size = Vector2(self.tabSize[0]*self.XchannelMinus,self.tabSize[1]*self.YchannelMinus)
		
		self.plotBox3.custom_minimum_size = Vector2(self.tabSize[0]*self.XplotBox,self.tabSize[1]*self.YplotBox)
		self.channelNameBox3.custom_minimum_size = Vector2(self.tabSize[0]*self.XchannelNameBox,self.tabSize[1]*self.YchannelNameBox)
		self.channelName3.add_theme_font_size_override("font_size", min(self.channelNameBox3.custom_minimum_size[0]/3,self.channelNameBox3.custom_minimum_size[1]/2))
		self.channel3Plus.custom_minimum_size = Vector2(self.tabSize[0]*self.XchannelPlus,self.tabSize[1]*self.YchannelPlus)
		self.middlePadding3.custom_minimum_size = Vector2(self.tabSize[0]*self.XmiddlePadding,self.tabSize[1]*self.YmiddlePadding)
		self.channel3Minus.custom_minimum_size = Vector2(self.tabSize[0]*self.XchannelMinus,self.tabSize[1]*self.YchannelMinus)
		
		self.plotBox4.custom_minimum_size = Vector2(self.tabSize[0]*self.XplotBox,self.tabSize[1]*self.YplotBox)
		self.channelNameBox4.custom_minimum_size = Vector2(self.tabSize[0]*self.XchannelNameBox,self.tabSize[1]*self.YchannelNameBox)
		self.channelName4.add_theme_font_size_override("font_size", min(self.channelNameBox4.custom_minimum_size[0]/3,self.channelNameBox4.custom_minimum_size[1]/2))
		self.channel4Plus.custom_minimum_size = Vector2(self.tabSize[0]*self.XchannelPlus,self.tabSize[1]*self.YchannelPlus)
		self.channel4Plus.add_theme_font_size_override("font_size", min(self.channel4Plus.custom_minimum_size[0]/5,self.channel4Plus.custom_minimum_size[1]/4))
		self.middlePadding4.custom_minimum_size = Vector2(self.tabSize[0]*self.XmiddlePadding,self.tabSize[1]*self.YmiddlePadding)
		self.channel4Minus.custom_minimum_size = Vector2(self.tabSize[0]*self.XchannelMinus,self.tabSize[1]*self.YchannelMinus)
		self.channel4Minus.add_theme_font_size_override("font_size", min(self.channel4Minus.custom_minimum_size[0]/5,self.channel4Minus.custom_minimum_size[1]/4))
		
		self.plotBox5.custom_minimum_size = Vector2(self.tabSize[0]*self.XplotBox,self.tabSize[1]*self.YplotBox)
		self.channelNameBox5.custom_minimum_size = Vector2(self.tabSize[0]*self.XchannelNameBox,self.tabSize[1]*self.YchannelNameBox)
		self.channelName5.add_theme_font_size_override("font_size", min(self.channelNameBox5.custom_minimum_size[0]/3,self.channelNameBox5.custom_minimum_size[1]/2))
		self.channel5Plus.custom_minimum_size = Vector2(self.tabSize[0]*self.XchannelPlus,self.tabSize[1]*self.YchannelPlus)
		self.middlePadding5.custom_minimum_size = Vector2(self.tabSize[0]*self.XmiddlePadding,self.tabSize[1]*self.YmiddlePadding)
		self.channel5Minus.custom_minimum_size = Vector2(self.tabSize[0]*self.XchannelMinus,self.tabSize[1]*self.YchannelMinus)
		
		self.plotBox6.custom_minimum_size = Vector2(self.tabSize[0]*self.XplotBox,self.tabSize[1]*self.YplotBox)
		self.channelNameBox6.custom_minimum_size = Vector2(self.tabSize[0]*self.XchannelNameBox,self.tabSize[1]*self.YchannelNameBox)
		self.channelName6.add_theme_font_size_override("font_size", min(self.channelNameBox6.custom_minimum_size[0]/3,self.channelNameBox6.custom_minimum_size[1]/2))
		self.channel6Plus.custom_minimum_size = Vector2(self.tabSize[0]*self.XchannelPlus,self.tabSize[1]*self.YchannelPlus)
		self.middlePadding6.custom_minimum_size = Vector2(self.tabSize[0]*self.XmiddlePadding,self.tabSize[1]*self.YmiddlePadding)
		self.channel6Minus.custom_minimum_size = Vector2(self.tabSize[0]*self.XchannelMinus,self.tabSize[1]*self.YchannelMinus)
		
		self.plotBox7.custom_minimum_size = Vector2(self.tabSize[0]*self.XplotBox,self.tabSize[1]*self.YplotBox)
		self.channelNameBox7.custom_minimum_size = Vector2(self.tabSize[0]*self.XchannelNameBox,self.tabSize[1]*self.YchannelNameBox)
		self.channelName7.add_theme_font_size_override("font_size", min(self.channelNameBox7.custom_minimum_size[0]/3,self.channelNameBox7.custom_minimum_size[1]/2))
		self.channel7Plus.custom_minimum_size = Vector2(self.tabSize[0]*self.XchannelPlus,self.tabSize[1]*self.YchannelPlus)
		self.middlePadding7.custom_minimum_size = Vector2(self.tabSize[0]*self.XmiddlePadding,self.tabSize[1]*self.YmiddlePadding)
		self.channel7Minus.custom_minimum_size = Vector2(self.tabSize[0]*self.XchannelMinus,self.tabSize[1]*self.YchannelMinus)
		
		self.plotBox8.custom_minimum_size = Vector2(self.tabSize[0]*self.XplotBox,self.tabSize[1]*self.YplotBox)
		self.channelNameBox8.custom_minimum_size = Vector2(self.tabSize[0]*self.XchannelNameBox,self.tabSize[1]*self.YchannelNameBox)
		self.channelName8.add_theme_font_size_override("font_size", min(self.channelNameBox8.custom_minimum_size[0]/3,self.channelNameBox8.custom_minimum_size[1]/2))
		self.channel8Plus.custom_minimum_size = Vector2(self.tabSize[0]*self.XchannelPlus,self.tabSize[1]*self.YchannelPlus)
		self.middlePadding8.custom_minimum_size = Vector2(self.tabSize[0]*self.XmiddlePadding,self.tabSize[1]*self.YmiddlePadding)
		self.channel8Minus.custom_minimum_size = Vector2(self.tabSize[0]*self.XchannelMinus,self.tabSize[1]*self.YchannelMinus)

		
		#print(self.plotBox1.size)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if self.pull_and_plot:
		# Although we only check line1 for updating al lines, thats okay because all lines will have same number of points
		if self.line1.points.size() > int(self.plotBox1.custom_minimum_size[0]/2):
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
		for i in range(points.size()-int(self.plotBox1.custom_minimum_size[0]/2),points.size()):
			new_line.append(Vector2(2*(i-1),points[i][1]))
			count += 1
		new_line.append(Vector2(2*count,(2**self.ampMultipliers[channel-1])*float(LSL.pull_sample(0.5,1)[channel-1])+(self.plotBox1.custom_minimum_size[1]/2)))
		return new_line
	else:
		var new_line = PackedVector2Array()
		var count = 0
		for i in range(0,points.size()):
			new_line.append(Vector2(2*(i-1),points[i][1]))
			count += 1
		new_line.append(Vector2(2*count,(2**self.ampMultipliers[channel-1])*float(LSL.pull_sample(0.5,1)[channel-1])+(self.plotBox1.custom_minimum_size[1]/2)))
		return new_line


func _on_stream_button_button_down():
	if LSL.has_stream_inlet(1):
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
