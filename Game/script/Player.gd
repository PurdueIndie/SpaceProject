extends RigidBody2D

func _ready():
	set_process(true)

func _process(delta):
	if Input.is_action_pressed("move_left"):
		self.add_force(Vector2(0, 0), Vector2(-1, 0))
	if Input.is_action_pressed("move_right"):
		self.add_force(Vector2(0, 0), Vector2( 1, 0))
	if Input.is_action_pressed("move_up"):
		self.add_force(Vector2(0, 0), Vector2(0, -1))
	if Input.is_action_pressed("move_down"):
		self.add_force(Vector2(0, 0), Vector2(0,  1))
