extends ShapeCast3D

@onready var prompt = $prompt

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var test = get_collision_mask_value(1)
	print(test)
	var test2 = get_collision_mask_value(7)
	print(test2) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
func _physics_process(_delta):
	prompt.text = ""
	if is_colliding():
		var collider = get_collider(0)
		if collider is Interactable:
			prompt.text = collider.get_prompt()
			if Input.is_action_just_pressed("interact"):
				collider.interact(owner)
