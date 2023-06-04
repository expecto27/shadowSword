extends CharacterBody2D

var stands = true
var destination = Vector2()
var speed = 20
var prev_pos = Vector2()
var antibag = 300

func _ready():
	self.velocity = Vector2()

func _process(delta):
	search_for_target()
	if velocity:
		prev_pos = position
		move_and_slide()
	wander()
	antibag -= 1
	if antibag == 0:
		cancel_movement()
	
func set_destination(dest):
	destination = dest
	velocity = (destination - position).normalized() * speed
	stands = false

func search_for_target():
	if self.position.distance_to($"../Chebupel".position) < 200:
		set_destination($"../Chebupel".position)
	

func wander():
	var pos = position
	if stands:
		randomize()
		var x = int(randf_range(pos.x - 150, pos.x + 150))
		var y = int(randf_range(pos.y - 150, pos.y + 150))
		set_destination(Vector2(x,y))
	elif velocity != Vector2():
		if pos.distance_to(destination) <= 30:
			cancel_movement()
		if pos.distance_to(prev_pos) <= 0.2:
			cancel_movement()


func cancel_movement():
	velocity = Vector2()
	destination = Vector2()
	$Timer.start(1)


func _on_timer_timeout():
	stands = true
