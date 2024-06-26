extends CharacterBody2D

const SPEED = 300.0
const ACCELERATION = 800.0
const FRICTION = 1000.0

@onready var collision_polygon_2d = $CollisionPolygon2D
@onready var polygon_2d = $Polygon2D

# Called when the node enters the scene tree for the first time.
func _ready():
	collision_polygon_2d.polygon = polygon_2d.polygon

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var input_axis = Input.get_axis("ui_left", "ui_right")
	handle_movement()
	handle_acceleration(input_axis, delta)
	apply_friction(input_axis, delta)
	move_and_slide()

func handle_movement():
	if Input.is_action_just_pressed("ui_left"):
		velocity.x = -SPEED
		print("Moving left")
	if Input.is_action_just_pressed("ui_right"):
		velocity.x = SPEED
		print("Moving right")

func handle_acceleration(input_axis, delta):
	if input_axis != 0:
		velocity.x = move_toward(velocity.x, SPEED * input_axis, ACCELERATION * delta)

func apply_friction(input_axis, delta):
	if input_axis == 0:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)
