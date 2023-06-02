extends CharacterBody2D
var stands = true
var destination = Vector2()
var vel = 200

func _physics_process(delta):
	wander()
	
func set_destination(dest):
	destination = dest
	self.velocity = (destination - position).normalized() * vel
	move_and_slide()
	stands = false
	
	
func cancel_movement():
	velocity = Vector2()
	destination = Vector2()
	$StandingTimer.start(0)

func wander():
	var pos = position
	if stands:
		randomize()
		var x = int(randf_range(pos.x - 50, pos.x + 50)) * 100
		var y = int(randf_range(pos.y - 50, pos.y + 50)) * 100
		set_destination(Vector2(x, y))
	elif velocity != Vector2():
		cancel_movement() 


func _on_standing_timer_timeout():
	stands = true
