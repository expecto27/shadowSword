extends Node2D

var capacity = 3
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed('up'):
		self.position.y -= capacity
	if Input.is_action_pressed('down'):
		self.position.y += capacity
	if Input.is_action_pressed('left'):
		self.position.x -= capacity
		get_node("CharacterBody2D/Sprite2D").set_flip_h(true)
	if Input.is_action_pressed('right'):
		self.position.x += capacity
		get_node("CharacterBody2D/Sprite2D").set_flip_h(false)
		
	position.x = clamp(position.x, 0, 10000)
	position.y = clamp(position.y, 0, 10000)
