extends VBoxContainer

var prevWindowSize
var screenWidth
var screenHeight
var numRows = 0
var numTabs = 0
var maxCols = 5 #This is defaultly set, basiccally, unless modified by the user, adding new tabs will at most go to 3 columns
var numCols = 0
var rowsLimit = 5
var colsLimit = 8 # Is actually 6 (colsLimit = this - 2) as it includes the invisible left and right pads so 8 columns - 2 pads = 6 real tabs
var TabScene
var PadScene

var originalScreenSize

# Called when the node enters the scene tree for the first time.
func _ready():
	var headerNode = find_child("Header",true) # Retrieve Header node
	var screenSize = DisplayServer.window_get_size()
	self.originalScreenSize = screenSize
	self.prevWindowSize = screenSize # Set this object var to our current screenSize, will need for _process function as we need to know when we change size of screen
	headerNode.parentSize = self.prevWindowSize
	headerNode.updateDims()
	self.screenWidth = screenSize.x - 0.1*screenSize.x # We subtract 10 percent of the width for the width of the left and right padding of each row
	self.screenHeight = screenSize.y - headerNode.custom_minimum_size.y #This is just subtracting the height of the header that will always be at the top of the UI
	self.TabScene = preload("res://Tab.tscn") # Load up the tab scene (think of prefabs from Unity if you have knowledge about that)
	self.PadScene = preload("res://Pad.tscn") # Load up the pad scene (think of prefabs from Unity if you have knowledge about that)
	
	# This will take the if statement in the createNewTab() function as this will be when there are currently new tabs
	#createNewTab() TODO make this a 'help" tab
	
		
func updateDims(garbageCollect = false):
	self.numRows = get_child_count()-1
	var temp = 0
	var curRow = 1
	var most = 0
	var flagReUpdate = false
	
	while curRow < get_child_count():
		most = max(most, get_child(curRow).get_child_count())
		curRow += 1
	self.numCols = most - 2 # Subtract two for the left and right padding in each of the rows
	curRow = 1
	var tab_size
	while curRow < get_child_count():
		var curCol = 0
		if get_child(curRow).get_child_count() == 2 and garbageCollect: # the garbageCollect parameter is passed if we are expecting to clean up unused rows
			get_child(curRow).queue_free()
			flagReUpdate = true
		elif garbageCollect:
			flagReUpdate = true
		while curCol < get_child(curRow).get_child_count():
			if get_child(curRow).get_child(curCol).get_index() == 0 or get_child(curRow).get_child(curCol).get_index() == get_child(curRow).get_child_count()-1:
				# Below if statement is only for the right padding, and thus is the farthest right child
				if get_child(curRow).get_child(curCol).get_index() == get_child(curRow).get_child_count()-1:
					# Expand the right padding as far as possible to detect hovering easier
					get_child(curRow).get_child(curCol).size_flags_horizontal = Control.SIZE_EXPAND | Control.SIZE_FILL
				# Only adapt the height to the number of rows, the width needs to stay constant
				get_child(curRow).get_child(curCol).custom_minimum_size = Vector2(0.05*self.originalScreenSize[0],(self.screenHeight / self.numRows))
				
			else:
				tab_size = Vector2((self.screenWidth / self.numCols),(self.screenHeight / self.numRows))
				get_child(curRow).get_child(curCol).custom_minimum_size = tab_size
				var header = get_child(curRow).get_child(curCol).find_child("HeaderBox",true)
				header.parentSize = tab_size
				header.updateDims()
				# update sizing of the actual content of the tab as well if it has content
				if get_child(curRow).get_child(curCol).get_child(1).get_child(1).get_child(1).get_child_count() > 0:
					var content = get_child(curRow).get_child(curCol).get_child(1).get_child(1).get_child(1).get_child(0)
					content.tabSize = tab_size
					content.resize()
			curCol += 1
		curRow += 1
	
	if flagReUpdate:
		await get_tree().process_frame  # Wait for deletions and any resizing to complete
		updateDims()  # Recalculate dimensions after deletions

	
		
		
