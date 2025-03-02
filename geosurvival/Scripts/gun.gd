extends Area2D

func _ready():
	# Asegúrate de que el área esté en modo de monitoreo
	set_deferred("monitoring", true)
	
func _physics_process(delta: float) -> void:
	var enemies_in_range = get_overlapping_bodies()
	var closest_enemy: CharacterBody2D = null
	var closest_distance := INF
	
	for enemy in enemies_in_range:
		if enemy is CharacterBody2D:
			var distance = global_position.distance_to(enemy.global_position)
			if distance < closest_distance:
				closest_distance = distance
				closest_enemy = enemy
	if closest_enemy:
		look_at(closest_enemy.global_position)

func shoot():
	const bullet = preload("res://Scenes/bullet.tscn")
	var new_bullet = bullet.instantiate()
	new_bullet.global_position = %ShootingPivot.global_position
	new_bullet.global_rotation = %ShootingPivot.global_rotation
	%ShootingPivot.add_child(new_bullet)

func _on_timer_timeout() -> void:
	shoot()
