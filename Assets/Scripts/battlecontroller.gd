extends Node2D

# Preload textures for attack select tabs
#region Preloads
@onready var basicattackbg = load("res://Assets/Images/attackselecttabbg.png")
@onready var magicattackbg = load("res://Assets/Images/attackselecttabbgmagic.png")
@onready var Enemy_enum
@onready var enemy1sprite = $Enemies/enemy1
@onready var enemy1HPBar = $EnemyStatsDisplay/Enemy1HP
@onready var enemy1HPLabel = $EnemyStatsDisplay/Enemy1HP/Enemy1HPLabel
@onready var enemy2sprite = $Enemies/enemy2
@onready var enemy2HPBar = $EnemyStatsDisplay/Enemy2HP
@onready var enemy2HPLabel = $EnemyStatsDisplay/Enemy2HP/Enemy2HPLabel
@onready var enemy3sprite = $Enemies/enemy3
@onready var enemy3HPBar = $EnemyStatsDisplay/Enemy3HP
@onready var enemy3HPLabel = $EnemyStatsDisplay/Enemy3HP/Enemy3HPLabel
@onready var playerhp = $PlayerStatsDisplay/HPProgressBar
@onready var playerhplabel = $PlayerStatsDisplay/HealthLabel
@onready var playermana = $PlayerStatsDisplay/ManaProgressBar
@onready var playermanalabel = $PlayerStatsDisplay/ManaLabel
@onready var playerstaminabar = $PlayerStatsDisplay/StaminaProgressBar
@onready var playerstaminabarlabel = $PlayerStatsDisplay/StaminaLabel
@onready var enemybuttonselect1 = $Enemies/enemy1/enemybutton1
@onready var enemybuttonselect2 = $Enemies/enemy2/enemybutton2
@onready var enemybuttonselect3 = $Enemies/enemy3/enemybutton3
#endregion

var enemy1_info
var enemy2_info
var enemy3_info

var enemy1hp
var enemy2hp
var enemy3hp

var staminaRemaining = 0
var maxplayerstaminabar = Global.playerspeed
var _playerStrength = Global.playerstrength
var _playerHealth = Global.health
var isPlayerAttacking = true
var totalDamage
var shownAttacks
var shownMana
var currentanim
var attacker
var attackdodged
var enemiesAlive = 3

func _playerSetup() -> void:
	staminaRemaining = maxplayerstaminabar
	playerstaminabar.max_value = maxplayerstaminabar
	playerstaminabarlabel.text = str(staminaRemaining)
	var attackNum = $"AttackOptions/Basic Attacks".get_child_count()
	var manaNum = $"AttackOptions/Spirtual Moves".get_child_count()
	print(manaNum, " ", attackNum)




func _ready() -> void:
	
	_playerSetup()
	
	var enemy1name = Global.enemy1
	match Global.enemytier:
		1:
			Enemy_enum = Global.tier1enemies
		2:
			Enemy_enum = Global.tier2enemies
		3:
			Enemy_enum = Global.tier3enemies
		_:
			print("No enemy tier exists")
	
	
	var enemy2name = Enemy_enum.keys().pick_random()		#returns the name of the enemy selected - i.e. basicenemy1
	var enemy3name = Enemy_enum.keys().pick_random()
	print(enemy1name, " ", enemy2name, " ", enemy3name)
	
	_spawnEnemy(enemy1name, enemy2name, enemy3name)
	

func _spawnEnemy(_enemy1: String, _enemy2: String, _enemy3: String) -> void:
	#Enemy 1 setup
	enemy1_info = Enemies.Enemy_Data.get(_enemy1)
	enemy1sprite.texture = load(enemy1_info.texturepath)
	print("Enemy1 texture: ", enemy1_info.texturepath)
	enemy1HPBar.max_value = enemy1_info.health
	enemy1hp = enemy1_info.health
	enemy1HPBar.value = enemy1_info.health
	enemybuttonselect1.hide()
	
	#Enemy 2 setup
	enemy2_info = Enemies.Enemy_Data.get(_enemy2)
	enemy2sprite.texture = load(enemy2_info.texturepath)
	print("Enemy2 texture: ", enemy2_info.texturepath)
	enemy2HPBar.max_value = enemy2_info.health
	enemy2hp = enemy2_info.health
	enemy2HPBar.value = enemy2_info.health
	enemybuttonselect2.hide()
	
	#Enemy 3 setup
	enemy3_info = Enemies.Enemy_Data.get(_enemy3)
	enemy3sprite.texture = load(enemy3_info.texturepath)
	print("Enemy3 texture: ", enemy3_info.texturepath)
	enemy3HPBar.max_value = enemy3_info.health
	enemy3hp = enemy3_info.health
	enemy3HPBar.value = enemy3_info.health
	enemybuttonselect3.hide()

