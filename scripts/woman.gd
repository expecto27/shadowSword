extends CharacterBody2D

var moveSpeed = 4  # Скорость движения NPC

var stand = 100

var cur_dir = "none"
@onready var anim = $AnimatedSprite2D

func _ready():
	randomize()  # Инициализируем генератор случайных чисел

func _process(delta):
	if stand == 0:
		anim.play("Idle")
		stand = 300
		var direction = Vector2(randf()-0.5, randf()-0.5).normalized()
		velocity = direction * moveSpeed
	elif stand < 70:
		stand -= 1
		velocity = Vector2()
		anim.play("walk_down")
	else:
		stand -= 1

func _physics_process(delta):
	move_and_slide()
