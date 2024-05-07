extends Node2D

var speed = -1500
var knockback_strength = 7500/3

func _ready():
	if speed > 0:
		$Sprite2D.scale.x = 9
	elif speed < 0:
		$Sprite2D.scale.x = -9

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_area_2d_body_entered(body):
	if body.get_name() == "Player":
		GlVar.Health -= 1
		var direction = global_position.direction_to(body.global_position)
		var explosion_force = direction * knockback_strength
		body.knockback = explosion_force
	self.queue_free()
