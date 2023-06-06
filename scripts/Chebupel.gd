extends CharacterBody2D

@onready var anim = $AnimationPlayer
var cur_dir = "none"
var capacity = 2

var enemy_attack_range = false
var enemy_attack_cooldown = true
var hp = 100

var attack_ip = false


func _ready():
	pass

func _physics_process(delta):
	player_movement(delta)
	enemy_attack()
	attack()
	update_hp()
	
	if hp <= 0:
		Global.alive_player = false
		hp = 0
		$AnimationPlayer.play("death")
		self.queue_free()

func player_movement(delta):
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
	
	
	
func play_anim(movement):
	var dir = cur_dir
	
	if dir == "right":
		get_node("plrig").set_flip_h(false)
		if movement == 1:
			anim.play("w_r")
		elif movement == 0:
			if attack_ip == false:
				anim.play("Idle_r")
	
	if dir == "left":
		get_node("plrig").set_flip_h(true)
		if movement == 1:
			anim.play("w_r")
		elif movement == 0:
			if attack_ip == false:
				anim.play("Idle_r")

	if dir == "down":
		get_node("plrig").set_flip_h(false)
		if movement == 1:
			anim.play("w_d")
		elif movement == 0:
			if attack_ip == false:
				anim.play("Idle")

	if dir == "up":
		get_node("plrig").set_flip_h(false)
		if movement == 1:
			anim.play("w_u")
		elif movement == 0:
			if attack_ip == false:
				anim.play("Idle_up")

func player():
	pass

func _on_hit_box_body_entered(body):
	if body.has_method("enemy"):
		enemy_attack_range = true


func _on_hit_box_body_exited(body):
	if body.has_method("enemy"):
		enemy_attack_range = false

func enemy_attack():
	if enemy_attack_range and enemy_attack_cooldown == true:
		$damage.playing = true
		$plrig.modulate = Color(1,0,0,1)
		hp -= 5
		enemy_attack_cooldown = false
		$cooldown.start()
		print(hp)


func _on_cooldown_timeout():
	enemy_attack_cooldown = true
	$plrig.modulate = Color(1,1,1,1)

func attack():
	var dir = cur_dir
	if Input.is_action_just_pressed("attack"):
		Global.player_cur_attack = true
		attack_ip = true
		if dir == "right":
			get_node("plrig").set_flip_h(false)
			anim.play("att_r")
			$deal_att.start()
			$swordslash.playing = true
		if dir == "left":
			get_node("plrig").set_flip_h(true)
			anim.play("att_r")
			$deal_att.start()
			$swordslash.playing = true
		if dir == "down":
			get_node("plrig").set_flip_h(false)
			anim.play("att_d")
			$deal_att.start()
			$swordslash.playing = true
		if dir == "up":
			get_node("plrig").set_flip_h(false)
			anim.play("att_u")
			$deal_att.start()
			$swordslash.playing = true

func _on_deal_att_timeout():
	$deal_att.stop()
	Global.player_cur_attack = false
	attack_ip = false

func update_hp():
	var hpbar = $healthbar
	hpbar.value = hp 
	
	if hp >= 100:
		hpbar.visible = false
	else:
		hpbar.visible = true


func _on_regen_timeout():
	if hp < 100:
		hp += 10
		if hp > 100:
			hp = 100
	if hp <= 0:
		hp = 0

