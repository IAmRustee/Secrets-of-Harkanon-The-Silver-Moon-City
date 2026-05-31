extends CharacterBody2D

var player = null
const SPEED = 175.0
var Player_Attack = true
@onready var amimated_sprite = $AnimatedSprite2D
var is_attacking = false
func _physics_process(_delta: float) -> void:
	Player_Movement(_delta)

func Player_Movement(_delta):
	
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
	elif Input.is_action_pressed("Attack"):
		amimated_sprite.play("Attack")
		get_node("CollisionShape2D").disabled = false 
	else:
		velocity.x = 0
		velocity.y = 0
		amimated_sprite.play("idle")
	move_and_slide()
	
func _ready() -> void:
	get_node("CollisionShape2D").disabled = false
