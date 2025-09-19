extends Node
class_name Enemy

class EnemyInfo:
	var tier: int
	var health: int
	var attack: float
	var attackCount: int
	var attack_type: Array
	var isAlive: bool
	var hasAttacked: bool
	var texturepath: String
	
	

	func _init(_tier: int, _health: int, _attack: float, _attackCount: int, _type: Array, _isAlive: bool, _hasAttacked: bool, _texture: String  ):
		tier = _tier
		health = _health
		attack = _attack
		attackCount = _attackCount
		attack_type = _type
		isAlive = _isAlive
		hasAttacked = _hasAttacked
		texturepath = _texture
	
	func duplicate() -> EnemyInfo:
		return EnemyInfo.new(
			tier,
			health,
			attack,
			attackCount,
			attack_type.duplicate(),
			isAlive,
			hasAttacked,
			texturepath
		)
	
	
		

#Static enemy definitions
#Using a dictionary for direct access
# ints in order are: Tier of enemy, health, attack damage, no. of attacks
# Rapid attack type fires multiple low value attacks quickly, standard is one off attack, full damage.
var Enemy_Data := {
	#Tier 1 enemies
	"Basicenemy1": EnemyInfo.new(1, 5, 2, 1, ["Standard"], true, false, "res://Assets/Images/placeholderBE1.png"),
	"Basicenemy2": EnemyInfo.new(1, 5, 0.5, 4, ["Rapid"], true, false,  "res://Assets/Images/placeholderBE2.png"),
	"Basicenemy3": EnemyInfo.new(1, 3, 3, 1, ["Standard"], true, false, "res://Assets/Images/placeholderBE3.png")
	}
