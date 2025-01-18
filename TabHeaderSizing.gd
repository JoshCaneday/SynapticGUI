extends MarginContainer

var parentSize: Vector2 # Not actually direct parent but the parent that we need to keep track of to determine sizing. (MarginContainer so grandparent)

var header
var leftPadding
var tabNameBox
var tabName
var middlePadding
var dragButtonBox
var dragButton
var middlePadding2
var exitButtonBox
var exitButton
var rightPadding

var Xheader = 1 # In the X dimension, the header takes up 100% of the parentSize's X dimension
# Below dimensions are ratios of the above (the sum of these should never surpass 1, but it  can be less than 1)
var XleftPadding = 0.05
var XtabNameBox = 0.4
var XmiddlePadding = 0.4
var XdragButtonBox = 0.05
var XmiddlePadding2 = 0.01
var XexitButtonBox = 0.05
var XrightPadding = 0.0


var Yheader = 0.05
# Below dimensions are ratios of the above
var YleftPadding = 0.8
var YtabNameBox = 1
var YmiddlePadding = 0.8
var YdragButtonBox = 0.8
var YmiddlePadding2 = 0.8
var YexitButtonBox = 1
var YrightPadding = 0.8

# Called when the node enters the scene tree for the first time.
func _ready():
	self.header = self
	self.leftPadding = find_child("LeftPadding",true)
	self.tabNameBox = find_child("TabNameBox",true)
	self.tabName = find_child("TabName",true)
	self.middlePadding = find_child("MiddlePadding",true)
	self.dragButtonBox = find_child("DragButtonBox",true)
	self.dragButton = find_child("DragButton",true)
	self.middlePadding2 = find_child("MiddlePadding2",true)
	self.exitButtonBox = find_child("ExitButtonBox",true)
	self.exitButton = find_child("ExitButton",true)
	self.rightPadding = find_child("RightPadding",true)
	
	pass # Replace with function body.

func updateDims():
	self.header.custom_minimum_size = Vector2(Xheader*parentSize[0],Yheader*parentSize[1])
	var headerSize = self.header.custom_minimum_size
	self.leftPadding.custom_minimum_size = Vector2(XleftPadding*headerSize[0],YleftPadding*headerSize[1])
	self.tabNameBox.custom_minimum_size = Vector2(XtabNameBox*headerSize[0],YtabNameBox*headerSize[1])
	self.tabName.add_theme_font_size_override("font_size", min(self.tabNameBox.custom_minimum_size[0]/3,self.tabNameBox.custom_minimum_size[1]/2))
	self.middlePadding.custom_minimum_size = Vector2(XmiddlePadding*headerSize[0],YmiddlePadding*headerSize[1])
	self.dragButtonBox.custom_minimum_size = Vector2(XdragButtonBox*headerSize[0],YdragButtonBox*headerSize[1])
	self.dragButton.add_theme_font_size_override("font_size", min(self.dragButtonBox.custom_minimum_size[0]/3,self.dragButtonBox.custom_minimum_size[1]/1))
	self.middlePadding2.custom_minimum_size = Vector2(XmiddlePadding2*headerSize[0],YmiddlePadding2*headerSize[1])
	self.exitButtonBox.custom_minimum_size = Vector2(XexitButtonBox*headerSize[0],YexitButtonBox*headerSize[1])
	self.exitButton.add_theme_font_size_override("font_size", min(self.exitButtonBox.custom_minimum_size[0]/3,self.exitButtonBox.custom_minimum_size[1]/1))
	self.rightPadding.custom_minimum_size = Vector2(XrightPadding*headerSize[0],YrightPadding*headerSize[1])
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
