extends Node2D

var speed = -2000
var Hori = 1
var Verti = 1


func _ready():
	if GlVar.PlDir == 0:
		if GlVar.PlVer == 0:
			Hori = -1
		else:
			Hori = -GlVar.PlDir
	else:
		Hori = -GlVar.PlDir
	Verti = GlVar.PlVer

func _physics_process(delta):
	position += transform.x * speed * delta * Hori
	position += transform.y * speed * delta * Verti

func _on_area_2d_body_entered(body):
	if body.get_name() != "Player":
		self.queue_free()

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
