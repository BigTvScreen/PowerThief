extends Sprite2D

var start = false

func _process(delta):
	if start:
		rotation += 0.2
		scale.x += 0.1
		scale.y += 0.1


func _on_timer_timeout():
	start = true
