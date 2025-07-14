extends CharacterBody3D

@export var speed = 14
@export var rotation_speed := 10.0 

var target_velocity = Vector3.ZERO


func _physics_process(delta):
	var direction = Vector3.ZERO
	if Input.is_action_just_pressed("Rechts"):
		direction.x += 5
	if Input.is_action_just_pressed("Links"):
		direction.x -= 5
	if Input.is_action_just_pressed("Achter"):
		direction.z += 5
	if Input.is_action_just_pressed("voor"):
		direction.z -= 5
	if Input.is_action_just_pressed("Op"):
		direction.y += 5
	if Input.is_action_just_pressed("Neer"):
		direction.y -= 5
	#Draai
	if Input.is_action_just_pressed("Draai_Links"):
		rotate_y(deg_to_rad(-rotation_speed))
	if Input.is_action_just_pressed("Draai_Rechts"):
		rotate_y(deg_to_rad(-rotation_speed))


	# Ground Velocity
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed
	target_velocity.y = direction.y * speed


	# Moving the Character
	velocity = target_velocity
	move_and_slide()