# Called when we want a new tab in the UI for more information such as networking or plots (pressing the open button)
func createNewTab():
	
	# Only take this if statement if we currently have no tabs
	if self.numTabs == 0:
		self.numRows += 1 # Originally 0, now 1
		self.numCols += 1 # Originally 0, now 1
		self.numTabs += 1 # Originally 0, now 1
		
		# Create new row (Hbox)
		var new_row = HBoxContainer.new()
		new_row.add_theme_constant_override("separation",0)
		add_child(new_row) # Add it as child to the VBoxContainer
		
		# Padding needed for adding columns
		var leftPad = PadScene.instantiate() 
		var rightPad = PadScene.instantiate()
		
		# Necessary for the functions within this object for PadObject.gd script
		leftPad.guiNode = get_parent().get_parent()
		rightPad.guiNode = get_parent().get_parent()
		
		# Add these paddings as children of this newly made row
		new_row.add_child(leftPad)
		new_row.add_child(rightPad)
		
		# Set the respective colors of these paddings as invisible because they aren't meant to be seen
		var leftPadColorRect = leftPad.get_child(0)
		var rightPadColorRect = rightPad.get_child(0)
		leftPadColorRect.color = Color(1,1,1,0)
		rightPadColorRect.color = Color(1,1,1,0)
		
		# Create new column in this new row (MarginContainer)
		var tab_instance = TabScene.instantiate()
		
		# Add the tab instane as a child of the new row
		new_row.add_child(tab_instance)
		new_row.move_child(tab_instance,tab_instance.get_index()-1) # Make up for the left and right padding that each row has
		
		# Connect the exit button of the tab to call update dims whenever we delete(tree_exited) the tab
		var exitButton = tab_instance.find_child("ExitButton",true)
		await exitButton.tree_exited.connect(updateDims) # When we delete this newly created tab (in this case when we press x button) we reorganize the dims in case something has changed
		tab_instance.guiNode = get_parent().get_parent() # Set this objects variable so that it's functions can correctly run, some depend on this variable to be set
		tab_instance.isGhost = false # Make this objects variable false as it is not a ghost tab but rather a real tab
		tab_instance.get_child(0).color = Color(randf(),randf(),randf()) #TODO This can be removed later, just wanted to distinguish the tabs from eachother
		updateDims() # After adding this new tab lets update the dimensions
	
	# This will happen any time we do NOT have no tabs already
	else:
		
		var curRow = 1 # Begin at index 1 as we want to skip the header
		var new_row = null # Initialize new row (more like cur row but reusing var to allieviate confusion)
		
		# Loop through all rows to find the row that does not have maximum amount of tabs in it
		while curRow < get_child_count() and get_child(curRow).get_child_count() == self.maxCols:
			curRow += 1
			
		# If the row that we are on is a new row, take this if statement
		if curRow == self.numRows+1:
			#print(self.numsRows,self.rowsLimit)
			if self.numRows+1 <= self.rowsLimit:
				self.numRows += 1
				new_row = HBoxContainer.new()
				new_row.add_theme_constant_override("separation",0)
				add_child(new_row)
				var leftPad = PadScene.instantiate()
				var rightPad = PadScene.instantiate()
				leftPad.guiNode = get_parent().get_parent()
				rightPad.guiNode = get_parent().get_parent()
				new_row.add_child(leftPad)
				new_row.add_child(rightPad)
				var leftPadColorRect = leftPad.get_child(0)
				var rightPadColorRect = rightPad.get_child(0)
				leftPadColorRect.color = Color(1,1,1,0)
				rightPadColorRect.color = Color(1,1,1,0)
			else:
				return
			
		# Else just set the row to the already made row
		else:
			new_row = get_child(curRow) # In this case its not really a new row, but im just going to use this variable
		# Added a tab
		self.numTabs += 1
		
		var tab_instance = TabScene.instantiate() # Instantiate copy of tab scene
		new_row.add_child(tab_instance) # Add it as child of the current row we are on
		new_row.move_child(tab_instance,tab_instance.get_index()-1) # Move the tab to the proper position
		
		var exitButton = tab_instance.find_child("ExitButton",true)
		exitButton.tree_exited.connect(updateDims) # When we delete this newly created tab (in this case when we press x button) we reorganize the dims in case something has changed
		tab_instance.guiNode = get_parent().get_parent() # This is important as many of the tab's object's scripts require this variable to be used in its functions
		tab_instance.isGhost = false # So as to not get confused with tabs that are duplicated and are considered ghost tabs
		tab_instance.get_child(0).color = Color(randf(),randf(),randf())
		updateDims() # Happens with each additional tab as we don't know what additional tab might create a new column (complicated)
		
		# Customize each of these tabs (TODO)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Check if window size has changed, if so update widths and heights of all tabs
	var curScreenSize = DisplayServer.window_get_size()
	if curScreenSize != self.prevWindowSize:
		var headerNode = find_child("Header",true)
		headerNode.parentSize = curScreenSize
		headerNode.updateDims()
		self.originalScreenSize = curScreenSize
		self.screenWidth = curScreenSize.x - 0.1*curScreenSize[0]
		self.screenHeight = curScreenSize.y - headerNode.custom_minimum_size.y
		self.prevWindowSize = curScreenSize
		updateDims()

# Called whenever the open button is pressed
func _on_open_button_button_up():
	createNewTab()


