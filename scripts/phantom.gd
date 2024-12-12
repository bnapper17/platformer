extends Node2D

const SPEED = 45
var direciton = -1
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var killzone: Area2D = $killzone

func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direciton = -1
		animated_sprite.flip_h = false
	if ray_cast_left.is_colliding():
		direciton = 1
		animated_sprite.flip_h = true
	if animated_sprite.animation == "death":
		killzone.set_collision_mask_value(2, false)
		direciton = 0
		
	position.x += direciton * SPEED * delta
