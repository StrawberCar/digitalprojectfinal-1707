extends Sprite2D

func _ready() -> void:
	pressbutton()
	
func pressbutton():
	for i in range(2):
		$".".texture = load("res://Assets/Images/SpeechBubble/E/speechbubble1.png")
		await get_tree().create_timer(0.5).timeout
		$".".texture = load("res://Assets/Images/SpeechBubble/E/speechbubble2.png")
	await get_tree().create_timer(0.5).timeout
	pressbutton()
