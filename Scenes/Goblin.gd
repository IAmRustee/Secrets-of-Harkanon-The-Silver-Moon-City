extends CharacterBody2D


var SPEED = 150

@onready var target =$"../Player"
@onready var amimated_sprite = $AnimatedSprite2D
func _physics_process(delta:):
	var direction=(target.position-position).normalized()
	velocity=direction * SPEED
	look_at(target.position)
	amimated_sprite.play("idle")
	move_and_slide()
