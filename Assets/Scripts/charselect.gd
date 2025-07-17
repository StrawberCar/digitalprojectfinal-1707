extends Control

# Select Characters

func _on_char_1_pressed() -> void:
	Global.playerspeed = 5
	Global.playermana = 10
	Global.currentmana = 10
	Global.playerstrength = -1
	Global.classchosen = 1
	print(Global.playermana, " ", Global.playerspeed, " ", Global.playerstrength)
	get_tree().change_scene_to_file("res://Assets/Scenes/chapter_1intro.tscn")


func _on_char_2_pressed() -> void:
	Global.playerspeed = 3
	Global.playermana = 20
	Global.playerstrength = 0
	Global.currentmana = 20
	Global.classchosen = 2
	print(Global.playermana, " ", Global.playerspeed, " ", Global.playerstrength)
	get_tree().change_scene_to_file("res://Assets/Scenes/chapter_1intro.tscn")


func _on_char_3_pressed() -> void:
	Global.playerspeed = 2
	Global.playermana = 10
	Global.currentmana = 10
	Global.playerstrength = 1
	Global.classchosen = 3
	print(Global.playermana, " ", Global.playerspeed, " ", Global.playerstrength)
	get_tree().change_scene_to_file("res://Assets/Scenes/chapter_1intro.tscn")

# Learn more buttons

func _on_viewagility_pressed() -> void:
	get_tree().change_scene_to_file("res://Assets/Scenes/learnmoreagility.tscn")

func _on_viewmana_pressed() -> void:
	get_tree().change_scene_to_file("res://Assets/Scenes/learnmoremana.tscn")


func _on_viewstrength_pressed() -> void:
	get_tree().change_scene_to_file("res://Assets/Scenes/learnmoresimbiyote.tscn")
