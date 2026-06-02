extends Node2D
@onready var player = get_tree().get_first_node_in_group("player")
@onready var enemy = preload("res://Scenes/Goblins.tscn")


var enemy_counter := 0
@export var max_enemies := 5

func _on_timer_timeout() -> void:
	var enemies = get_tree().get_nodes_in_group("enemy")

	if enemies.size() < max_enemies:
		spawn_enemy()

	$Timer.wait_time = randf_range(2.0, 3.0)

func spawn_enemy():
	var ene = enemy.instantiate()

	var offset = Vector2(
		randf_range(-100, 100),
		randf_range(-100, 100)
	)

	ene.global_position = global_position + offset
	get_tree().current_scene.add_child(ene)

	enemy_counter += 1
	
func _on_respawn_timer_timeout():
	var enemies = get_tree().get_nodes_in_group("enemy")

	if enemies.is_empty():
		for i in range(max_enemies):
			spawn_enemy()
