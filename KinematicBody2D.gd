extends tux


func _physics_process(delta: float) -> void:
	var jump_interp: = Input.is_action_just_released("jump") and velocity.y < 0.0
	var direction: = get_direction()	
	velocity = jump_calc(velocity, direction, speed, jump_interp)
	velocity = move_and_slide(velocity, FLOOR_N)

func get_direction() -> Vector2:
	return Vector2(
	Input.get_action_raw_strength("move_right") - Input.get_action_raw_strength("move_left"), -1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 0.0	
	)
	
func jump_calc( linear_velocity: Vector2, 
				direction:Vector2, 
				speed:Vector2,
				jump_interp: bool 
				) -> Vector2:
	var fvelocity: = linear_velocity	
	fvelocity.x = speed.x * direction.x
	fvelocity.y += gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
		fvelocity.y = speed.y * direction.y
	if jump_interp == false:	
			fvelocity.y = fvelocity.y
	elif jump_interp == true: 
		fvelocity.y = 0.0
	return fvelocity
