extends Line2D

var margin_container

func _ready():
	self.margin_container = get_parent()

func _process(delta):
	# Get the global bounds of the MarginContainer
	var container_bounds = margin_container.get_global_rect()
	
	# Clamp each point of the Line2D to the container bounds
	for i in range(points.size()):
		var global_point = to_global(points[i])
		global_point.x = clamp(global_point.x, container_bounds.position.x, container_bounds.position.x + container_bounds.size.x)
		global_point.y = clamp(global_point.y, container_bounds.position.y, container_bounds.position.y + container_bounds.size.y)
		points[i] = to_local(global_point)
