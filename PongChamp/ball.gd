extends CharacterBody2D
var speed = 400
var screen_size = Vector2.ZERO
var hit = false

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	hide()
	
func start(num):
	$CollisionShape2D.disabled = false
	position = Vector2(960, randi_range(300, 780))
	show()
	var rng = randi() % 2
	if(rng == 0):
		rng = -1
	velocity.x = 500 * rng	
	velocity.y = randi_range(-500, 500)
	
func bounce():
	velocity.x = velocity.x * -1
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if((position.y <= 0 and velocity.y < 0) or (position.y >= 1080 and velocity.y > 0)):
		velocity.y = velocity.y * -1	
		
	position += velocity * delta
