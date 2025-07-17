extends Node2D

func _process(delta: float) -> void:
	if Global.spinmenuportals:
		moveboat()
		fadeout()

func moveboat():
	$platform1/CollisionPolygon2D.disabled = true
	$platform1/CollisionPolygon2D2.disabled = true
	$platform1/CollisionPolygon2D3.disabled = true
	Global.spinmenuportals = false
	for i in range(400):
		$CharacterBody2D.position.x -= 1
		$Boat.position.x -= 1
		await get_tree().create_timer(0.001).timeout

func fadeout():
	await get_tree().create_timer(3).timeout
	$OverlayAnim.show()
	$OverlayAnim/AnimationPlayer.play("Fade")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_file("res://Assets/Scenes/charselect.tscn")
