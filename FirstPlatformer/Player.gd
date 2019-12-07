extends KinematicBody2D

const GRAVITY = 1500.0
const PLAYER_SPEED = 250.0
const JUMP_SPEED = -750.0

var motion = Vector2()
var input
var anim
var canMove

func _ready():
	anim = "Idle"
	input = 0
	canMove = true

func _physics_process(delta):
	move_and_slide(motion, Vector2 (0, -1))
	motion.y += GRAVITY * delta
	print (motion.y)
	if is_on_floor():
		#motion.y = 0
		motion.y = GRAVITY * delta
	else:
		motion.y += GRAVITY * delta
	if Input.is_action_pressed("game_jump") and motion.y > 0:
		motion.y -= GRAVITY * delta / 3
		if Input.is_action_just_pressed("game_jump") and is_on_floor():
			motion.y = JUMP_SPEED
			$Sprite/AnimationPlayer.play("JumpPrep")
			$Sprite/AnimationPlayer.play("JumpLeap")
			
	input = 0
	if canMove:
		if Input.is_action_pressed("game_left"):
			input = -1
			$Sprite.flip_h = true
		if Input.is_action_pressed("game_right"):
			input = 1
			$Sprite.flip_h = false
	
	motion.x = lerp(motion.x, (input*PLAYER_SPEED), 0.135)
	
	if Input.is_action_pressed("game_slash"):
		$Sprite/AnimationPlayer.play("SlashUp")
		canMove = false
		yield($Sprite/AnimationPlayer, "animation_finished")
	canMove = true
	
	if position.y > 1000:
		$AudioStreamPlayer.play()
		position = get_tree().get_root().get_node("Level1/Spawn").position
	
	anim = "Idle"
	if abs(motion.x) > 5:
		anim = "Run"
	if motion.y > 1 and not is_on_floor():
		anim = "Fall"
	$Sprite/AnimationPlayer.play(anim)
	
	

	