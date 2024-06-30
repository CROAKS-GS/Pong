extends Area2D

signal playerhit # Signal that indicates that the player hit the ball

var screen_size = Vector2.ZERO
const movementSpeed:int = 1000 # movement speed of the player 
const playerHitbox:int = 62.5 # Used so that the player does not clip the top or the bottom of the screen

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	hide()	# Hide the player during the start menu

# Start function that places the player on the starting position
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	
	# Player1 movement
	if Input.is_action_pressed("player1_down"):
		velocity.y += movementSpeed
	if Input.is_action_pressed("player1_up"):
		velocity.y -= movementSpeed
		
	# Changing the velocity and making sure the player stays in-bounds 
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, playerHitbox, screen_size.y - playerHitbox)

# Called when the ball collides with the player
func _on_body_entered(body):
	playerhit.emit() 
