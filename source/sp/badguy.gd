extends "res://source/sp/tux.gd"
onready var stomp_area: Area2D = $StompDetecor

func _ready() -> void:
	
	velocity.x = -speed.x
	
func _on_StompDetecor_area_entered(area: Area2D) -> void:
	if get_node("/root/TestL/KinematicBody2D/EnemyDetector/CollisionShape2D").global_position.y < stomp_area.global_position.y:
		velocity.x = speed.x
		get_node("CollisionShape2D").disabled = true
		queue_free()
		return
func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	if is_on_wall():
		velocity.x *= -1.0
		velocity.y = move_and_slide(velocity, FLOOR_N).y
	else:
		move_and_slide(velocity, FLOOR_N)
		



