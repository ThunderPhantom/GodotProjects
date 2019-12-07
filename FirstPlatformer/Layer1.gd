extends Sprite

export var scroll_scale = Vector2(0, 0)

func set_scroll(distance):
	self.region_rect.position = scroll_scale*distance