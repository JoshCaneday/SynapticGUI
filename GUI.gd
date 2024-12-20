extends CanvasLayer

# My Name is Joshua
var dragging = false
var ghostTab: MarginContainer = null
var mouse_position
var hoveringTab: MarginContainer = null
var draggingTab: MarginContainer = null

var isSide = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Each frame check if we are currently dragging a tab
	if dragging:
		# Get the current mouse position and if it the position has changed since the last frame update the tab we are dragging accordingly
		var temp_position = (get_viewport().get_mouse_position())
		if temp_position != self.mouse_position:
			ghostTab.position += temp_position - self.mouse_position
			self.mouse_position = temp_position # Reset the mouse position to the current position
	
# Called whenever a tab begins to get dragged, (Check TabObject.gd and function ("func _on_drag_button_button_down") for more info)
func dragStart(node: MarginContainer):
	self.draggingTab = node # Retrieve node of tab that we are going to be dragging
	var duplicated_node = node.duplicate() # Duplicate it, this is what we will see being dragged, I call it a ghost tab
	self.ghostTab = duplicated_node
	
	# Just makes sure we can't press the buttons on this duplicated ghost tab otehrwise problems occur
	self.ghostTab.find_child("ExitButton").mouse_filter = Control.MouseFilter.MOUSE_FILTER_IGNORE
	self.ghostTab.find_child("DragButton").mouse_filter = Control.MouseFilter.MOUSE_FILTER_IGNORE
	
	# Adds the ghost tab to the children of gui node
	add_child(duplicated_node)
	
	# Set the initial mouse position and move the ghost tab to this position along with a slight adjustment so it looks as if we are holding it by the button
	self.mouse_position = (get_viewport().get_mouse_position())
	self.ghostTab.position = self.mouse_position - Vector2(0.87*self.ghostTab.size.x,0)
	self.dragging = true # This needs to be true for the _process function
	
# Called whenever we stop dragging a tab that we were dragging (Check TabObject.gd and function ("func _on_drag_button_button_up") for more info)
func dragEnd():
	self.dragging = false # set to false as we are done dragging and don't need the ghost tab to follow anymore
	get_child(1).queue_free() # Delete the duplicated tab (It will always be this index, it should never not be this index)
	self.ghostTab = null # Done draging, so no more ghostTab
	
	# If we let go of the tab while it was hovering over the sides (essentially meaning the user wanted to add a column) take this if statement
	if self.isSide:
		
		# Set the sidebar hovering tab (the one that will highlight white when hovering over it) to invisible as we are done hovering over it
		self.hoveringTab.get_child(0).color = Color(1,1,1,0)
		
		# If the row that we are adding to is already at the max amount of columns and the tab is not already in that row, we increase the number of max columns
		if self.hoveringTab.get_parent().get_child_count() == get_child(0).get_child(1).maxCols and self.hoveringTab.get_parent() != self.draggingTab.get_parent():
			get_child(0).get_child(1).maxCols += 1
			
		if get_child(0).get_child(1).maxCols > get_child(0).get_child(1).colsLimit:
			get_child(0).get_child(1).maxCols -= 1
		else:
			# This just reorganizes the heirarchy of the tabs and containers(rows)
			var dragParent = self.draggingTab.get_parent()
			var hoverParent = self.hoveringTab.get_parent()
			var hoverTabChildIndex = self.hoveringTab.get_index()
			dragParent.remove_child(self.draggingTab)
			hoverParent.add_child(self.draggingTab)
			
			# This if-else statement handles where to move the dragged tab in relation to the hover tab depending on which side we dragged it to
			if hoverTabChildIndex == 0:
				hoverParent.move_child(self.draggingTab,1)
			else:
				hoverParent.move_child(self.draggingTab,self.draggingTab.get_index()-1)
			
	# Else if we let go of the tab while hovering over another tab (meaning we want to swap places of the tabs) take this if statement
	elif self.hoveringTab:
		#This just reorganizes the heirarchy of the tabs and containers(rows) and swaps the hover and drag tabs
		var dragParent = self.draggingTab.get_parent()
		var hoverParent = self.hoveringTab.get_parent()
		var hoverTabChildIndex = self.hoveringTab.get_index()
		var dragTabChildIndex = self.draggingTab.get_index()

		dragParent.remove_child(self.draggingTab)
		hoverParent.remove_child(self.hoveringTab)
		
		dragParent.add_child(self.hoveringTab)
		hoverParent.add_child(self.draggingTab)
		if dragTabChildIndex < hoverTabChildIndex:
			dragParent.move_child(self.hoveringTab,dragTabChildIndex)
			hoverParent.move_child(self.draggingTab,hoverTabChildIndex)
		else:
			hoverParent.move_child(self.draggingTab,hoverTabChildIndex)
			dragParent.move_child(self.hoveringTab,dragTabChildIndex)
	
	self.isSide = false # Reset this variable
	self.hoveringTab = null # We are done dragging, so therefore there is no tab we are hovering over to drop a dragged tab onto
	self.draggingTab = null # Same for this
	get_child(0).get_child(1).updateDims(true) # Goes to the TabController.gd script and updates the dims for any necessary changes that may have occured

# Called whenever we begin hovering over one of the sides (check the PadObject.gd script and function ("func _on_mouse_entered") for more info)
func hoverSides(node: MarginContainer):
	# If we are currently dragging a tab then take this if statement
	if dragging:
		# If we have a tab that we are hovering over and we were PREVIOUSLY hovering over a side(reset the side to invisible)
		if self.hoveringTab and self.isSide:
			self.hoveringTab.get_child(0).color = Color(1,1,1,0)
		self.hoveringTab = node # Update this with the current tab we are hovering over
		self.hoveringTab.get_child(0).color = Color(1,1,1,0.5) # Highlight the side with white
		self.isSide = true # Set this var to true as we are hovering over a side

func setHoveringTab(node: MarginContainer):
	
	# If we have a tab that we are hovering over and we were PREVIOUSLY hovering over a side(reset the side to invisible)
	if self.hoveringTab and self.isSide:
		self.hoveringTab.get_child(0).color = Color(1,1,1,0)
		
	self.hoveringTab = node # Update this with the current tab we are hovering over
	self.isSide = false # Set this var to false as we are not hovering over a side
