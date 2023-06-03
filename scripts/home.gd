extends Node2D

var mainCharacter
# Called when the node enters the scene tree for the first time.
func _ready():
	mainCharacter = get_node("Chebupel")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var x = int(mainCharacter.position.x)
	var y = int(mainCharacter.position.y)
	print(x, y)
	if x > 400 and x < 450 and y > 409 and y < 422:
		get_tree().change_scene_to_file('scenes/lvl1.tscn')
