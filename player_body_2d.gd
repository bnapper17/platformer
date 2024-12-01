extends CharacterBody2D

# Declare member variables
var velocity = Vector2()
var speed = 200
var jump_force = -400
var gravity = 20
var is_on_ground = false

# Reference to the AnimationPlayer node
onready var anim_player = $AnimationPlayer
onready var sprite = $Sprite2D

# Load the sprite
var player_sprite = load("res://Player#1.png")

# Assign the sprite to the Sprite2D node
func _ready():
	sprite.texture = player_sprite

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# Apply gravity
	if not is_on_ground:
		velocity.y += gravity * delta

	# Handle left and right movement
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
		sprite.flip_h = false
		anim_player.play("run")
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
		sprite.flip_h = true
		anim_player.play("run")
	else:
		velocity.x = 0
		anim_player.play("idle")

	# Handle jumping
	if is_on_ground and Input.is_action_just_pressed("ui_up"):
		velocity.y = jump_force
		is_on_ground = false
		anim_player.play("jump")

	# Move the player
	velocity = move_and_slide(velocity, Vector2.UP)

	# Check if the player is on the ground
	if is_on_floor():
		is_on_ground = true
		velocity.y = 0
	else:
		is_on_ground = false

# Function to handle player death
func die():
	print("Player has died")
	queue_free()
