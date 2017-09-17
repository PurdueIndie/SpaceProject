extends Node

onready var ui = get_node("ui")
onready var game = get_node("ui/Control/VBoxContainer/HBoxContainer/Control/Viewport/game")

# prints cool
func cool():
	print('cool')

func _ready():
	set_process_input(true)

func _input(event):
	if event.is_action_pressed("console"):
		get_node("WindowDialog").popup()
		get_node("WindowDialog/VBoxContainer/LineEdit").grab_focus()


func _on_LineEdit_text_entered( text ):
	var t = text.split('.', false)
	var m

	if t != null and t.size() > 1:
		m = t[1].split('(', false)
		if m[-1] == ')':
			m.remove(m.size() - 1)

	var con = get_node("WindowDialog/VBoxContainer/Label")
	var z
	if m != null and m.size() > 0:
		if t[0] == 'self':
			z = self
		else:
			z = get(t[0])
		if z:
			if m.size() == 1:
				z = z.call(m[0])
			elif m.size() == 2 :
				z = z.call(m[0], m[1])
			elif m.size() == 3:
				z = z.call(m[0], m[1], m[2])
			elif m.size() == 4:
				z = z.call(m[0], m[1], m[2], m[3])
	con.set_text(str(z) if z else "None"  + "\n" + con.get_text())
	get_node("WindowDialog/VBoxContainer/LineEdit").clear()
