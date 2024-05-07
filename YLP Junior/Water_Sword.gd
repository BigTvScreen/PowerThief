extends Node2D

var splash = preload("res://splash.tscn")
var size = 0


func _process(delta):
#	water()
	rotation += 0.2
	scale.x += 0.1
	scale.y += 0.1
	
	if scale.x >= 4:
		queue_free()

func water():
	var b = splash.instantiate()
	b.scale.x += size
	b.scale.y += size
	size += 0.1
	add_child(b)

func _on_area_2d_area_entered(area):
	if area.get_name() == "E":
		if area.get_child(0).get_name() == "F":
			GlVar.Elements["Fire"] += 1
			area.get_parent().queue_free()

		elif area.get_child(0).get_name() == "W":
			GlVar.Elements["Water"] += 1
			area.get_parent().queue_free()

		elif area.get_child(0).get_name() == "L":
			GlVar.Elements["Lighting"] += 1
			area.get_parent().queue_free()

		elif area.get_child(0).get_name() == "B":
			GlVar.Boss -= 1
