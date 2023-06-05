extends Node2D
# home = 558 575


func _ready():
	Global.finish_change_scene()
	if Global.player_home == false:
		$Chebupel.position.x = Global.player_start_posx
		$Chebupel.position.y = Global.player_start_posy
	elif Global.player_home == true:
		$Chebupel.position.x = Global.player_exit_home_posx
		$Chebupel.position.y = Global.player_exit_home_posy
		Global.player_home = false
		
func _process(delta):
	change_scene()


func _on_home_vhod_body_entered(body):
	if body.has_method("player"):
		Global.transtion_scene = true
		
func change_scene():
	if Global.transtion_scene == true:
		if Global.scene == "lvl1":
			get_tree().change_scene_to_file("res://scenes/home.tscn")
			Global.finish_change_scene()
			

func _on_home_vhod_body_exited(body):
	if body.has_method("player"):
		Global.transtion_scene = false
