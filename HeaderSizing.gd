extends MarginContainer

var parentSize: Vector2 # Not actually direct parent but the parent that we need to keep track of to determine sizing. (MarginContainer so grandparent)

var header
var leftPadding
var projectNameBox
var projectName
var middlePadding
var helpButtonBox
var helpButton
var middlePadding2
var openTabButtonBox
var openTabButton
var middlePadding3
var connectButtonBox
var connectButton
var middlePadding4
var rightPadding

var Xheader = 1 # In the X dimension, the header takes up 100% of the parentSize's X dimension
# Below dimensions are ratios of the above (the sum of these should never surpass 1, but it  can be less than 1)
var XleftPadding = 0.05 # In the X dimension, the leftPadding takes up 5% of the header's X dimension
var XprojectNameBox = 0.1
var XmiddlePadding = 0.05
var XhelpButtonBox = 0.1
var XmiddlePadding2 = 0.01
var XopenTabButtonBox = 0.1
var XmiddlePadding3 = 0.01
var XconnectButtonBox = 0.1
var XmiddlePadding4 = 0 # This is here in case I want to add more buttons in the header later
var XrightPadding = 0


var Yheader = 0.05
# Below dimensions are ratios of the above
var YleftPadding = 0.8 # Should be noted that for paddings which you can't see, the Y dimension doesn't matter if we are in a HBoxContainer because we add items horizontally and thus does nothin
var YprojectNameBox = 0.8
var YmiddlePadding = 0.8
var YhelpButtonBox = 0.5
var YmiddlePadding2 = 0.8
var YopenTabButtonBox = 0.5
var YmiddlePadding3 = 0.8
var YconnectButtonBox = 0.5
var YmiddlePadding4 = 0.8
var YrightPadding = 0.8

# Called when the node enters the scene tree for the first time.
func _ready():
	self.header = self
	self.leftPadding = find_child("LeftPadding",true)
	self.projectNameBox = find_child("ProjectNameBox",true)
	self.projectName = find_child("ProjectName",true)
	self.middlePadding = find_child("MiddlePadding",true)
	self.helpButtonBox = find_child("HelpButtonBox",true)
	self.helpButton = find_child("HelpButton",true)
	self.middlePadding2 = find_child("MiddlePadding2",true)
	self.openTabButtonBox = find_child("OpenTabButtonBox",true)
	self.openTabButton = find_child("OpenTabButton",true)
	self.middlePadding3 = find_child("MiddlePadding3",true)
	self.connectButtonBox = find_child("ConnectButtonBox",true)
	self.connectButton = find_child("ConnectButton",true)
	self.middlePadding4 = find_child("MiddlePadding4",true)
	self.rightPadding = find_child("RightPadding",true)

func updateDims():
	self.header.custom_minimum_size = Vector2(Xheader*parentSize[0],Yheader*parentSize[1])
	var headerSize = self.header.custom_minimum_size
	self.leftPadding.custom_minimum_size = Vector2(XleftPadding*headerSize[0],YleftPadding*headerSize[1])
	self.projectNameBox.custom_minimum_size = Vector2(XprojectNameBox*headerSize[0],YprojectNameBox*headerSize[1])
	self.projectName.add_theme_font_size_override("font_size", min(self.projectNameBox.custom_minimum_size[0]/3,self.projectNameBox.custom_minimum_size[1]/2))
	self.middlePadding.custom_minimum_size = Vector2(XmiddlePadding*headerSize[0],YmiddlePadding*headerSize[1])
	self.helpButtonBox.custom_minimum_size = Vector2(XhelpButtonBox*headerSize[0],YhelpButtonBox*headerSize[1])
	self.helpButton.add_theme_font_size_override("font_size", min(self.helpButtonBox.custom_minimum_size[0]/6,self.helpButtonBox.custom_minimum_size[1]/1.2))
	self.middlePadding2.custom_minimum_size = Vector2(XmiddlePadding2*headerSize[0],YmiddlePadding2*headerSize[1])
	self.openTabButtonBox.custom_minimum_size = Vector2(XopenTabButtonBox*headerSize[0],YopenTabButtonBox*headerSize[1])
	self.openTabButton.add_theme_font_size_override("font_size", min(self.openTabButtonBox.custom_minimum_size[0]/6,self.openTabButtonBox.custom_minimum_size[1]/1.2))
	self.middlePadding3.custom_minimum_size = Vector2(XmiddlePadding3*headerSize[0],YmiddlePadding3*headerSize[1])
	self.connectButtonBox.custom_minimum_size = Vector2(XconnectButtonBox*headerSize[0],YconnectButtonBox*headerSize[1])
	self.connectButton.add_theme_font_size_override("font_size", min(self.connectButtonBox.custom_minimum_size[0]/6,self.connectButtonBox.custom_minimum_size[1]/1.2))
	self.middlePadding4.custom_minimum_size = Vector2(XmiddlePadding4*headerSize[0],YmiddlePadding4*headerSize[1])
	self.rightPadding.custom_minimum_size = Vector2(XrightPadding*headerSize[0],YrightPadding*headerSize[1])
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
