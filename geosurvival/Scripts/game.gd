extends Node2D

func spawn_enemies():
	var new_enemy = preload("res://Scenes/enemy_01.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_enemy.global_position = %PathFollow2D.global_position
	add_child(new_enemy)


func _on_timer_timeout() -> void:
	spawn_enemies()


func _on_player_health_depleted() -> void:
	%GameOverScreen.Visible = true
	get_tree().paused = true
