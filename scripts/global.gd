extends Node

var player_cur_attack = false
var scene = ""
var transtion_scene = false

var alive_player = true

var player_exit_home_posx = 584
var player_exit_home_posy = 353
var player_start_posx = 520
var player_start_posy = 318
var player_exit_forest_posx = 1123
var player_exit_forest_posy = 346

var player_home = false
var player_forest = false

func finish_change_scene():
	if transtion_scene == true:
		transtion_scene = false
	scene = get_tree().current_scene.name
	print(scene)
	
