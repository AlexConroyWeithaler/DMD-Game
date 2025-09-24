extends CharacterBody3D

enum {IDLE,WALK,RIGHT,LEFT}
var curAnim = IDLE
@onready var pivot = $Characteranimtest
@onready var anim_tree = $Characteranimtest/AnimationTree
@export var rotation_speed = 12.0
func handle_animations():
	match curAnim:
		IDLE:
			anim_tree.set("parameters/Movement/transition_request", "Idle")
		WALK: 
			anim_tree.set("parameters/Movement/transition_request", "Walk")
func jump():
	anim_tree.set("parameters/Jump/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
func _ready() -> void:
	var test = get_collision_mask_value(1)
	print(test, "player1")
	var test2 = get_collision_mask_value(7)
	print(test2, "player2")
const SPEED = 6.0
const HORIZONTAL_ACC = 2.0
const JUMP_VELOCITY = 5
var current_speed_x: float
func _physics_process(delta: float) -> void:
	handle_animations()
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		curAnim = WALK
		print(velocity.length())
		anim_tree.set("parameters/BlendSpace1D/blend_position", velocity.length()/ SPEED)
		anim_tree.set("parameters/WalkSpeed/scale", velocity.length() / SPEED)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * delta)
		velocity.z = move_toward(velocity.z, 0, SPEED * delta)
		print(velocity.length())
		anim_tree.set("parameters/BlendSpace1D/blend_position", velocity.length()/ SPEED)
		anim_tree.set("parameters/WalkSapeed/scale", velocity.length() / SPEED)
	if velocity.length() == 0:
		curAnim = IDLE
	if direction != Vector3.ZERO:
		pivot.rotation.y = lerp_angle(pivot.rotation.y, atan2(direction.x, direction.z), delta * rotation_speed)
	move_and_slide()
