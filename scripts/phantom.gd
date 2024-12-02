extends Node2D

const SPEED = 45
var direciton = -1
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direciton = -1
		animated_sprite.flip_h = false
	if ray_cast_left.is_colliding():
		direciton = 1
		animated_sprite.flip_h = true
	position.x += direciton * SPEED * delta