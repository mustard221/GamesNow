extends CharacterBody2D


enum GRAV_DIR {
	DOWN,
}

@onready var anim = get_node("AnimationPlayer")

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var grav = 1
var is_flipped = false
var grav_dir = GRAV_DIR.DOWN
var collect = 0

@onready var part_label = %collect


func _physics_process(delta: float) -> void:	
	
	if is_on_ceiling():
		velocity -= get_gravity() * delta*grav
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta*grav
		
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("LEFT", "RIGHT")
	if direction:
		if direction > 0:
			#print(velocity.y)
			#print(velocity.x)
			$AnimatedSprite2D.scale.x = 0.2
		else:
			$AnimatedSprite2D.scale.x = -0.2
		velocity.x = direction * SPEED
		if velocity.y == 0:
			anim.play("Walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		anim.play("Idle")
	if velocity.y > 0:
		anim.play("Fall") 

	if Input.is_action_just_pressed("SWITCH"):
			#Changes Gravity
			grav = -grav
			match grav_dir:
				GRAV_DIR.DOWN:
					up_direction = Vector2.UP
			velocity += -up_direction * grav
			
	if Input.is_action_just_pressed("SWITCH"):
		is_flipped = !is_flipped
		
		if is_flipped:
			$AnimatedSprite2D.scale.y = -0.2
		else:
			$AnimatedSprite2D.scale.y = 0.2
			
	if position.y > 1000 or position.y < -100:
		get_tree().change_scene_to_file("res://death.tscn")

	# Handle jump.
	if Input.is_action_just_pressed("JUMP") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	elif Input.is_action_just_pressed("JUMP") and is_on_ceiling():
		velocity.y = JUMP_VELOCITY*grav
		
	if velocity.y < 0:
		anim.play("Jump")
		
	move_and_slide()
		

func _on_item_2_body_entered(body: Node2D) -> void:
	collect = collect + 1 
	print(collect)
	part_label.text = "Parts Collected: " + str(collect)
	if collect == 5:
		part_label.text = "Get Back To The Ship!!!"
		get_parent().get_node("Wall").queue_free()
		

func _on_item_1_body_entered(body: Node2D) -> void:
	collect = collect + 1 
	print(collect)
	part_label.text = "Parts Collected: " + str(collect)
	if collect == 5:
		part_label.text = "Get Back To The Ship!!!"
		get_parent().get_node("Wall").queue_free()
