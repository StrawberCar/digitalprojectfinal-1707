extends Node2D

func _ready() -> void:
	randomside()

func _on_area_2d_body_entered(body: Node2D) -> void:
	$Sprite2D.scale = Vector2(1.513, 1)



func _on_area_2d_body_exited(body: Node2D) -> void:
	$Sprite2D.scale = Vector2(1.513, 1.592)

func randomside():
	var side = randi_range(0, 1)
	if side == 1:
		$Sprite2D.flip_h = false
	else:
		$Sprite2D.flip_h = true
