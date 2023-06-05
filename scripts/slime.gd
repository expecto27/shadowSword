extends CharacterBody2D

var speed = 30
var chebupel_chase = false
var chebupel = null

var hp = 70
var player_attack_zone = false
var take_damage_cool = true
var anim_det = true

func _physics_process(delta):
	deal_damage()
	update_hp()
	
	if chebupel_chase:
		position += (chebupel.position - position)/speed
		$AnimatedSprite2D.play("walk")
		if (chebupel.position.x - position.x) < 0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.play("Idle")
	move_and_slide()

func _on_detect_body_entered(body):
	chebupel = body
	chebupel_chase = true


func _on_detect_body_exited(body):
	chebupel = null
	chebupel_chase = false

func enemy():
	pass


func _on_hit_box_body_entered(body):
	if (body.has_method("player")):
		player_attack_zone = true
		
func _on_hit_box_body_exited(body):
	if (body.has_method("player")):
		player_attack_zone = false

func deal_damage():
	if player_attack_zone and Global.player_cur_attack == true:
		if take_damage_cool == true:
			hp -= 10
			$cooldown.start()
			take_damage_cool = false
			print(hp)
			if hp <= 0:
				self.queue_free()
					


func _on_cooldown_timeout():
	take_damage_cool = true

func update_hp():
	var hpbar = $healthbar
	hpbar.value = hp 
	
	if hp >= 70:
		hpbar.visible = false
	else:
		hpbar.visible = true
