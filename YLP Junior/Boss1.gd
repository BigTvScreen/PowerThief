extends Node2D

var Bullet = preload("res://waterling.tscn")  
var rng = RandomNumberGenerator.new()
var speed = 300

func _process(delta):
	if GlVar.Boss == 0:
		queue_free()
	$Sprite2D2.position += transform.y * speed * delta

func shoot():
	var b = Bullet.instantiate()
	get_parent().add_child(b)
	b.global_position = $Sprite2D2.global_position
	
	if randi()%2 == 0:
		b.speed = -b.speed

func _on_timer_timeout():
	shoot()

func _on_timer_2_timeout():
	speed = -speed
