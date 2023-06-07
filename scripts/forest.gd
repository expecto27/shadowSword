extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.finish_change_scene()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_scene()


func _on_city_body_entered(body):
	if body.has_method("player"):
		Global.transtion_scene = true
		Global.player_forest = true
	print(Global.scene)
	print(Global.transtion_scene)

func change_scene():
	if Global.transtion_scene == true:
		if Global.scene == "forest":
			get_tree().change_scene_to_file("res://scenes/lvl1.tscn")
			Global.finish_change_scene()


func _on_city_body_exited(body):
	if body.has_method("player"):
		Global.transtion_scene = false

