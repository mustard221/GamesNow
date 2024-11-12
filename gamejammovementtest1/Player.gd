extends CharacterBody2D

enum GRAV_DIR {
	DOWN,
}

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var grav = 1

var grav_dir = GRAV_DIR.DOWN

func _physics_process(delta: float) -> void:	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta*grav

	# Handle jump.
	if Input.is_action_just_pressed("JUMP") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if Input.is_action_just_pressed("SWITCH"):
		#Changes Gravity
		grav = -grav
		match grav_dir:
			GRAV_DIR.DOWN:
				up_direction = Vector2.UP
		velocity += -up_direction * grav
			
		
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("LEFT", "RIGHT")
	if direction:
		if direction > 0:
			$Sprite2D.scale.x = 0.2
		else:
			$Sprite2D.scale.x = -0.2
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
