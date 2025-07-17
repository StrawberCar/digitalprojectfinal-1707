extends Sprite2D

func _ready() -> void:
	MoveUpAndDown()
	
func MoveUpAndDown():
	for i in range(5):
		$".".position.y -= 1
		await get_tree().create_timer(0.1).timeout
	for i in range(5):
		$".".position.y += 1
		await get_tree().create_timer(0.1).timeout
	MoveUpAndDown()
