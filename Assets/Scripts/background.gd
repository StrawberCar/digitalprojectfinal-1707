extends Sprite2D

var framenum = 1


func _ready() -> void:
	print(Global.leveltype)
	if Global.leveltype == "EyeCold":
		$".".texture = load("res://Assets/Images/LevelBG's/Eye/SnoweyEye1.png")
		eyecold()
	
	if Global.leveltype == "Forest":
		$AudioStreamPlayer2D.stream = load("res://Assets/Audio/JungleBattle.mp3")
		$".".texture = load("res://Assets/Images/LevelBG's/forest/forest1.png")
		Forest()
	
	startmusic()

func eyecold():
	await get_tree().create_timer(5).timeout
	for i in range(9):
		$".".texture = load("res://Assets/Images/LevelBG's/Eye/SnoweyEye" + str(framenum) + ".png")
		framenum += 1
		await get_tree().create_timer(0.3).timeout
	await get_tree().create_timer(5).timeout
	framenum -= 1
	for i in range(9):
		$".".texture = load("res://Assets/Images/LevelBG's/Eye/SnoweyEye" + str(framenum) + ".png")
		framenum -= 1
		await get_tree().create_timer(0.3).timeout
	await get_tree().create_timer(5).timeout
	framenum += 1
	eyecold()

func Forest():
	await get_tree().create_timer(5).timeout
	for i in range(4):
		$".".texture = load("res://Assets/Images/LevelBG's/forest/forest" + str(framenum) + ".png")
		framenum += 1
		await get_tree().create_timer(0.3).timeout
	await get_tree().create_timer(5).timeout
	framenum -= 1
	for i in range(4):
		$".".texture = load("res://Assets/Images/LevelBG's/forest/forest" + str(framenum) + ".png")
		framenum -= 1
		await get_tree().create_timer(0.3).timeout
	await get_tree().create_timer(5).timeout
	framenum += 1
	Forest()

func startmusic():
	await get_tree().create_timer(1).timeout
	$AudioStreamPlayer2D.play()


func _on_audio_stream_player_2d_finished() -> void:
	$AudioStreamPlayer2D.play()
