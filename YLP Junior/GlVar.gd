extends Node

var forward = true
var PlDir = 1
var PlVer = 1
var Health = 6
var Boss = 15

var Elements = {
	"Fire": 50,
	"Water": 50,
	"Lighting": 50
}

func _process(delta):
	PlDir = Input.get_axis("ui_left", "ui_right")
	PlVer = Input.get_axis("ui_down", "ui_up")

	if Health == 0:
		get_tree().change_scene_to_file("res://Levels/title_screen.tscn")
		Health = 6

	if PlDir == -1:
		forward = false
	elif PlDir == 1:
		forward = true
	elif PlDir == 0:
		pass
