extends Node2D

func _ready():
	var exit = get_node("exitBtn")
	exit.connect("pressed", _exitBtnPressed)

func _process(delta):
	pass


func _exitBtnPressed():
	get_tree().quit()
