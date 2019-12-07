extends KinematicBody2D

var walk_speed = 100
var anim = "walk_down"
var motion = Vector2()
var input = Vector2()

func _physics_process(delta):
	input.x = 0
	input.y = 0
	if Input.is_action_pressed("game_down"):
		anim = "WalkDown"
		input.y = 1
	if Input.is_action_pressed("game_up"):
		anim = "WalkUp"
		input.y = -1
	if Input.is_action_pressed("game_left"):
		anim = "WalkLeft"
		input.x = -1
	if Input.is_action_pressed("game_right"):
		anim = "WalkRight"
		input.x = 1
	if Input.is_action_just_released("game_down"):
		anim = "IdleDown"
	if Input.is_action_just_released("game_up"):
		anim = "IdleUp"
	if Input.is_action_just_released("game_left"):
		anim = "IdleLeft"
	if Input.is_action_just_released("game_right"):
		anim = "IdleRight"
	
	$AnimationPlayer.play(anim)
		
	motion.x = lerp(motion.x, input.x * walk_speed, 0.2)
	motion.y = lerp(motion.y, input.y * walk_speed, 0.2)
	move_and_slide(motion)