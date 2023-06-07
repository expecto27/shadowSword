extends Control

var opt_file = "user://save.dat"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func save_file():
	var file = FileAccess.open(opt_file,FileAccess.WRITE)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_back_pressed():
	visible = false
	
func _on_video_pressed():
	$Sprite2D/Option.visible = false
	$Sprite2D/Video.visible = true

func _on_audio_pressed():
	$Sprite2D/Option.visible = false
	$Sprite2D/Audio.visible = true


func _on_back_op_1_pressed():
	$Sprite2D/Option.visible = true
	$Sprite2D/Video.visible = false


func _on_back_0p_2_pressed():
	$Sprite2D/Option.visible = true
	$Sprite2D/Audio.visible = false


func _on_full_screen_toggled(button_pressed):
	if button_pressed == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_borderless_toggled(button_pressed):
	if button_pressed == true:
		DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, 1)
	else:
		DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, 0)

func _on_v_sync_toggled(button_pressed):
	if button_pressed == true:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)


func _on_master_value_changed(value):
	AudioServer.set_bus_volume_db(0, value)


func _on_music_value_changed(value):
	AudioServer.set_bus_volume_db(1, value)


func _on_sound_fx_value_changed(value):
	AudioServer.set_bus_volume_db(2, value)
