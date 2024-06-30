extends CharacterBody2D
var screen_size = Vector2.ZERO

signal player2score # Called when player2 scores
signal player1score # Called when player1 scores

const Xpos:int = 960 # Used to position the ball to the middle of the screen
const YposLow:int = 780 # Lower bound of the y-coordinate of the ball's starting position
const YposHigh:int = 300 # Upper bound of the y-coordinate of the ball's starting position

const StartingSpeed:int = 500 # Ball's starting speed
const Direction:int = 2 # Used for rng for ball's direction
const SpeedScale:int = -1.1 # Used to increase the speed of the ball per bounce

# Boundary of the screen
const XboundLeft:int = 0
const XboundRight:int = 1920
const YboundUp:int = 0
const YboundDown:int = 1080

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	hide()
	
# Initializing the ball
func start():
	$CollisionShape2D.disabled = false
	
	# Set the postion of the ball to the middle of the screen with varying height
	position = Vector2(Xpos, randi_range(YposHigh, YposLow))
	show()
	
	# Set the velocity and the direction of the ball randomly
	var rng = randi() % Direction
	
	# Want to change the 0 to a -1 to flip the direction
	if(rng == 0):
		rng = -1 # Used to change the direction
		
	# Set the starting speed of the ball
	velocity.x = StartingSpeed * rng	
	velocity.y = randi_range(StartingSpeed * rng, StartingSpeed)
	
# Called when the ball collides with the player
func bounce():
	# Reverse the direction and slightly increase the speed
	velocity.x = velocity.x * SpeedScale
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Bouncing off the top and bottom of the screen
	if((position.y <= YboundUp and velocity.y < 0) or (position.y >= YboundDown and velocity.y > 0)):
		velocity.y = velocity.y * -1	
	
	# Checking if the ball goes offscreen, which indicates a score
	if(position.x < XboundLeft):
		player2score.emit()
	if(position.x > XboundRight):
		player1score.emit()
	
	# Updating position of the ball
	position += velocity * delta
