extends AnimatedSprite2D

var bullet_impact_effect = preload("res://player/bullet_impact_effect.tscn")

var speed : int = 600
var direction : int
var damage_amount : int = 1
var move_x_direction : bool

func _physics_process(delta):
	# To move the bullet both horizontally and vertically
	if move_x_direction:
		move_local_x(direction * speed * delta)
	else:
		move_local_y(direction * speed * delta)

func _on_timer_timeout():
	queue_free()


func _on_hitbox_area_entered(area:Area2D):
	if "Attack" not in area.name:
		bullet_impact()


func _on_hitbox_body_entered(body):
	bullet_impact()
	
func get_damage_amount() -> int:
	return damage_amount

func bullet_impact():
	var bullet_impact_effect_instance = bullet_impact_effect.instantiate() as Node2D
	bullet_impact_effect_instance.global_position = global_position
	get_parent().add_child(bullet_impact_effect_instance) # get again the instantiation
	queue_free()
