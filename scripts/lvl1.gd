extends Node2D
# home = 558 575
var mainCharacter

func _ready():
	mainCharacter = get_node("Chebupel")

func _process(delta):
	if 560 > int(mainCharacter.position.x) and int(mainCharacter.position.x) > 549  and int(mainCharacter.position.y) == 297:
		get_tree().change_scene_to_file('scenes/home.tscn')
