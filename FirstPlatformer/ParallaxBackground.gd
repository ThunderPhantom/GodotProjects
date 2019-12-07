extends ParallaxBackground

func _process(delta):
	for child in get_children():
		child.set_scroll(-scroll_offset)