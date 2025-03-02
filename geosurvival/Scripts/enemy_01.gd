extends CharacterBody2D

var health = 3

@onready var player = get_node("/root/Game/Player")
@onready var hit_flash_animation_player = $AnimationPlayer
var speed = 50

@warning_ignore("unused_parameter")
func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()

func take_damage():
	health -= 1
	hit_flash_animation_player.play("hit_flash")
	if health == 0:
		queue_free()
		const explosion_scene = preload("res://Scenes/explosion.tscn")
		var explosion = explosion_scene.instantiate()
		explosion.emitting = true
		get_parent().add_child(explosion)
		explosion.global_position = global_position
