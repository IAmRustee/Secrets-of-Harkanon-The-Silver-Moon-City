extends Node2D
class_name HandActor
@export var default_direction = Vector2.RIGHT

func _process(delta):
	var cursor_position = get_global_mouse_position()
	var direction = cursor_position - global_position
	rotation = direction.angle()
