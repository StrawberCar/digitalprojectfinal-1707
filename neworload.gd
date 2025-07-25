extends Control




func _on_load_pressed() -> void:
	pass


func _on_new_pressed() -> void:
	GameStateService.new_game()
	get_tree().change_scene_to_file("res://Assets/Scenes/charselect.tscn")
