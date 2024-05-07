extends Node2D

var Bullet = preload("res://water_pellet.tscn")  
var speed = -500
var flip = 1

func _physics_process(delta):
	if flip%2 == 1:
		$Sprite2D.flip_h = false
	else:
		$Sprite2D.flip_h = true

	position += transform.x * speed * delta

func shoot():
	var b = Bullet.instantiate()
	add_child(b)

func _on_timer_timeout():
	shoot()

func _on_timer_2_timeout():
	speed = -speed
	flip += 1 
