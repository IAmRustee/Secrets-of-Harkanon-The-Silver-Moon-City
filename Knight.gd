extends CharacterBody2D


const SPEED = 300.0
@onready var amimated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	Player_Movement(delta)
	
func Player_Movement(delta):
	
	if Input.is_action_pressed("Move_right"):
		velocity.x = SPEED
		amimated_sprite.play("run")
		velocity.y = 0
	elif Input.is_action_pressed("Move_left"):
		velocity.x = -SPEED
		velocity.y = 0
		amimated_sprite.play("run")
	elif Input.is_action_pressed("Move_down"):
		velocity.y = SPEED
		velocity.x = 0
		amimated_sprite.play("run")
	elif Input.is_action_pressed("Move_up"):
		velocity.y = -SPEED
		velocity.x = 0
		amimated_sprite.play("run")
		
	else:
		velocity.x = 0
		velocity.y = 0
		amimated_sprite.play("idle")
	move_and_slide()
