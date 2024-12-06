extends Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start();
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timeout() -> void:
	print("Time out");
	#play death scene
	
	$"../death_audio_stream".play();
	
	#rest of code in next function

	pass # Replace with function body.


func _on_death_audio_stream_finished() -> void:
		#var death_scene = load("res://scenes/death_screne.tscn").instantiate();
	#pass score
	#death_scene.set_score(50);#change to dynamic score
	#get_tree().current_scene.add_child(death_scene);
	#transfer control
	#get_tree().current_scene.add_child(death_scene)
	#no clue how to pass the score???
	get_tree().change_scene_to_file("res://scenes/gameover_screen.tscn")
	pass # Replace with function body.
