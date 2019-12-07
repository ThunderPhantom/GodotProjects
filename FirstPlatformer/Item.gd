extends Area2D

func _ready():
	randomize()
	$Sprite.frame = randi() % ($Sprite.vframes * $Sprite.hframes)
	
func _process(delta):
	$AnimationPlayer.play("Hover")


func _on_Item_body_entered(body):
	$AudioStreamPlayer.play()
	$Sprite.visible = false
	yield($AudioStreamPlayer, "finished")
	queue_free()
