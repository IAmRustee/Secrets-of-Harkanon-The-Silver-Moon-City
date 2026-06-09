extends CharacterBody2D

var player = null
const SPEED = 175.0
var Player_Attack = true
@onready var amimated_sprite = $AnimatedSprite2D
@onready var animation_player = $HandActor/Sprite2D/SwordSwing2D/AnimationPlayer
@onready var sword_anim = $HandActor/Sprite2D/SwordAnmin
var is_attacking = false
func _physics_process(_delta: float) -> void:
	Player_Movement(_delta)

func Player_Movement(_delta):
	velocity = Vector2.ZERO

	# Movement
	if Input.is_action_pressed("Move_right"):
		velocity.x += SPEED

	if Input.is_action_pressed("Move_left"):
		velocity.x -= SPEED

	if Input.is_action_pressed("Move_down"):
		velocity.y += SPEED

	if Input.is_action_pressed("Move_up"):
		velocity.y -= SPEED

	# Movement animation
	if velocity != Vector2.ZERO:
		amimated_sprite.play("run")
	else:
		amimated_sprite.play("idle")

	# Attack
	if Input.is_action_pressed("Attack"):
		animation_player.play("SwordSlash")
		sword_anim.play("swordSwing")
		$HandActor/Sprite2D/HitArea2D/Hitarea.disabled = false
	else:
		$HandActor/Sprite2D/HitArea2D/Hitarea.disabled = true
	move_and_slide()

	
func _ready():
	var hitbox = get_node_or_null("$HandActor/Sprite2D/HitArea2D/Hitarea")

	if hitbox:
		$HandActor/Sprite2D/HitArea2D/Hitarea.disabled = false
	else:
		print("Hitbox not found!")
	for child in get_children():
		print(child.name)
	
