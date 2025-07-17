extends Node2D

func _ready() -> void:
	$ChapterStart_mp3.play()


func _on_chapter_start_mp_3_finished() -> void:
	get_tree().change_scene_to_file("res://Assets/Scenes/level1.tscn")
