extends CharacterBody2D

var moveSpeed = 4  # Скорость движения NPC

var stand = 100


func _ready():
	randomize()  # Инициализируем генератор случайных чисел

func _process(delta):
	if stand == 0:
		stand = 300
		var direction = Vector2(randf()-0.5, randf()-0.5).normalized()
		print(direction)
		velocity = direction * moveSpeed
	elif stand < 70:
		stand -= 1
		velocity = Vector2()
	else:
		stand -= 1

func _physics_process(delta):
	move_and_slide()
