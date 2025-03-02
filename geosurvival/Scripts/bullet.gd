extends Area2D

var travelled_distance = 0

func _physics_process(delta: float) -> void:
	const speed = 250
	const max_range = 1000
	var direction = Vector2.UP.rotated(rotation)
	position += direction * speed * delta
	travelled_distance += speed * delta
	if travelled_distance > max_range:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
	
