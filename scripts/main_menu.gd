extends Node2D

func _ready():
	pass

func _process(delta):
	if $Settings.visible == false:
		$menu.visible = true
		$settingBtn.visible = true
		$exitBtn.visible = true
		$playBtn.visible = true


func _on_exit_btn_pressed():
	get_tree().quit()


func _on_play_btn_pressed():
	get_tree().change_scene_to_file('scenes/lvl1.tscn')


func _on_setting_btn_pressed():
	$Settings.visible = true
	$menu.visible = false
	$settingBtn.visible = false
	$exitBtn.visible = false
	$playBtn.visible = false
