extends Area2D

@onready var timer: Timer = $Timer
@onready var phantom_sprite: AnimatedSprite2D = $"../AnimatedSprite2D"

@onready var phantom: Node2D = $".."


func _on_body_entered(body: Node2D) -> void:
	if phantom_sprite and phantom_sprite.animation == "death":
		pass
	else:
		Engine.time_scale = 0.5
		body.get_node("CollisionShape2D").queue_free()
		timer.start()
	


func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
