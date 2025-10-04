extends CharacterBody3D

enum {IDLE,WALK,RIGHT,LEFT}
var curAnim = IDLE
@onready var green = $Camera3D/MeshInstance3D2
@onready var light = $Characteranimtest/rig/Skeleton3D/BoneAttachment3D/SpotLight3D
@onready var pivot = $Characteranimtest
@onready var anim_tree = $Characteranimtest/AnimationTree
@export var player_input: bool = true
@export var player_gravity: bool = true
@export var player_interaction: bool = true
@export var rotation_speed = 12.0
@onready var key_low = $Characteranimtest/rig/Skeleton3D/key/key_low
@onready var hand = $Characteranimtest/rig/Skeleton3D/hand/hand
@onready var floppydisk = $Characteranimtest/rig/Skeleton3D/floppy/floopydisk

func jump():
	anim_tree.set("parameters/Jump/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
func _ready() -> void:
	hand.visible = false
	key_low.visible = false
	floppydisk.visible = false
	var test = get_collision_mask_value(1)
	print(test, "player1")
	var test2 = get_collision_mask_value(7)
	print(test2, "player2")
const SPEED = 8.0
const HORIZONTAL_ACC = 2.0
const JUMP_VELOCITY = 5
var current_speed_x: float
var current_speed_z: float
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Nightvision"):
		if green.visible == true:
			green.visible = false
		elif green.visible == false:
			green.visible = true
	if Input.is_action_just_pressed("Flashlight"):
		if light.visible == true:
			light.visible = false
		elif light.visible == false:
			light.visible = true
	if player_gravity != false:
		_player_gravity(delta)
	if player_input != false:
		_movement_input(delta)
	if player_input == false:
		velocity.x = move_toward(velocity.x, 0, SPEED * delta * 2)
		velocity.z = move_toward(velocity.z, 0, SPEED * delta * 2)
		anim_tree.set("parameters/BlendSpace1D/blend_position", velocity.length()/ SPEED)
		anim_tree.set("parameters/WalkSapeed/scale", velocity.length() / SPEED)
	move_and_slide()
	
func _player_gravity(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta

func _movement_input(delta):

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
		anim_tree.set("parameters/BlendSpace1D/blend_position", velocity.length()/ SPEED)
		anim_tree.set("parameters/WalkSpeed/scale", velocity.length() / SPEED)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * delta * 2)
		velocity.z = move_toward(velocity.z, 0, SPEED * delta * 2)
		anim_tree.set("parameters/BlendSpace1D/blend_position", velocity.length()/ SPEED)
		anim_tree.set("parameters/WalkSapeed/scale", velocity.length() / SPEED)
	if velocity.length() == 0:
		curAnim = IDLE
	if direction != Vector3.ZERO:
		pivot.rotation.y = lerp_angle(pivot.rotation.y, atan2(direction.x, direction.z), delta * rotation_speed)
	
