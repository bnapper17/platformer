extends Area2D

@onready var timer: Timer = $Timer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _on_body_entered(body: Node2D) -> void:
	Engine.time_scale = 0.5
	#this clears the state
	#body.get_node("CollisionShape2D").queue_free()
	
	if ($"../player/Camera2D/Ui" != null):
		$"../player/Camera2D/Ui".decrement_heart();
	elif ($"../../player/Camera2D/Ui" != null):
		$"../../player/Camera2D/Ui".decrement_heart();
	else:
		print("WHY CANT THIS FIND THE FUNCTION");
		var z: int = 0;#i have no clue how to throw, so this mess instead
		print(0/z);

	timer.start()
	
	#this is getting ridicilous GD
	if (get_node("..").has_method("reset_player_pos")):
		$"..".reset_player_pos();
	elif (get_node("../..").has_method("reset_player_pos")):
		$"../..".reset_player_pos();
	else:
		print("WHY CANT THIS FIND THE FUNCTION");
		var z: int = 0;
		print(0/z);

func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	#get_tree().reload_current_scene()
