extends Node3D
var playback : AnimationNodeStateMachinePlayback
var is_open := false
@export var door_locked: bool
@export var door_handprint: bool
@export var door_passcode: bool
@export var door_disk: bool
@onready var padlock = %padlock_low
func _ready():
	playback = $AnimationTree.get("parameters/playback")

func toggle(_body):
	is_open = not is_open
	if is_open:
		playback.travel("Open Door")
	else:
		playback.travel("Close Door")


func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Open Door":
		$Door/Hitbox/CollisionShape3D.disabled = true
	else:
		$Door/Hitbox/CollisionShape3D.disabled = false
	


func _on_static_body_3d_interacted(body: Variant) -> void:
	if self.door_locked != true and self.door_handprint != true and door_passcode != true and door_disk != true:
		toggle(self)# Replace with function body.
	if self.door_locked:
		if %DialogueController.key_collected:
			padlock.visible = false
			toggle(self)
		else:
			%DialogueController._dialog.display_line("The door is locked. Upon inspecting the padlock, you see the manufacturer's stamp on it. [br]Despite it being weak enough to break with your hands, your [pulse freq=1.0 color=#FF0000 ease=-2.0]programming[/pulse] prevents you from doing so. [br] You will need to find the [pulse freq=1.0 color=#FF0000 ease=-2.0]key[/pulse].", "Locked Door")
	if self.door_handprint:
		if %DialogueController.hand_collected:
			toggle(self)
		else:
			%DialogueController._dialog.display_line("This door has a genetic recognition system attached, and needs a [pulse freq=1.0 color=#FF0000 ease=-2.0]handprint[/pulse] to open it. [br] You should search the area for any genetic material that would suffice.", "Handprint Sensor Door")
	if self.door_passcode:
		if %DialogueController.passcode_collected:
			toggle(self)
		else:
			%DialogueController._dialog.display_line("This door requires a [pulse freq=1.0 color=#FF0000 ease=-2.0]password[/pulse] to open it. You do not know this password.", "Passcode door")
	if self.door_disk:
		if %DialogueController.disk_collected:
			%DialogueController._dialog.display_line("You open the door, venturing into the rest of the facility.", "Disk door")
			await %DialogueController._dialog.dialogue_continue
			%DialogueController._dialog.display_line("You have reached the end of this demo! Thank you for playing.", "")
		else:
			%DialogueController._dialog.display_line("This door has a slot for a floppy disk to be inserted. It won't open without it.", "Disk door")
