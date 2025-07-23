extends Area2D



func _on_area_entered(area: Area2D) -> void:
	$PressE.show()




func _on_body_exited(body: Node2D) -> void:
	$PressE.hide()
