extends Node
@onready var door_opened = false
@onready var hand_collected = false
@onready var passcode_collected = false
@onready var key_collected = false
@onready var key = %key_low
@onready var disk_collected = false
@onready var _dialog = %DialogueBox
func _ready():
	_dialog.display_line("[shake rate=20.0 level=5 connected=1][pulse freq=1.0 color=#FF0000 ease=-2.0]ERROR:[/pulse] Memory processor damaged.[/shake][br][shake rate=20.0 level=5 connected=1][pulse freq=1.0 color=#FF0000 ease=-2.0]ERROR:[/pulse] Critical systems damaged.[/shake][br][shake rate=20.0 level=5 connected=1][pulse freq=1.0 color=#FF0000 ease=-2.0]ERROR:[/pulse] Heavy damage from: [pulse freq=1.0 color=#FF0000 ease=-2.0](FALLING)[/pulse] has been sustained in the [pulse freq=1.0 color=#FF0000 ease=-2.0](HEAD)[/pulse] module.[/shake] [br][br] RECCOMMENDATION: Search surroundings for assistance, or tools for repair. Gather information, Enforcer.", "SYSTEM:")
	await _dialog.dialogue_continue
	_dialog.display_line("Recommendation: Activate night vision mode. Press (N) to see in the dark.[br]Press (F) to turn on your flashlight.", "")


func _on_static_body_3d_interacted(body: Variant) -> void:
	if door_opened == false:
		_dialog.display_line("You summon up some of your strength not taken by the fall, and force the rusted door open.", "Deteriorated Door")
		await _dialog.dialogue_continue
		_dialog.display_line("The way is now clear.", "Open door")
	door_opened = true


func _on_postbox_2_interacted(body: Variant) -> void:
	_dialog.display_line("The nameplate on the mailbox reads 'Citizen of the Year!' [br] Inside the mailbox is assorted junk mail, primarily containing advertisements.", "Mail Box: Marvin Hyde, Citizen of the Year")
	await _dialog.dialogue_continue
	_dialog.display_line("The more recent mail seems to all be opened, with the letters being reminders on how to ration food, and reassurances that more supplies will be arriving soon.", "Mail Box: Marvin Hyde, Citizen of the Year") # Replace with function body.


func _on_postbox_interacted(body: Variant) -> void:
	_dialog.display_line("Inside the mailbox are many advertisements, as well as requests from one 'Eric Ellis' to 'return the vending machines to the communal hallway'.", "Mailbox: Lewis Downs, Neighborhood Watch") # Replace with function body.


func _on_postbox_4_interacted(body: Variant) -> void:
	_dialog.display_line("The mailbox is filled with letters containing both advertisements, and letters containing many expletives, with overwhelming consensus for the resident to get the senders more food.", "Mail Box: Eunice Morrison, Neighborhood Chef")
	await _dialog.dialogue_continue
	_dialog.display_line("Of note, most of these letters have been sent by one 'Lewis Downs'. [br] After a certain point, the letters from Lewis stop, and the frequency between the other letters decreases.", "Mail Box: Eunice Morrison, Neighborhood Chef") # Replace with function body.


func _on_postbox_3_interacted(body: Variant) -> void:
	_dialog.display_line("Inside the mailbox are requests for one 'Eric Ellis' to do something about Eunice Morrison hoarding all the food, and more requests asking Eric to deal with Lewis Downs stealing the vending machines shortly afterwards.", "Mailbox: Eric Ellis, Neighborhood Manager") # Replace with function body.


func _on_computer1_interacted(body: Variant) -> void:
	_dialog.display_line("You scan through all of the files on the computer. Of note is a conversation between two people, in a messaging application seemingly hard-coded into the computer.", "Computer")
	await _dialog.dialogue_continue
	_dialog.display_line("Marvin Hyde: You told me to talk to you a bit ago. What's this about? [br] Eunice Morrison: Lewis is planning to kill me. [br] Marvin Hyde: ? [br] Eunice Morrison: He threatened me earlier - He's planning something. Thinks I'm hoarding all the food. I need your help.", "Computer")
	await _dialog.dialogue_continue
	_dialog.display_line("Marvin Hyde: Lewis wouldn't do that - He's meant to have a record of all the food in the neighborhood, right?? [br] Eunice Morrison: I don't know. He thinks I'm hoarding it - He ran out of food credits. I think he was one of the people in the upper 5%, so he got less than us. [br]Marvin Hyde: ..So, what do you think we do?", "Computer")
	await _dialog.dialogue_continue
	_dialog.display_line("Eunice Morrison: Meet me at lights out today. Eric's out at a meeting tomorrow, so we won't be interrupted. The code is [pulse freq=1.0 color=#FF0000 ease=-2.0]'trustno1'[/pulse]. I have an enforcer bot with me.", "Computer")
	passcode_collected = true # Replace with function body.


