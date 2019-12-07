extends KinematicBody2D

var motion = Vector2()
export var gravity = 20

func _physics_process(delta):
	motion.y += gravity
	move_and_slide(motion)
