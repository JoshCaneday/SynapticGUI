extends MarginContainer

var dragged = false
var guiNode
var isGhost = true
var contentHolder = null

var networkTab
var timeseriesTab

# Called when the node enters the scene tree for the first time.
func _ready():
	self.networkTab = preload("res://networkTab.tscn")
	self.timeseriesTab = preload("res://timeseriesTab.tscn")
	self.contentHolder = find_child("Content", true)
	# Cause the "leftPadding" and "rightPadding" margin containers to expand as far as possible to center the actual content of the tab
	get_child(1).get_child(1).get_child(0).size_flags_horizontal = Control.SIZE_EXPAND
	get_child(1).get_child(1).get_child(2).size_flags_horizontal = Control.SIZE_EXPAND
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
# Called when we press the exit button on the tab
func _on_exit_button_button_up():
	var parent = get_parent() # Retreive the parent of the tab
	if parent.get_child_count() == 3: # If we are onto our last child(not counting left and right padding, lets just delete the entire row
		parent.queue_free()
	else: # Else lets just delete the tab, not the whole row
		queue_free()

# Called when press the drag button DOWN
func _on_drag_button_button_down():
	self.dragged = true # Set the var to true so we know that we are currently in the state of dragging the tab
	position -= Vector2(9000,9000) # Just puts the tab off screen until we let go of the button where it comes back
	self.guiNode.dragStart(self) # Call the GUI.gd scripts function giving the parameter of this tab (node) as input

# Called when we stop pressing the drag button
func _on_drag_button_button_up():
	self.dragged = false # Set to false as we are now done dragging
	self.guiNode.dragEnd() # Call the GUI.gd scripts function
	position += Vector2(9000,9000) # Bring the original tab back to position

# Called when our mouse enters the boundaries of the tab
func _on_mouse_entered():
	# If this is a real tab ( not a ghost tab which is one that appears when dragging) call this function as this will be the tab that we are hovering over
	if not isGhost and self.guiNode.dragging:
		self.guiNode.setHoveringTab(self)

# Called when our mouse exits the boundaries of the tab
func _on_mouse_exited():
	pass # Replace with function body.

func convertToNetworkTab():
	var newContent = networkTab.instantiate()
	newContent.tabSize = custom_minimum_size
	newContent.resize()
	self.contentHolder.add_child(newContent)

func convertToTimeseriesTab():
	var newContent = timeseriesTab.instantiate()
	newContent.tabSize = custom_minimum_size
	newContent.resize()
	self.contentHolder.add_child(newContent)

func _on_tab_name_item_selected(index):
	if self.contentHolder.get_child_count() != 0:
			self.contentHolder.get_child(0).queue_free()
			await get_tree().process_frame
	if index == 1:
		convertToNetworkTab()
	elif index == 2:
		convertToTimeseriesTab()
	

