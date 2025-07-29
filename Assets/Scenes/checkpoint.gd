extends Area2D

var inarea

func _on_area_entered(area: Area2D) -> void:
	inarea = true
	$PressE.show()

func _on_area_exited(area: Area2D) -> void:
	inarea = false
	$PressE.hide()

func _process(delta: float) -> void:
	if inarea == true and Input.is_action_just_pressed("interact"):
		save()
		
	

func save():
	Global.save = true
