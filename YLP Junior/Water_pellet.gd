extends Node2D

var knockback_strength = 7500

func _process(delta):
	rotation += 0.2
	scale.x += 0.05
	scale.y += 0.05
	
	if scale.x >= 3:
		queue_free()

func _on_area_2d_body_entered(body):
	if body.get_name() == "Player":
		GlVar.Health -= 1
		var direction = global_position.direction_to(body.global_position)
		var explosion_force = direction * knockback_strength
		body.knockback = explosion_force
