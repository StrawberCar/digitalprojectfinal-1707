extends CharacterBody2D

var SPEED = 300.0
var JUMP_VELOCITY = -400.0
var GRAVITY = 980.0
var canmove = true

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor() and canmove == true:
		velocity.y += GRAVITY * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor() and canmove == true:
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	#if is_on_floor():
	if direction and canmove == true:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()



func _on_death_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	$".".position = Vector2(243.0, -34.0)



func _on_playportal_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	GRAVITY = 0.0
	velocity.y = 0.0
	JUMP_VELOCITY = 0.0
	SPEED = 0.0
	driveinboat()
	await get_tree().create_timer(1).timeout
	print("teleporting")
	
func driveinboat():
	Global.spinmenuportals = true
		
		
func _on_quitportal_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	GRAVITY = 0.0
	velocity.y = 0.0
	JUMP_VELOCITY = 0.0
	SPEED = 0.0
	get_tree().quit()
