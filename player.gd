extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -500.0
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func _physics_process(delta): 

	if not is_on_floor():
		velocity.y += gravity * delta
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
	
func _process(delta):
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
		
	if !is_on_floor():
		$AnimatedSprite2D.play("jump")
		
	elif Input.is_action_pressed("move_right"):
		$AnimatedSprite2D.play("run")
		$AnimatedSprite2D.flip_h = false
		
	elif Input.is_action_pressed("move_left"):
		$AnimatedSprite2D.play("run")
		$AnimatedSprite2D.flip_h = true
		
	else:
		$AnimatedSprite2D.play("idle") 
