game.gd
=======

- Game()

onready var game = get_node("/root/main").game

- DAMAGE

REGULAR
PIERCE
FIRE

- ITEM

NONE
FUEL
BOOSTER
AMMO
FIRE_EXT
MEDKIT
REPAIR
CARGO

- SYSTEM

HULL
ENGINES
GUNS
MEDBAY

- pause_game()

handles pausing the game
returns null

- get_time()

returns the time passed in seconds (in-game)
returns float



main.gd
=======

- cool()

prints cool to the console



ui.gd
=====

- UI()

onready var ui = get_node("/root/main").ui

- set_hull( value )

sets the hull bar to a value (0-100)
takes float returns null

- set_shield( value )

sets the shield amount
takes int returns null

- set_credits( value )

sets credits label to value
takes string returns null

- set_fuel( value )

sets fuel label to value
takes string returns null

- set_ammo( value )

sets ammo label to value
takes string returns null

- set_fire_ext( value )

sets fire extinguisher label to value
takes string returns null

- set_medkit( value )

sets medkit label to value
takes string returns null

- set_repair( value )

sets repair label to value
takes string returns null

- set_oxygen( value )

sets oxygen label to value
takes string returns null

- set_cargo( value )

sets cargo label to value
takes string returns null



