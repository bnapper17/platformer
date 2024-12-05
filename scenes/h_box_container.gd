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
		h1 = false;
		print("h1 should be false\n");
		if (!h1):
			print("h1 is still true\n");
		$"1".visible = false;
	elif (h2):
		h2 = false;
		$"2".visible = false;
	elif (h3):
		h3 = false;
		$"3".visible = false;
		get_tree().change_scene_to_file("res://title_screen.tscn")
	return;
