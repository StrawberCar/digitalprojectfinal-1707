extends Area2D

var inbody
var npc

func _on_area_entered(area: Area2D) -> void:
	if area.name == "NPC1":
		inbody = true
		npc = area.name
		




func _on_area_exited(area: Area2D) -> void:
		npc = null
		inbody = false


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		if Dialogic.current_timeline != null:
			return
		if npc == "NPC1":
			Dialogic.start('island1pirate1')
