extends Control

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		if visible == true:
			get_tree().paused = false
			visible = false
		else:
			get_tree().paused = true
			visible = true



func _on_button_pressed():
	get_tree().paused = false
	visible = false


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
