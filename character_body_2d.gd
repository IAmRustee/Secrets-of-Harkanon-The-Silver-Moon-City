extends CharacterBody2D


@onready var enemy = preload("res://Scenes/Goblins.tscn")
var enemy_counter := 0
func _on_timer_timeout() -> void:
	var  ene = enemy.instantiate()
	ene.position = position
	get_parent().get_node("Goblin").add_child(ene)


func spawn_enemy():
	if enemy_counter >= 5:
		return

	if enemy:
		var enemy_instance = enemy.instantiate()
		add_child(enemy_instance)
		enemy_counter += 1
		print("Enemy spawned! Total: ", enemy_counter)
