extends CharacterBody2D

# how fast the enemy is
const speed = 100
# wether the enemy is in the Detection Area
var player_chase = false
# when player exit the player _chase will be false
var player = null
# this shit is the brokem part idk how to make the enemy go idle when starting the game
@onready var amimated_sprite = $AnimatedSprite2D
@onready var _hp_progress_bar: ProgressBar = %HPProgressBar


func _ready():
	player_chase = false
	$AnimatedSprite2D.play("idle")
	print("Started idle")


func _physics_process(delta):

	if player_chase and player != null:

		var direction = (player.position - position).normalized()

		position += direction * speed * delta

		# Only change to Run if not already playing
		if $AnimatedSprite2D.animation != "Run":
			$AnimatedSprite2D.play("Run")

		# Flip sprite (exactly what it says)
		if direction.x < 0:
			$AnimatedSprite2D.flip_h = true
		elif direction.x > 0:
			$AnimatedSprite2D.flip_h = false

	else:
		velocity.x = 0
		velocity.y = 0
		amimated_sprite.play("idle")
	move_and_slide()


func _on_detection_area_body_entered(body):

	print("Something entered: ", body.name)

	if body.is_in_group("player"):
		player = body
		player_chase = true

func _on_detection_area_body_exited(_body):

		player = null
		player_chase = false
func take_damage(amount: int) -> void:
	_hp_progress_bar.value = max(0, _hp_progress_bar.value - amount)
	if _hp_progress_bar.value == 0:
		queue_free()
	$AnimatedSprite2D.play("hit")
	print("Enemy hit!")
	
	
