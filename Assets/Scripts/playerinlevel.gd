extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var body
@onready var savescene = preload("res://save.tscn")

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
	
	


func _on_playercollider_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy"):
		Global.enemy1 = body.get_meta("Enemytype")
		Global.enemytier = body.get_meta("Enemytier")
		get_tree().change_scene_to_file("res://Assets/Scenes/InBattle.tscn")


func _ready() -> void:
	if get_parent().is_in_group("ForestLevel"):
		Global.leveltype = "Forest"


func _process(delta: float) -> void:
	if Input.is_action_pressed("left"):
		$AnimatedSprite2D.play("Walking")
		$AnimatedSprite2D.flip_h = true
		
	elif Input.is_action_pressed("right"):
		$AnimatedSprite2D.play("Walking")
		$AnimatedSprite2D.flip_h = false

	else:
		$AnimatedSprite2D.play("default")
