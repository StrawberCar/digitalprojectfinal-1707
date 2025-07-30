extends Area2D

const HORIZONTAL_OFFSET := 50
const MOVE_SPEED := 2.0

var start_position: Vector2
var time_passed := 0.0

func _ready() -> void:
	start_position = position

	match Global.classchosen:
		1:
			$SpriteSprite.texture = load("res://Assets/Images/Astarlion.png")
			$ArrowSPRITE.texture = load("res://Assets/Images/arrows/astararrow.png")
			$SpriteSprite.scale = Vector2(0.249, 0.255)
		2:
			$SpriteSprite.texture = load("res://Assets/Images/MasterFeast-1.png.png")
			$ArrowSPRITE.texture = load("res://Assets/Images/arrows/masterarrow.png")
			$SpriteSprite.scale = Vector2(0.781, 0.767)
		3:
			$SpriteSprite.texture = load("res://Assets/Images/simbyote.png")
			$ArrowSPRITE.texture = load("res://Assets/Images/arrows/symarrow.png")
			$SpriteSprite.scale = Vector2(0.249, 0.255)

func _process(delta: float) -> void:
	time_passed += delta
	position.x = start_position.x + sin(time_passed * MOVE_SPEED) * HORIZONTAL_OFFSET
