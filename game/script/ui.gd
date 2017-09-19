extends Node
# onready var ui = get_node("/root/main").ui
func UI():
	pass

# sets the hull bar to a value (0-100)
# takes float returns null
func set_hull( value ):
	get_node("Control/VBoxContainer/HBoxContainer 2/VBoxContainer/HBoxContainer/TextureProgress").set_value( float(value) )

# sets the shield amount
# takes int returns null
func set_shield( value ):
	pass

# sets credits label to value
# takes string returns null
func set_credits( value ):
	pass

# sets fuel label to value
# takes string returns null
func set_fuel( value ):
	pass

# sets ammo label to value
# takes string returns null
func set_ammo( value ):
	pass

# sets fire extinguisher label to value
# takes string returns null
func set_fire_ext( value ):
	pass

# sets medkit label to value
# takes string returns null
func set_medkit( value ):
	pass

# sets repair label to value
# takes string returns null
func set_repair( value ):
	pass

# sets oxygen label to value
# takes string returns null
func set_oxygen( value ):
	pass

# sets cargo label to value
# takes string returns null
func set_cargo( value ):
	pass
