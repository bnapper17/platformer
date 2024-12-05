extends Area2D


# Called when the player enters the goal area
func _on_body_entered(body):
	if body.is_in_group("Player"):  # Player reaching the goal
		
		#var remaining_time = timer.time_left  # Get the remaining time

		#Switch to the finished scene.
		get_tree().change_scene_to_file("res://scenes/finished_screen.tscn")
		
		
		

'''
NOTE: Pass score (time) to finished_screen
'''
