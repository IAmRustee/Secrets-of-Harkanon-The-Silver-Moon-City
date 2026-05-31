extends Node2D


@onready var _animation_player: AnimationPlayer = $AnimationPlayer


func take_damage(_amount: int) -> void:
	print("Enemy hit!")
	_animation_player.play("hit")
