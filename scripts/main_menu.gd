extends Node2D

func _ready():
	var exit = get_node("exitBtn")
	var play = get_node("playBtn")
	exit.connect("pressed", _exitBtnPressed)
	play.connect("pressed", _playBtnPressed)


func _process(delta):
	pass


func _exitBtnPressed():
	get_tree().quit()


func _playBtnPressed():
	print(123)
