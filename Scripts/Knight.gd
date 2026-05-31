extends CharacterBody2D

var player = null
const SPEED = 175.0
var Player_Attack = true
@onready var amimated_sprite = $AnimatedSprite2D
var is_attacking = false
func _physics_process(_delta: float) -> void:
	Player_Movement(_delta)

func Player_Movement(_delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("Move_right"):
		velocity.x = SPEED
		amimated_sprite.play("run")
		$AnimatedSprite2D/HitArea2D/Hitarea.disabled = true

	elif Input.is_action_pressed("Move_left"):
		velocity.x = -SPEED
		amimated_sprite.play("run")
		$AnimatedSprite2D/HitArea2D/Hitarea.disabled = true

	elif Input.is_action_pressed("Move_down"):
		velocity.y = SPEED
		amimated_sprite.play("run")
		$AnimatedSprite2D/HitArea2D/Hitarea.disabled = true

	elif Input.is_action_pressed("Move_up"):
		velocity.y = -SPEED
		amimated_sprite.play("run")
		$AnimatedSprite2D/HitArea2D/Hitarea.disabled = true

	elif Input.is_action_pressed("Attack"):
		amimated_sprite.play("Attack")
		$AnimatedSprite2D/HitArea2D/Hitarea.disabled = false
	

	else:
			amimated_sprite.play("idle")
			$AnimatedSprite2D/HitArea2D/Hitarea.disabled = true

	move_and_slide()

	
func _ready():
	var hitbox = get_node_or_null("AnimatedSprite2D/HitArea2D/Hitarea")

	if hitbox:
		$AnimatedSprite2D/HitArea2D/Hitarea.disabled = false
	else:
		print("Hitbox not found!")
	for child in get_children():
		print(child.name)
	
