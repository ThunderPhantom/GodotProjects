extends Area2D

export (PackedScene) var NextLevel



func _on_NextLevelKey_body_entered(body):
	$AudioStreamPlayer.play()
	$Sprite.visible = false
	yield($AudioStreamPlayer, "finished")
	get_tree().change_scene_to(NextLevel)
