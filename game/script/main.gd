extends Node

onready var ui = get_node("ui")
onready var game = get_node("ui/Control/VBoxContainer/HBoxContainer/Control/Viewport/game")

# prints cool to the console
func cool():
	print('cool')

# does some rad thing
func rad():
	print("wowzer!")


# All temp stuff for console

func _ready():
	set_process_input(true)

func _input(event):
	if event.is_action_pressed("console"):
		get_node("WindowDialog").popup()
		get_node("WindowDialog/VBoxContainer/LineEdit").grab_focus()


# stupid shit for console (hit ` [tilde])
func _on_LineEdit_text_entered( text ):
	var console = get_node("WindowDialog/VBoxContainer/Label")
	var ret = "Error"
	var a = text.split('.')
	if a != null and a.size() > 1:
		var target = find_node(a[0])
		if target != null:
			var b = a[1].split('(')
			if b != null and b.size() > 0:
				var function = b[0]
				var s = text.find('(')
				if s != -1:
					var args = text.right(s + 1)
					args = args.split(')')
					if args.size() > 0:
						args = args[0].split(',')
						if args.size() == 0:
							if target.has_method(function):
								ret = target.call(function)
						elif args.size() == 1:
							if target.has_method(function):
								ret = target.call(function, args[0])
						elif args.size() == 2:
							if target.has_method(function):
								ret = target.call(function, args[0], args[1])
						elif args.size() == 3:
							if target.has_method(function):
								ret = target.call(function, args[0], args[1], args[2])
						elif args.size() == 4:
							if target.has_method(function):
								ret = target.call(function, args[0], args[1], args[2], args[4])
	if ret == null:
		ret = "null"
	console.set_text(ret + '\n'+ console.get_text())
	get_node("WindowDialog/VBoxContainer/LineEdit").clear()
func _on_LineEdit_text_changed( text ):
	if text == '`':
		get_node("WindowDialog/VBoxContainer/LineEdit").clear()