# Select attack type tab

func _on_tab_container_tab_changed(tab: int) -> void:
	if tab == 0:
		$TabBG.texture = basicattackbg
	elif tab == 1:
		$TabBG.texture = magicattackbg

func _process(delta: float) -> void:
	enemy1HPLabel.text = str(enemy1hp)
	enemy2HPLabel.text = str(enemy2hp)
	enemy3HPLabel.text = str(enemy3hp)
	enemy1HPBar.value = enemy1hp
	enemy2HPBar.value = enemy2hp
	enemy3HPBar.value = enemy3hp
	playerhp.value = Global.health
	playerhplabel.text = str(Global.health)
	playermana.value = Global.playermana

func disablePlayerActions():
	$DisablePlayerOptions.show()
	
func enablePlayerActions():
	$DisablePlayerOptions.hide()

func showEnemyTargets() -> void:
	enemybuttonselect1.show()
	enemybuttonselect2.show()
	enemybuttonselect3.show()
	$Cancel.show()

func hideEnemyTargets() -> void:
	enemybuttonselect1.hide()
	enemybuttonselect2.hide()
	enemybuttonselect3.hide()
	$Cancel.hide()

func togglePlayerActions() -> void:
	if not isPlayerAttacking:
		$TabBG.hide()
		$AttackOptions.hide()
	else:
		$TabBG.show()
		$AttackOptions.show()

func _on_enemybutton_1_pressed() -> void:
	enemy1hp -= int(totalDamage)
	if enemy1hp < 1:
		print("Enemy1 DED")
		enemy1sprite.hide()
		enemy1hp = 0
		enemy1_info.isAlive = false
		enemiesAlive -= 1
	enablePlayerActions()
	checkstaminaRemaining()
	hideEnemyTargets()

func _on_enemybutton_2_pressed() -> void:
	enemy2hp -= totalDamage
	if enemy2hp < 1:
		print("Enemy2 DED")
		enemy2sprite.hide()
		enemy2hp = 0
		enemy2_info.isAlive = false
		enemiesAlive -= 1
	enablePlayerActions()
	checkstaminaRemaining()
	hideEnemyTargets()

func _on_enemybutton_3_pressed() -> void:
	enemy3hp -= totalDamage
	if enemy3hp < 1:
		print("enemy3 DED")
		enemy3sprite.hide()
		enemy3hp = 0
		enemy3_info.isAlive = false
		enemiesAlive -= 1
	enablePlayerActions()
	checkstaminaRemaining()
	hideEnemyTargets()

func calculateAttack(damage: float, numberOfAttacks: int) -> void:
	if isPlayerAttacking:
		totalDamage = int(damage) + _playerStrength
		print("Player caused damage of: ", totalDamage)
	else:
		# Enemies attack calculation
		while numberOfAttacks > 0:
			attackdodged = _dodge_enemy_attack()
			if attackdodged:
				# Player successfully dodged so no damage
				pass
			else:
				_playerHealth -= damage
				print("Player received damage of: ", damage)
				# TODO: death condition check for player - if health = 0 then DED.
				# TODO: check damage calculation is correct for the different attack types (Rapid or standard)
			numberOfAttacks -= 1

func checkstaminaRemaining() -> void:
	staminaRemaining -= 1
	var currentStamina = max(staminaRemaining, 0)
	playerstaminabar.value = currentStamina
	playerstaminabarlabel.text = str(currentStamina)
	
	if currentStamina > 0:
		isPlayerAttacking = true
		print("Turns remaining: ", staminaRemaining)
	else:
		isPlayerAttacking = false
		togglePlayerActions()
		enemyTurn()

