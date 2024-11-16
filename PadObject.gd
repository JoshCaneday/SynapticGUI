extends MarginContainer

var guiNode

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Called when our mouse is hovering over the boundaries of this Pad (Tab but on the side)
func _on_mouse_entered():
	self.guiNode.hoverSides(self)


