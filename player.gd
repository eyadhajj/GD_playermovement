extends CharacterBody2D

var run_speed = 350

func get_input():
	velocity.x = 0
	velocity.y = 0  # Reset both X and Y velocity
	var input_vector = Vector2()

	if Input.is_action_pressed('move_right'):
		input_vector.x += 1
	if Input.is_action_pressed('move_left'):
		input_vector.x -= 1
	if Input.is_action_pressed('move_up'):
		input_vector.y -= 1
	if Input.is_action_pressed('move_down'):
		input_vector.y += 1

	# Normalize input_vector if it's not zero to avoid diagonal speed boost
	if input_vector.length() > 0:
		input_vector = input_vector.normalized()

	# Set the velocity based on input_vector and run_speed
	velocity = input_vector * run_speed

func _physics_process(_delta):
	get_input()
	move_and_slide()
