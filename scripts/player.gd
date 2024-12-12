extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -400.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var attack_collision: CollisionShape2D = $attack_collision
@onready var player_collision: CollisionShape2D = $player_collision

	
	
func _physics_process(delta: float) -> void:
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var name = collision.get_collider_id()
		print(name)
		
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	#set direction
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	#set animations
	if direction == 0:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("move")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if Input.is_action_pressed("attack"):
		attack_collision.set_deferred("disabled", false)
		#player_collision.set_deferred("disabled", true)
		animated_sprite.play("attack")
		set_collision_layer_value(2, false)
		set_collision_layer_value(3, true)
		
	if Input.is_action_just_released("attack"):
		attack_collision.set_deferred("disabled", true)
		#player_collision.set_deferred("disabled", false)
		set_collision_layer_value(2, true)
		set_collision_layer_value(3, false)
			
		

	move_and_slide()
