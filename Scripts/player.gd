extends Node2D
var player = null
const DRAG_FACTOR := 15.0
const SPEED = 175.0

var _velocity := Vector2.ZERO

@onready var animation_player := %AnimationPlayer


func _physics_process(delta: float) -> void:
	var input_direction := Input.get_vector("Move_left", "Move_right", "Move_up", "Move_down")
	var desired_velocity := input_direction * SPEED
	var steering := desired_velocity - _velocity
	_velocity += steering * DRAG_FACTOR * delta
	translate(_velocity * delta)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Attack"):
		$AnimationPlayer.play("player")
