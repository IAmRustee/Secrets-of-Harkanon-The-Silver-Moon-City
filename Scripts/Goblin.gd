extends CharacterBody2D

const speed = 100

var player = null
var player_chase = false
var spawn_position: Vector2

@onready var animated_sprite = $AnimatedSprite2D
@onready var _hp_progress_bar: ProgressBar = %HPProgressBar


func _ready():
	spawn_position = global_position
	animated_sprite.play("idle")
	add_to_group("enemy")


func _physics_process(delta):

	if player_chase and player != null:
		# Chase player
		var direction = (player.global_position - global_position).normalized()

		position += direction * speed * delta

		if animated_sprite.animation != "Run":
			animated_sprite.play("Run")

		if direction.x < 0:
			animated_sprite.flip_h = true
		elif direction.x > 0:
			animated_sprite.flip_h = false


	else:
		# Go back to spawn point
		var distance = global_position.distance_to(spawn_position)

		if distance > 5:
			var direction = (spawn_position - global_position).normalized()
			velocity = direction * speed
			animated_sprite.play("Run")
		else:
			velocity = Vector2.ZERO
			animated_sprite.play("idle")
			


	move_and_slide()
func take_damage(amount: int) -> void:
	_hp_progress_bar.value -= amount

	if _hp_progress_bar.value <= 0:
		die()

	print("Enemy hit!")
func die():
	queue_free()

func _on_detection_area_body_entered(body):

	if body.is_in_group("player"):
		player = body
		player_chase = true
