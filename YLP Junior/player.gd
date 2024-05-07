extends CharacterBody2D

const SPEED = 1250.0
const JUMP_VELOCITY = -2000
var knockback = Vector2.ZERO
var knock = false
@onready var HealthBar = $Control/TextureProgressBar

var gravity = 6000
var sword = preload("res://Weapons/Sword/sword.tscn")
var fire = preload("res://Weapons/fire_sword.tscn")
var water = preload("res://Weapons/water_sword.tscn")

func _physics_process(delta):
	
	$Control/water/Label.text = "x " + str(GlVar.Elements["Water"])
	$Control/fire/Label.text = "x " + str(GlVar.Elements["Fire"])
	
	if HealthBar.value < GlVar.Health:
		HealthBar.value += 1
	elif HealthBar.value > GlVar.Health:
		HealthBar.value -= 1
	elif HealthBar.value == GlVar.Health:
		pass

	knockback = lerp(knockback, Vector2.ZERO, 0.1)

	if Input.is_action_just_pressed("Attack"):
		add_child(sword.instantiate())

	if Input.is_action_just_pressed("Fire"):
		if GlVar.Elements["Fire"] > 0:
			GlVar.Elements["Fire"] -= 1
			var b = fire.instantiate()
			get_parent().add_child(b)
			b.global_position = self.global_position

	if Input.is_action_just_pressed("Water"):
		if GlVar.Elements["Water"] > 0:
			GlVar.Elements["Water"] -= 1
			var b = water.instantiate()
			add_child(b)
			b.global_position = self.global_position

	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		if Input.is_action_just_pressed("ui_up"):
			velocity.y = JUMP_VELOCITY

	if GlVar.PlDir:
		if Input.is_action_just_pressed("Lighting"):
			Thunder()
		else:
			if !knock:
				velocity.x = GlVar.PlDir * SPEED
				$AnimationPlayer.play("walk")
			else:
				pass
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$Sprite2D.frame = 0

	move_and_slide()
	
	if GlVar.forward == true:
		$Sprite2D.scale.x = 7
	elif GlVar.forward == false:
		$Sprite2D.scale.x = -7

func Thunder():
	if not is_on_floor():
		velocity.x *= 10
		velocity.y = -abs(velocity.x/5)
	else:
		velocity.x *= 50


func _on_texture_progress_bar_value_changed(value):
	knock = true
	if is_on_floor():
		velocity.x += knockback.x
		velocity.y += knockback.y/3
	else:
		
		velocity.x += knockback.x
		velocity.y += knockback.y/2
	await get_tree().create_timer(0.5).timeout
	knock = false
