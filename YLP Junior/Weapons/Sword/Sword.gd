extends Node2D

func _process(delta):
	
	if GlVar.forward:
		rotation += 0.2
		if rotation >= 2.4:
			queue_free()
	elif !GlVar.forward:
		rotation -= 0.2
		if rotation <= -2.4:
			queue_free()


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
