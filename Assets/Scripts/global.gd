extends Node

# Player stats

var playerstrength = 0
var playerspeed = 3       # These are set for debug values (Mana character)
var playermana = 20
var maxhealth = 10
var health = 10
var currentmana = 20
var classchosen = 0
# Bools for other stuff

var spinmenuportals = false

# Enemy stats and enums

var enemytier = 1
var enemy1 = ""
var enemy2 = ""
var enemy3 = ""

enum tier1enemies{Basicenemy1, Basicenemy2, Basicenemy3}

# Detailing variables

var leveltype
