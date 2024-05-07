extends Node2D

var Bullet = preload("res://fire_pellet.tscn")  

func shoot():
	var b = Bullet.instantiate()
	get_parent().add_child(b)
	b.global_position = $Marker2D.global_position

func _on_timer_timeout():
	shoot()
