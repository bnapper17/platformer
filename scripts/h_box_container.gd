extends HBoxContainer

var heart_full = preload("res://assets/heart.png")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_simple(value):
	for i in get_child_count():
		get_child(i).visible = value > i

var h1: bool = 1;
var h2: bool = 1;
var h3: bool = 1;

func decrement_heart():
	if ($"1".visible):
		$"1".visible = false;
	elif ($"2".visible):
		$"2".visible = false;
	elif ($"3".visible):
		$"3".visible = false;
	elif ($"4".visible):
		$"4".visible = false;
	elif ($"5".visible):
		$"5".visible = false;
		#change scene
		get_tree().change_scene_to_file("res://scenes/gameover_screen.tscn");
	return;
