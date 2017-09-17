extends Node

func set_hull( value ):
	get_node("Control/VBoxContainer/HBoxContainer 2/VBoxContainer/HBoxContainer/TextureProgress").set_value( float(value) )


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
