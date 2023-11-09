extends CharacterBody2D

@export var speed = 400
var angle
var slope_detector = Vector2(10,100)
var animation_player
var viewport_size: Vector2

func _ready():
	animation_player = $AnimationPlayer

func get_input():
	velocity = Vector2()
	var input_dir := Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		angle = 6283
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		angle = 3141
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
		angle = 4712
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		angle = 1570
	velocity = velocity.normalized() * speed

	animate()

func _physics_process(delta):
	get_input()
	move_and_slide()

func animate():
	match(angle):
		6283:
			animation_player.play("IdleRight")
		3141:
			animation_player.play("IdleLeft")
		4712:
			animation_player.play("IdleDown")
		1570:
			animation_player.play("IdleUp")
