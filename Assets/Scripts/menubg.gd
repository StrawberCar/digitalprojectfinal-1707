extends ParallaxBackground

@export var scroll_speed := Vector2(1.0, 0.0)

func _process(delta):
	# Moves background left-to-right automatically
	scroll_offset += scroll_speed * delta
