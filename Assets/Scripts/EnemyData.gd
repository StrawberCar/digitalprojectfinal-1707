extends Node
class_name Enemy

class EnemyInfo:
	var tier: int
	var health: int
	var attack: int
	var attackCount: int
	var attack_types: Array
	var texturepath: String

	func _init(_tier: int, _health: int, _attack: int, _attackCount: int, _types: Array, _texture: String):
		tier = _tier
		health = _health
		attack = _attack
		attackCount = _attackCount
		attack_types = _types
		texturepath = _texture

#Static enemy definitions
#Using a dictionary for direct access
# ints in order are: Tier of enemy, health, attack damage, no. of attacks
# Rapid attack type fires multiple low value attacks quickly, standard is one off attack, full damage.
var Enemy_Data := {
	#Tier 1 enemies
	"Basicenemy1": EnemyInfo.new(1, 5, 2, 1, ["Standard"], "res://Assets/Images/placeholderBE1.png"),
	"Basicenemy2": EnemyInfo.new(1, 5, 2, 1, ["Rapid"], "res://Assets/Images/placeholderBE2.png"),
	"Basicenemy3": EnemyInfo.new(1, 3, 4, 1, ["Standard"], "res://Assets/Images/placeholderBE3.png")
	}