func enemyTurn() -> void:
	# Identify number of attacks, type of attack - standard or rapid, and strength of attack
	# Start attack which then generates a dodge animation/mini-challenge for player to dodge
	# Calculate damage based on success of dodge
	# Once all enemies attacked, initiate player turn again
	
	# Start grow animation for player & enemies
	$PlayerPreview/Player.play("PlayerGrow")
	$Arrow.show()
	$Arrow/Fade.play("fade")
	
	# Checking what enemies are still alive to determine how many attack cycles to run (i.e. 2 enemies left means 2 attack cycles)
	var enemyAttacks = enemiesAlive
	attacker = null
	
	while enemyAttacks > 0:
		if enemy3_info.isAlive && enemy3_info.hasAttacked == false:
			attacker = enemy3_info
			currentanim = 3
			enemy3_info.hasAttacked = true
			print("Attacker is Enemy 3")
		elif enemy2_info.isAlive && enemy2_info.hasAttacked == false && attacker == null:
			attacker = enemy2_info
			currentanim = 2
			enemy2_info.hasAttacked = true
			print("Attacker is Enemy 2")
		elif enemy1_info.isAlive && enemy1_info.hasAttacked == false && attacker == null:
			attacker = enemy1_info
			currentanim = 1
			enemy1_info.hasAttacked = true
			print("Attacker is Enemy 1")
		else:
			print("No enemies attacks left")
			# TODO: add check that enemies are still alive, then return to player turn. If enemies all dead, exit battle function
		
		# Start grow animation for enemies
		_anim_enemy(currentanim)

		# Calculate attack process and start dodge mechanism
		calculateAttack(attacker.attack, attacker.attackCount)
		enemyAttacks -= 1

	enemy3_info.hasAttacked = false
	enemy2_info.hasAttacked = false
	enemy1_info.hasAttacked = false
	
	
# Basic attack 1 (2 damage, 1 stamina)
func _on_attack_1_pressed() -> void:
	print("Player Attacked using button 1!")
	var attackDamage = 2
	disablePlayerActions()
	calculateAttack(attackDamage, 1)
	showEnemyTargets()
	
func _on_attack_2_pressed() -> void:
	print("Player Attacked using button 2!")
	var attackDamage = 2
	disablePlayerActions()
	calculateAttack(attackDamage, 1)
	showEnemyTargets()


func _on_cancel_pressed() -> void:
	hideEnemyTargets()
	enablePlayerActions()
	

func _anim_enemy(_currentanim) -> void:
	$Dodge.show()
	match _currentanim:
		1:
			$Enemies/enemy1/Grow.play("Grow")
		2:
			$Enemies/enemy2/Grow.play("Grow")
		3:
			$Enemies/enemy3/Grow.play("Grow")
		_:
			print("Don't know how you got here! - Animation grow didn't work")

func _anim_enemy_reset(_currentanim) -> void:
	$PlayerPreview/Player.play_backwards("PlayerGrow")
	match _currentanim:
		1:
			$Enemies/enemy1/Grow.play_backwards("Grow")
		2:
			$Enemies/enemy2/Grow.play_backwards("Grow")
		3:
			$Enemies/enemy3/Grow.play_backwards("Grow")
		_:
			print("Don't know how you got here! - Animation backwards grow didn't work")
	$Dodge.hide()

#region Debug Animation Buttons
func _on_anim_1_pressed() -> void:
	$Dodge.show()
	$PlayerPreview/Player.play("PlayerGrow")
	$Enemies/enemy1/Grow.play("Grow")
	currentanim = 1


func _on_anim_2_pressed() -> void:
	$Dodge.show()
	$PlayerPreview/Player.play("PlayerGrow")
	$Enemies/enemy2/Grow.play("Grow")
	currentanim = 2

func _on_anim_3_pressed() -> void:
	$Dodge.show()
	$PlayerPreview/Player.play("PlayerGrow")
	$Enemies/enemy3/Grow.play("Grow")
	currentanim = 3

func _on_reset_pressed() -> void:
	$PlayerPreview/Player.play_backwards("PlayerGrow")
	$Dodge.hide()
	if currentanim == 1:
		$Enemies/enemy1/Grow.play_backwards("Grow")
	elif currentanim == 2:
		$Enemies/enemy2/Grow.play_backwards("Grow")
	elif currentanim == 3:
		$Enemies/enemy3/Grow.play_backwards("Grow")
#endregion

func _dodge_enemy_attack():
	print("This is where the dodge will happen")
	return false
