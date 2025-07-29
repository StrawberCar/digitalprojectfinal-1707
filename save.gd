extends Control

@onready var label = $Stats

var typing_speed := 0.05

func _ready() -> void:
	awaitstart()
	if Global.classchosen == 1:
		$Spirit.texture = load("res://Assets/Images/Astarlion.png")
	elif Global.classchosen == 2:
		$Spirit.texture = load("res://Assets/Images/MasterFeast-1.png.png")
	elif Global.classchosen == 3:
		$Spirit.texture = load("res://Assets/Images/simbyote.png")


func write(text: String, append: bool = false) -> void:
	await _write_text(text, append)

# Internal coroutine
func _write_text(text: String, append: bool) -> void:
	if not append:
		label.text = ""
	for char in text:
		label.text += char
		await get_tree().create_timer(typing_speed).timeout


func writestats():
	write("Speed: " + str(Global.playerspeed) + "\nMana: " + str(Global.playermana) + "\nStrength: " + str(Global.playerstrength))

func pause():
	await get_tree().create_timer(5).timeout
	$VideoStreamPlayer.paused = true
	writestats()



func awaitstart():
	if Global.save == true:
		show()
	else:
		hide()


func _on_save_pressed() -> void:
	Global.save = false
