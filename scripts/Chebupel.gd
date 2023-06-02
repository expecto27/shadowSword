extends CharacterBody2D

@onready var _animation_player = $AnimationPlayer
var cur_dir = "none"

var capacity = 2
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_pressed("left") and Input.is_action_pressed('up'):
		cur_dir = "left"
		play_anim(1)
		self.position.x -= capacity / 1.5
		self.position.y -= capacity / 1.5
	elif Input.is_action_pressed('left') and Input.is_action_pressed('down'):
		cur_dir = "left"
		play_anim(1)
		self.position.x -= capacity / 1.5
		self.position.y += capacity / 1.5
	elif Input.is_action_pressed("right") and Input.is_action_pressed('up'):
		cur_dir = "right"
		play_anim(1)
		self.position.x += capacity / 1.5
		self.position.y -= capacity / 1.5
	elif Input.is_action_pressed("right") and Input.is_action_pressed('down'):
		cur_dir = "right"
		play_anim(1)
		self.position.x += capacity / 1.5
		self.position.y += capacity / 1.5
	elif Input.is_action_pressed('up'):
		cur_dir = "up"
		play_anim(1)
		self.position.y -= capacity
	elif Input.is_action_pressed('down'):
		cur_dir = "down"
		play_anim(1)
		self.position.y += capacity
	elif Input.is_action_pressed('left'):
		cur_dir = "left"
		play_anim(1)
		self.position.x -= capacity
	elif Input.is_action_pressed('right'):
		cur_dir = "right"
		play_anim(1)
		self.position.x += capacity
	else:
		play_anim(0)
	move_and_slide()
	position.x = clamp(position.x, 0, 10000)
	position.y = clamp(position.y, 0, 10000)
	
	
func play_anim(movement):
	var dir = cur_dir
	
	if dir == "right":
		get_node("plrig").set_flip_h(false)
		if movement == 1:
			_animation_player.play("w_r")
		elif movement == 0:
			_animation_player.play("Idle_r")
	
	if dir == "left":
		get_node("plrig").set_flip_h(true)
		if movement == 1:
			_animation_player.play("w_r")
		elif movement == 0:
			_animation_player.play("Idle_r")

	if dir == "down":
		get_node("plrig").set_flip_h(false)
		if movement == 1:
			_animation_player.play("w_d")
		elif movement == 0:
			_animation_player.play("Idle")

	if dir == "up":
		get_node("plrig").set_flip_h(false)
		if movement == 1:
			_animation_player.play("w_u")
		elif movement == 0:
			_animation_player.play("Idle_up")

