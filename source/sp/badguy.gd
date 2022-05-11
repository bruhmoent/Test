extends "res://source/sp/tux.gd"

func _ready() -> void:
	
	velocity.x = -speed.x
	

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	if is_on_wall():
		velocity.x *= -1.0
		velocity.y = move_and_slide(velocity, FLOOR_N).y
	else:
		move_and_slide(velocity, FLOOR_N)
		