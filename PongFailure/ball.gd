extends CharacterBody2D
const speed: Vector2 = Vector2(500, 500)
var screen_size: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	hide()
	
func start():
	$CollisionShape2D.disabled = false
	position = Vector2(screen_size.x / 2, randi_range(screen_size.y / 3, screen_size.y - (screen_size.y / 3)))
	show()
	# takes the value of either 1 or -1
	var x_direction: int = ((randi() % 2) * 2) - 1
	velocity.x = speed.x * x_direction
	velocity.y = randi_range(-1 * speed.y, speed.y)
	
func bounce():
	velocity.x *= -1
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if((position.y <= 0 and velocity.y < 0) or (position.y >= screen_size.y and velocity.y > 0)):
		velocity.y = velocity.y * -1
	
	position += velocity * delta
