extends Node

# onready var game = get_node("/root/main").game
func Game():
	pass

enum DAMAGE {REGULAR, PIERCE, FIRE}
enum ITEM {NONE, FUEL, BOOSTER, AMMO, FIRE_EXT, MEDKIT, REPAIR, CARGO}
enum SYSTEM {HULL, ENGINES, GUNS, MEDBAY}

# handles pausing the game
# returns null
func pause_game():
	pass

# returns the time passed in seconds (in-game)
# returns float
func get_time():
	pass