func _on_brokencomputer_interacted(body: Variant) -> void:
	_dialog.display_line("It seems that this computer was smashed in a fit of erratic emotion. [br] It's motherboard is cracked; No useful information will be able to be gleaned.", "Broken Computer") # Replace with function body.


func _on_kitchen_interacted(body: Variant) -> void:
	_dialog.display_line("There is a large amount of cooking utensils in here, as well as a small microwave within one of the cabinets. It looks purposefully hidden. [br]Many of the knives, specifically butcher knives, appear to have blood stains on them, and are dulled from cutting meat.", "Cabinets")
	await _dialog.dialogue_continue
	_dialog.display_line("There is an odd brown stain on the sink, barely perceptible. [br]Your scanners indicate a high iron content. [br] There is a 68% chance that it is [pulse freq=1.0 color=#FF0000 ease=-2.0]blood[/pulse].", "Sink")
	await _dialog.dialogue_continue
	_dialog.display_line("There are a few untouched meat-based parts here, of [pulse freq=1.0 color=#FF0000 ease=-2.0]human[/pulse] origin. Luckily, there is an untouched hand on the pile of half-destroyed parts, with a note next to it, reading: ", "Fridge")
	await _dialog.dialogue_continue
	_dialog.display_line("L's hand. Don't eat. Handprint door still works - Keep refrigerated.", "Note:")
	await _dialog.dialogue_continue
	_dialog.display_line("You take the hand. It could be useful.", "Fridge")
	%CharacterBody3D.hand.visible = true
	hand_collected = true # Replace with function body.


func _on_vendingmachine_interacted(body: Variant) -> void:
	_dialog.display_line("There are four vending machines here, one fallen over at the end with an open can resting on it. [br] There are scratch marks on the floor, as if all but one had been dragged into the room from elsewhere.", "Vending machine")
	await _dialog.dialogue_continue
	_dialog.display_line("Near one of the vending machines is a wooden baseball bat with nails set in it. There are hints of blood on the bat. [br] Near the can, there is a [pulse freq=1.0 color=#FF0000 ease=-2.0]key[/pulse]. [br]You take it.", "Vending machine")
	key.visible = false
	%CharacterBody3D.key_low.visible = true
	key_collected = true # Replace with function body.


func _on_portableheater_interacted(body: Variant) -> void:
	_dialog.display_line("It seems to be a portable heater. Any warmth that it bestowed to the room is long since gone.", "Portable Heater") # Replace with function body.


func _on_wreckage_interacted(body: Variant) -> void:
	_dialog.display_line("It seems that a makeshift barricade was made, before being forced open by something with similar strength as yourself.", "Debris") # Replace with function body.


func _on_case_interacted(body: Variant) -> void:
	_dialog.display_line("Inside the case is a .45 caliber revolver, and an envelope.", "Case")
	await _dialog.dialogue_continue
	_dialog.display_line("Inside the envelope is a letter addressed to 'Bunker Command'. It describes the madness that the '[pulse freq=1.0 color=#FF0000 ease=-2.0]lower class[/pulse]' has fallen to, and that the writer, '[pulse freq=1.0 color=#FF0000 ease=-2.0]Eric Ellis[/pulse]', plans to leave the neighborhood to move to one of the wealthier areas.", "Envelope")
	await _dialog.dialogue_continue
	_dialog.display_line("The letter seems to have been stamped, and returned, with a response saying that Eric was only in the upper 1% on the surface, and consequently is not allowed to move out of the lower-class neighborhood.", "Envelope")
	await _dialog.dialogue_continue
	_dialog.display_line("There is a [pulse freq=1.0 color=#FF0000 ease=-2.0]floppy disk[/pulse] on top of the case. It could be useful. You take it.", "Case")
	disk_collected = true
	%floopydisk.visible = false
	%CharacterBody3D.floppydisk.visible = true # Replace with function body.
