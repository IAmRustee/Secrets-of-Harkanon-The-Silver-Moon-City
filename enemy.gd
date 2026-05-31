extends Node2D
# how fast the enemy is
const speed = 100
# wether the enemy is in the Detection Area
var player_chase = false
# when player exit the player _chase will be false
var player = null
# this shit is the brokem part idk how to make the enemy go idle when starting the game
@onready var amimated_sprite = $AnimatedSprite2D

@onready var _animation_player: AnimationPlayer = $AnimationPlayer


func take_damage(_amount: int) -> void:
	print("Enemy hit!")
	_animation_player.play("hit")





func _ready():
	player_chase = false
	print("Started idle")


func _physics_process(delta):

	if player_chase and player != null:

		var direction = (player.position - position).normalized()

		position += direction * speed * delta







func _on_detection_area_body_entered(body):

	print("Something entered: ", body.name)

	if body.is_in_group("player"):
		player = body
		player_chase = true

func _on_detection_area_body_exited(body):

		player = null
		player_chase = false
