extends CharacterBody2D

# how fast the enemy is
const speed = 100
# wether the enemy is in the Detection Area
var player_chase = false
# idk what i did i make it and it work
var player = null
# this shit is the broken part idk how to make the enemy go idle when starting the game
func _ready():
	$AnimatedSprite2D.play("idle")
	player_chase = false
	


func _physics_process(delta):

	if player_chase and player != null:

		var direction = (player.position - position).normalized()
		
		position += direction * speed * delta

		# Only change to Run  (im dying at the moment lolz)
		if $AnimatedSprite2D.animation != "Run":
			$AnimatedSprite2D.play("Run")

		# Flip sprite to other side if player goes on its right or left (exactly what it says oWo)
		if direction.x < 0:
			$AnimatedSprite2D.flip_h = true
		elif direction.x > 0:
			$AnimatedSprite2D.flip_h = false

	else:

		# Only change to idle  ( I NEED SLEEP FAHHHHHHHHHHHHHH)
		if $AnimatedSprite2D.animation != "idle":
			$AnimatedSprite2D.play("idle")


func _on_detection_area_body_entered(body):
		player = body
		player_chase = true

func _on_detection_area_body_exited(_body):

		player = null
		player_chase = false

	
