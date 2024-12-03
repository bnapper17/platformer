extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $"../AnimatedSprite2D"
@onready var timer: Timer = $Timer

@onready var phantom: Node2D = $".."


func _on_body_entered(body: Node2D) -> void:
	animated_sprite_2d.play("death")
	timer.start()
	
func _on_timer_timeout() -> void:
	phantom.queue_free()
	
