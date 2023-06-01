extends Node2D

var capacity = 3
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed('up') and self.position.y > 66:
		self.position.y -= capacity
	if Input.is_action_pressed('down') and self.position.y < 574:
		self.position.y += capacity
	if Input.is_action_pressed('left') and self.position.x > 66:
		self.position.x -= capacity
		get_node("CharacterBody2D/Sprite2D").set_flip_h(true)
	if Input.is_action_pressed('right') and self.position.x < 1054:
		self.position.x += capacity
		get_node("CharacterBody2D/Sprite2D").set_flip_h(false)
	
