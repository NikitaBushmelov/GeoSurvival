extends CharacterBody2D

var movement_speed = 100
var health = 100.0
signal health_depleted

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity = direction * movement_speed
	move_and_slide()
	const damage_taken = 5.0
	var overlapping_enemies = %HurtBox.get_overlapping_bodies()
	if overlapping_enemies.size() > 0:
		health -= damage_taken * overlapping_enemies.size() * delta
		%ProgressBar.value = health
		if health <= 0.0:
			health_depleted.emit()
