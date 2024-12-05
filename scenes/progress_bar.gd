extends ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	value = $game_timer.time_left / $game_timer.wait_time * 100;
	pass


func _on_timer_timeout() -> void:
	#add death animation
	pass # Replace with function body.
